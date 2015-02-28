
//----------------------------------------------------
// DT Bootcamp 2013, Parsons the New School for Design. 
// Sunday, August 4th.
//
// Making balls bounce up and down on a mouse click.
// Sultan
//----------------------------------------------------



void setup() {
  
  size(400, 500);
  smooth();
  noStroke();
}

float y =50; // Declaring & defining y
float speedY=10; // Declaring & defining speed
int mousePress;

void draw() {
  background(0);
  for (int i = 0; i < 50; i++) { // Creating 10 balls with a space of 10px
    fill(255);
    ellipse(i*20, y, 10, 10);
  }
  if (mousePress>=1){
    
      y=y+speedY; // moving the ball
    if(((y> 500-10) && (speedY > 0))||((y <= 10) && (speedY <= 0))) { //Setting the boundaries on top and bottom
    speedY = -speedY; //flip (Code from Dylan Shad)
    }

  }
}

  void mouseClicked() { // Changing mouse pressed to just a mouse clicked.
    mousePress=mousePress+1;
  }
