
/* 

  Liz Rutledge
  August 8, 2011
  Nested If-Statements

*/

//the player's lottery number
int lotteryNumber;

//boolean for if they're a winner at all (multiple prize tiers)
boolean isWinner;
PFont font;

void setup() {
  size(500,400);
  smooth();
  
  //this particular dude's number is 112
  lotteryNumber = 118;
  
  //he's also already a winner
  isWinner = false;

  //just making a font so we can display text
  font = createFont("Arial", 32);
  textFont(font, 32);
  textAlign(CENTER);
}

void draw() {
  //if a winner in general
  if(isWinner){
    
    /******BEGIN INNER IF STATEMENT********/
    text("you get a prize!", width/2, height/2);
    // if a winner AND lottery number is 112 gets first prize
    
    if(lotteryNumber == 112) {
      //add 60 to y position so that the text prints 60px below the first text
      text("first prize!", width/2, height/2 + 60);
    }
    // if winner and NOT 112, but IS equal to 118
    else if(lotteryNumber == 118) {
      text("second prize!", width/2, height/2 + 60);
    }
    //if a winner but lottery number is NOT 112
    else {
      text("it's just a lame one though.", width/2, height/2 + 60);
    }
    /******END INNER IF STATEMENT********/    
    
    ellipse (40, 40, 20, 20);
  
  }
  // if not a winner at all
  else {
    text("WOMP you lose.", width/2, height/2); 
  }
}

