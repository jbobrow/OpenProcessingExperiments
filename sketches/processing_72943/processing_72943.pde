
//Thomas Wassel
//Norm Krumpe
//CSE 14H
//02 Oct 2012

//this is the value the user choses by typing a number
int bet = 0;
//this is a random value between 1 and 4 which the player tries to guess
int houseValue = 0;

//setup draws the table, numbers the squares and prints instructions for how to play
void setup() {
  size(500, 500);
  drawTable();
  writeText();
  makeYourBet();
}

// draw needs to be here so keyPressed works
void draw() {

}

// color the quadrants
void drawTable() { 
  strokeWeight(10);
  //This makes the upper left square and colors it red
  fill(255, 0, 0);
  rect(0, 0, width / 2, height / 2);
  //this makes the upper right square and colors it blue
  fill (0, 0, 255);
  rect(width / 2, 0, width, height / 2);
  //this makes the lower left square and colors it gold
  fill(255, 215, 0);
  rect(0, height / 2, width / 2, height);
  //this makes the lower right square and colors it green
  fill(50, 205, 50);
  rect(width / 2, height / 2, width, height);
}
// number the squared clockwise starting in the upper left corner 
void writeText() {
  fill(0);
  //number the upper left square '1'
  text(1, width / 4, height / 4); 
  //numbers the upper right square '2'
  text(2, 3 * width / 4, height / 4); 
  //numbers the lower left square '3'
  text(3, width / 4, 3 * height / 4); 
  //numbers the the lower right square '4'
  text(4, 3 * width / 4, 3 * height / 4);
}

// press either "1", "2", "3" or "4" to guess which one will be a winner
void makeYourBet() {
  System.out.println("To bet on a color, type the corresponding number");
}

//This assigns 'bet' a value depending on what you press. 
//If you press a key other than 1-4, it will assign a value of zero and you will lose.
void keyPressed() {
 if (key == '1') { 
      bet = 1;
    }
   else if ( key == '2') {
      bet = 2;
    }
   else if (key == '3') {
      bet = 3;
    }
    else if (key == '4') {
      bet = 4;
    }
    else
      bet = 0;
     println("You bet " + bet);
     calcHouseValue(); 
     println("The winning number is " + houseValue);
     playRoulette();
}

//generate a value to compare to the users bet
int calcHouseValue() {
  houseValue = (int) random(1, 5);
  return houseValue;
}

//test if the 'bet' equals the 'houseValue' and tell the user the outcome
void playRoulette() { 
  //If the user is a winner this number multiplied by 'bet' equals the winnings
  //If the user is a loser, he or she doesn't win and it prints a statement saying sorry 
  final int WINNINGS_MULTIPLYER = 2;
  if (houseValue == bet) {
    System.out.println("You are a WINNER! You won $" + bet * WINNINGS_MULTIPLYER);
  }

  else { 
    System.out.println("Sorry, better luck next time");
  }
}


