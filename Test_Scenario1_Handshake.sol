pragma solidity ^0.4.25;

import "./Scenario1_Handshake.sol";

contract Test_Scenario1_Handshake is Scenario1_Handshake {

  function test_PostTask() {
      this.postTask.value(5000)(1);
      assert(tasks[1].taskId == 1);
      assert(tasks[1].owner == address(this));
      assert(tasks[1].amount == 5000);
      assert(tasks[1].isAwarded == false);
      assert(tasks[1].isConfirmed == false);
      assert(tasks[1].isPresent == true);
    }

    function test_PickTask() {
      assert(tasks[1].evaluator == 0x0000000000000000000000000000000000000000);
      pickTask(1);
      assert(tasks[1].evaluator == msg.sender);
    }

    function test_SubmitResult() {
      assert(tasks[1].result == 0x0000000000000000000000000000000000000000000000000000000000000000);
      submitResult(1, 0x1234);
      assert(tasks[1].result == 0x1234);
    }

    function test_ConfirmResult() {
      assert(tasks[1].isConfirmed == false);
      this.confirmResult(1);
      assert(tasks[1].isConfirmed == true);
    }

    function test_AwardToken() {
      //contractAddress = msg.sender;
      assert(tasks[1].isAwarded == false);
      awardToken(1);
      assert(tasks[1].isAwarded == true);
    }
}
