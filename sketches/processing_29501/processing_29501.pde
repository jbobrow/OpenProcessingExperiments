


// AI for Move of Computer (PC)

// see http://en.wikipedia.org/wiki/Tic-tac-toe#Strategy

//A player can play perfect tic-tac-toe (win or draw) given they move according to the 
//highest possible move from the following table.[4]
//(Further considerations have to be made for the first two moves - see Wikipedia)
// 
//Win: If the player has two in a row, play the third to get three in a row. - done. 
//Block: If the [opponent] has two in a row, play the third to block them.  - done. 
//Fork: Create an opportunity where you can win in two ways. - done 
//Block opponent's Fork: 
//   Option 1: Create two in a row to force the opponent into defending, as long as it doesn't 
//    result in them creating a fork or winning. 
//    For example, if "X" has a corner, "O" has the center, and "X" has the opposite 
//    corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario 
//    creates a fork for "X" to win.) - done
//   Option 2: If there is a configuration where the opponent can fork, block that fork. - done
//Center: Play the center. - done
//Opposite corner: If the opponent is in the corner, play the opposite corner.  - done
//Empty corner: Play in a corner square.  - done
//Empty side: Play in a middle square on any of the 4 sides.  - done

// =================================================================================
// evaluate typeOfAI_Tournament : which type plays? 

void PC_Move() {
  // First step: how many players?
  switch(AnzahlSpieler) {
  case 0:
    PC_MoveAutoPlay() ; // 0 = PC against PC 
    break;
  case 1:
    PC_MovePlayAgainstHuman();  // 1 = PC against human
    break; 
  case 2:  // 2 = human against human
    // do nothing: 2 humans play
    break;    
  default:
    println ("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    println ("Missing case in AnzahlSpieler-switch 40   ++++++++++++++++++++++");
    println ("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");  
    exit();  
    break;
  } // switch
} // func

void PC_MovePlayAgainstHuman() {
  // Second step I.: type of AI?
  switch(typeOfAI) {
  case typePC_Move_Random:
    AdditionalPlayerInformation = " (Random)";     
    PC_Move_Random();
    break; 
  case typePC_Move_AI:
    AdditionalPlayerInformation = " (Normal AI)"; 
    PC_Zug_AI();
    break;       
  case typePC_Move_Mediocre:
    AdditionalPlayerInformation = " (Mediocre)"; 
    PC_Zug_Mediocre();
    break;
  default: 
    println ("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    println ("Missing case in typeOfAI-switch 59   +++++++++++++++++++++++++");
    println ("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");  
    exit();
    break;
  } // switch
} // func 

void PC_MoveAutoPlay() {    
  // Second step II.: Tournament: type of AI?  
  switch(typeOfAI_Tournament) {
  case typePC_Move_Random_AI: 
    // X begins and X is Random, while o is AI.
    PC_Move_Random_AI();   //  Random vs. AI
    break;
  case typePC_Move_AI_Random: 
    PC_Move_AI_Random();  // AI vs. Random 
    break;
  case typePC_Move_AI_AI:
    PC_Move_AI_AI() ;   // AI vs. AI 
    break; 
  case typePC_Move_Random_Random:
    PC_Move_Random_Random(); // Random vs. Random
    break; 
  case typePC_Move_Mediocre_AI:
    PC_Move_Mediocre_AI(); // Med. vs. AI
    break; 
  case typePC_Move_AI_Mediocre:
    PC_Move_AI_Mediocre(); //  AI vs. Med.
    break;     
  default: 
    println ("Error in switch(typeOfAI_Tournament) (45). ");
    exit();
    break;
  } // switch
}

// =================================================================================
// from here on organising Games (AI vs. Random, Random vs. AI, AI vs. AI etc.): 

void PC_Move_Random_AI() {
  // Step Three: organising Games
  // X begins and X is Random, while o is AI. 
  // o does not play correct
  if (SpielerAmZug.equals("X") ) {
    AdditionalPlayerInformation = " (Random)";     
    PC_Move_Random();
  } 
  else 
  {
    AdditionalPlayerInformation = " (Normal AI)"; 
    PC_Zug_AI();
  }
} // func 

void PC_Move_AI_Random() {
  // X begins and X is AI, while o is Random
  // AI plays correct 
  if (SpielerAmZug.equals("X") ) {
    AdditionalPlayerInformation = " (Normal AI)"; 
    PC_Zug_AI();
  } 
  else 
  {
    AdditionalPlayerInformation = " (Random AI)";     
    PC_Move_Random();
  }
} // func 

void PC_Move_AI_AI() {
  // both X and o are AI 
  AdditionalPlayerInformation = " (Normal AI)";   
  PC_Zug_AI();
} // func 

void PC_Move_Random_Random() {
  // both X and o are Random
  AdditionalPlayerInformation = " (Random)";   
  PC_Move_Random();
} // func 

void PC_Move_Mediocre_AI() {
  // X begins and X is Mediocre, while o is AI
  // AI plays correct 
  if (SpielerAmZug.equals("X") ) {
    AdditionalPlayerInformation = " (Mediocre)"; 
    PC_Zug_Mediocre();
  } 
  else 
  {
    AdditionalPlayerInformation = " (AI)";     
    PC_Zug_AI();
  }
} // func 

void PC_Move_AI_Mediocre() {
  // X begins and X is Mediocre, while o is AI
  // AI plays correct 
  if (SpielerAmZug.equals("X") ) {
    AdditionalPlayerInformation = " (AI)";     
    PC_Zug_AI();
  } 
  else 
  {
    AdditionalPlayerInformation = " (Mediocre)"; 
    PC_Zug_Mediocre();
  }
} // func 

// =================================================================================
// from here on: The actual Players / Move Decisions
// Step Four. 

void PC_Move_Random () {

  int j=0;
  int i = int(random (0,9));

  AdditionalMoveReason = " (Random)"; 
  while ((!rectButtons[i].Text.equals("")) || (j<10 )) {
    i = int(random (0,9));
    j++;
    if (j>1000) { 
      break;
    }
  }
  if (rectButtons[i].Text.equals("")) { 
    PC_Move_Execute (i);
  } // if 
  else { 
    println("Random: Failed67.");
    // force draw
    status=statusDraw;
    println("Failed PC MOVE RANDOM");
    exit();
  }
}

void PC_Zug_AI () {

  // On the whole the AI checks the necessity of moves, 
  // e.g. can it win or can it hinder the opponent to win.  

  // The order of those checks is also their priority 
  // (check first whether you can win and then whether 
  // you can hinder a move is more wise than vice versa).

  // The checks are usually performed by functions with names 
  // like "IsItPossibleTo...". 
  // They return the value ("MyPos") of the field to make the Move
  // on or "-1" if the criteria doesn't fit (he then tries 
  // the next criteria).
  // The checks are performed not in this tab/file but in "AIMove2".  
  // The variable "MoveDone" monitors whether the move 
  // has already been done. 
  // At the beginning the first and second move are checked 
  // separately. 

  if (SpielerAmZug.equals("X") ) {
    PC_Zug_AI_X();
  } 
  else 
  {
    PC_Zug_AI_O();
  }
} // func 

// ---------------------------------------------------------------------

void PC_Zug_AI_X() {

  // int j=0;
  // int i = int(random (0,9));
  int MyPos = -1; 
  boolean MoveDone = false; 

  // first move (when X starts and X is PC) **********************
  if (countMoves () == 0) {
    // a corner mark (upper left corner)
    // PC_Zug_Setzen (2);  // OR 
    PC_Move_Random();
    MoveDone = true;
  }

  // second move by PC *******************************************
  // A respond to X's opening mark 
  // Player O must always respond to a center opening with a corner mark. 
  if (countMoves () == 1) {
    if (MoveDone == false) {
      if (Spielfeld[4].equals(OpponentOf(SpielerAmZug))) { 
        // a corner mark
        AdditionalMoveReason = " (Corner Mark)"; 
        PC_Move_Execute (2);
        MoveDone = true;
      }
    }
    if (MoveDone == false) {
      // Player O must always respond to a corner opening 
      // with a center mark 
      if (Spielfeld[0].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[2].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[6].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[8].equals(OpponentOf(SpielerAmZug)) ) 
      { 
        // take center
        MyPos = 4; 
        if (Spielfeld[MyPos].equals("")) {
          AdditionalMoveReason = " (Center Mark)"; 
          PC_Move_Execute (MyPos);
          MoveDone = true;
        }
      }
    }
  } // if (countMoves () == 1) { 

  // All other Moves after 1st and 2nd Move ****************************

  // Winning?
  if (MoveDone == false) {
    MyPos = IsItPossibleToWin (SpielerAmZug) ; 
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Winning)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    }
  }

  // Hindering the opponent / block winning move
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToHinderOpponent (OpponentOf(SpielerAmZug));
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Hindering)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // Fork: Create an opportunity where you can win in two ways. 
  // threshhold = 2
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork(SpielerAmZug,2,false);
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Fork 233)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  }

  // OpponentOf  -----------------------------------------------
  // Fork: Hinder opponent to Create an opportunity 
  // where he can win in two ways. 
  // threshhold = 2
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (OpponentOf(SpielerAmZug),2,false);
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (hinder Fork)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  }

  // take middle position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeMiddlePosition();
    if (MyPos!=-1) {
      AdditionalMoveReason = " (Center Mark)"; 
      if (Spielfeld[MyPos].equals("")) { 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // Look for a row with 1 other own stone and two empty.
  // This results in a row with two own stones, threatening to win. 
  // threshhold = 1
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (SpielerAmZug,1,false);
    if (MyPos!=-1) {
      AdditionalMoveReason = " (2 stones in a row 276)"; 
      if (Spielfeld[MyPos].equals("")) { 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if

  // take opposite corner position from opponent
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeOppositeCorner();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (opposite corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take corner position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeCornerPosition();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take empty side position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeEmptySidePosition();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (side)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // random move - last way out...
  if (MoveDone == false) {
    PC_Move_Random();
    MoveDone = true;
  } // if
} // func 

// ===========================================================

void PC_Zug_AI_O() { 

  // int j=0;
  // int i = int(random (0,9));
  int MyPos = -1; 
  boolean MoveDone = false; 

  // first move (when X starts and X is PC/AI) **********************
  if (countMoves () == 0) {
    // He can play randomly (1) or set on a corner mark (upper left corner) (2)
    // (1)
    PC_Move_Random ();  // OR 
    // (2)
    // PC_Zug_Setzen (2);  
    MoveDone = true;
  }

  // second move by PC (when X starts and o is PC/AI) *******************
  // An AI (o) respond to X's opening mark. 
  if (countMoves () == 1) {

    /*
    // take opposite corner position from opponent
     if (MoveDone == false) {
     MyPos = -1;
     MyPos=IsItPossibleToTakeOppositeCorner();
     if (MyPos!=-1) {
     if (Spielfeld[MyPos].equals("")) { 
     AdditionalMoveReason = " (opposite corner)"; 
     PC_Zug_Setzen (MyPos);
     MoveDone = true;
     } // if
     } // if
     } // if 
     */

    // An edge opening must be answered either with a center mark or (....)
    if (MoveDone == false) {
      if (Spielfeld[1].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[3].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[5].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[7].equals(OpponentOf(SpielerAmZug)) ) 
      { 
        // take center
        MyPos = 4; 
        if (Spielfeld[MyPos].equals("")) {
          AdditionalMoveReason = " (Center Mark)"; 
          PC_Move_Execute (MyPos);
          MoveDone = true;
        }
      }
    } // if

    if (MoveDone == false) {
      // if X has center 
      if (Spielfeld[4].equals(OpponentOf(SpielerAmZug))) { 
        // o must take a corner mark
        AdditionalMoveReason = " (Corner Mark)"; 
        PC_Move_Execute (2);
        MoveDone = true;
      }
    }
    if (MoveDone == false) {
      // Player O must always respond to a corner opening 
      // with a center mark 
      if (Spielfeld[0].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[2].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[6].equals(OpponentOf(SpielerAmZug)) || 
        Spielfeld[8].equals(OpponentOf(SpielerAmZug)) ) 
      { 
        // take center
        MyPos = 4; 
        if (Spielfeld[MyPos].equals("")) {
          AdditionalMoveReason = " (Center Mark)"; 
          PC_Move_Execute (MyPos);
          MoveDone = true;
        }
      }
    } // if
  } // if (countMoves () == 1) { 

  // All other Moves after 1st and 2nd Move: ****************************

  // Winning?
  if (MoveDone == false) {
    MyPos = IsItPossibleToWin (SpielerAmZug) ; 
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Winning)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    }
  }

  // Hindering the opponent / block winning move
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToHinderOpponent (OpponentOf(SpielerAmZug));
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Hindering Win)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // Fork: Create an opportunity where you can win in two ways. 
  // threshhold = 2
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (SpielerAmZug,2,false);
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Fork)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  }

  // Fork: Hinder opponent to Create a Fork
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (OpponentOf(SpielerAmZug),2,false);
    if (MyPos!=-1) {   

      String ResultOfMarks = StringOf_IsItPossibleToMakeAFork (OpponentOf(SpielerAmZug),2);
      if (ResultOfMarks.length()>1) {

        // Look for a row with 1 other own stone and two empty.
        // This results in a row with two own stones, threatening to win. 
        // threshhold = 1
        if (MoveDone == false) {
          MyPos = -1;
          MyPos = IsItPossibleToMakeAFork (SpielerAmZug,1,true);
          if (MyPos!=-1) {
            AdditionalMoveReason = " (2 stones in a row 471)"; 
            if (Spielfeld[MyPos].equals("")) { 
              PC_Move_Execute (MyPos);
              MoveDone = true;
            } // if
          } // if
        } // if
      }
      else 
      {
        // OpponentOf  -----------------------------------------------
        // Fork: Hinder opponent to Create an opportunity 
        // where he can win in two ways. 
        // threshhold = 2
        if (MoveDone == false) {
          MyPos = -1;
          MyPos = IsItPossibleToMakeAFork (OpponentOf(SpielerAmZug),2,false);
          if (MyPos!=-1) {
            if (Spielfeld[MyPos].equals("")) { 
              AdditionalMoveReason = " (hinder Fork)"; 
              PC_Move_Execute (MyPos);
              MoveDone = true;
            } // if
          } // if
        } // if
      } // else
    } // if
  } // if

  // Look for a row with 1 other own stone and two empty.
  // This results in a row with two own stones, threatening to win. 
  // threshhold = 1
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (SpielerAmZug,1,true);
    if (MyPos!=-1) {
      AdditionalMoveReason = " (2 stones in a row)"; 
      if (Spielfeld[MyPos].equals("")) { 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take middle position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeMiddlePosition();
    if (MyPos!=-1) {
      AdditionalMoveReason = " (Center Mark)"; 
      if (Spielfeld[MyPos].equals("")) { 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 


  // take opposite corner position from opponent
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeOppositeCorner();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (opposite corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take corner position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeCornerPosition();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take empty side position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeEmptySidePosition();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (side)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // random move - last way out...
  if (MoveDone == false) {
    PC_Move_Random();
    MoveDone = true;
  } // if
} // func 


void PC_Zug_Mediocre() {

  // int j=0;
  // int i = int(random (0,9));
  int MyPos = -1; 
  boolean MoveDone = false; 

  // first move (when X starts and X is PC) **********************
  if (countMoves () == 0) {
    // a corner mark (upper left corner)
    // PC_Zug_Setzen (2);  // OR 
    PC_Move_Random();
    MoveDone = true;
  }

  // A respond to X's opening mark 
  // Player O must always respond to a center opening with a corner mark. 
  if (MoveDone == false) {
    if (Spielfeld[4].equals(OpponentOf(SpielerAmZug))) { 
      // a corner mark
      AdditionalMoveReason = " (Corner Mark)"; 
      PC_Move_Execute (2);
      MoveDone = true;
    }
  }

  if (MoveDone == false) {
    // Player O must always respond to a corner opening 
    // with a center mark 
    if (Spielfeld[0].equals(OpponentOf(SpielerAmZug)) || 
      Spielfeld[2].equals(OpponentOf(SpielerAmZug)) || 
      Spielfeld[6].equals(OpponentOf(SpielerAmZug)) || 
      Spielfeld[8].equals(OpponentOf(SpielerAmZug)) ) 
    { 
      // take center
      MyPos = 4; 
      if (Spielfeld[MyPos].equals("")) {
        AdditionalMoveReason = " (Center Mark)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      }
    }
  }

  // Winning?
  if (MoveDone == false) {
    MyPos = IsItPossibleToWin (SpielerAmZug) ; 
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Winning)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    }
  }

  // Hindering the opponent / block winning move
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToHinderOpponent (OpponentOf(SpielerAmZug));
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Hindering)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // Fork: Create an opportunity where you can win in two ways. 
  // threshhold = 2
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork(SpielerAmZug,2,false);
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (Fork 233)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  }

  // OpponentOf  -----------------------------------------------
  // Fork: Hinder opponent to Create an opportunity 
  // where he can win in two ways. 
  // threshhold = 2
  if (MoveDone == false) {
    MyPos = -1;
    MyPos = IsItPossibleToMakeAFork (OpponentOf(SpielerAmZug),1,false); // 1 (wrong) or 2 
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (hinder Fork)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  }

  // take middle position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeMiddlePosition();
    if (MyPos!=-1) {
      AdditionalMoveReason = " (Center Mark)"; 
      if (Spielfeld[MyPos].equals("")) { 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take opposite corner position from opponent
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeOppositeCorner();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (opposite corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // take corner position
  if (MoveDone == false) {
    MyPos = -1;
    MyPos=IsItPossibleToTakeCornerPosition();
    if (MyPos!=-1) {
      if (Spielfeld[MyPos].equals("")) { 
        AdditionalMoveReason = " (corner)"; 
        PC_Move_Execute (MyPos);
        MoveDone = true;
      } // if
    } // if
  } // if 

  // random move - last way out...
  if (MoveDone == false) {
    PC_Move_Random();
    MoveDone = true;
  } // if
} // func


