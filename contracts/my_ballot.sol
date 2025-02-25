// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.21;

contract Ballot {
    struct Voter {
        uint weight; // 计票权重
        bool voted; // 是否投票
        address delegate; // 被委托人地址
        uint vote; // 投票提案编号
    }

    // 提案类型
    struct Proposal {
        uint voteCount; // 投票数
        bytes32 name; // 简称
    }

    address public chairperson; // 主席

    mapping(address => Voter) public voters; // 投票者
    
    Proposal[] public proposals; // 提案

    // 为 proposal 中的每个提案 创建一个新的投票表决
    constructor(bytes32[] memory proposalNames)  {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        // 创建一个新的propasal 对象并把它添加到数组中
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                voteCount: 0,
                name: proposalNames[i]
            }));
        }
    }

    // 给予 voter 投票权
    function giveRightToVote(address voter) public {

      require( msg.sender == chairperson,"only chairperson can give right to vote.");
      require( !voters[voter].voted,"the voter already voted." );
      require(voters[voter].weight == 0);
      voters[voter].weight = 1;
    }

    // 把你的投屏委托给投票者
    function delegate(address to) public {
      //传引用
      Voter storage sender = voters[msg.sender];
      require(!sender.voted, "you already voted.");  
    
      require(to != msg.sender, "not selfdestruction.");

      // 开始委托  
      while (voters[to].delegate != address(0)) {
          to = voters[to].delegate;
         // 避免循环委托
          require(to != msg.sender, "not selfdestruction.");
      }

    //   send是一个引用 相当于对 voters[to] 进行修改
      sender.voted = true;
      sender.delegate = to;
      Voter storage delegate_ = voters[to];
      if(delegate_.voted) {
          proposals[delegate_.vote].voteCount += sender.weight;
      } else {
          delegate_.weight += sender.weight;    
      }
      
    }

    // 把你的票投给委托者
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Aleadey voted.");
        sender.voted = true;
        sender.vote = proposal;

        // 如果 `proposal` 超出了数组的范围，这行代码会自动抛出异常。
        // 访问数组元素时，如果索引超出了数组的范围，
        proposals[proposal].voteCount += sender.weight;
    }

    // 计算投票结果
    function winningProposal() public view returns(uint winningProposal_) {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            // 如果当前提案的票数大于 winningVoteCount，
            // 则将 winningVoteCount 设置为当前提案的票数，
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            } 
        }  
    }

    // 查看提案名称
    function winnerName() public view returns (bytes32 winnerName_) {
        winnerName_ = proposals[winningProposal()].name;
    }


}