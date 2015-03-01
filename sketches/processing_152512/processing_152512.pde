
/* Future Lean Creative Coding Week 2
Activity 2.4 Looping and Repeating
Recreating "25 Squares" */

int HowManySquares = 5; //How May rows and colums
int gap = 3; //Gap Between Squares
int ProbabilityOfRed = 20; //Probability of Red Square (input %)

void setup () {
  size (600, 600);
  rectMode (CORNER);
  noStroke ();
  frameRate (1);
}

void draw () {
  background (227, 238, 242); //Make Screen Grey
  float SqSize = (width - 50 - (HowManySquares +1) * gap) / (int) HowManySquares;

  for (int i=0; i<HowManySquares; i++) { //Row counter
      for (int j=0; j<HowManySquares; j++) { //Column Counter
      
      int colour;
      colour = (int) random (100);
      
      if (colour < ProbabilityOfRed) { //Start the if
          fill (240,37,37,200);
      } // End the if
      else { //Start the else
          fill (95,18,18,200);
      } // End the else
        float RndXOffset = random (20);
        float RndYOffset = random (20);
      rect (10 + RndXOffset + gap * (i+1) + SqSize * i, 10 + RndYOffset + gap * (j+1) + SqSize * j, SqSize, SqSize);
      }
  }
} 


