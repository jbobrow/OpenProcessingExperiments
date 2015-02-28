
/* A Twist to the City Code, that randomizes the Sun's placement/size 
as well as the building's positions in the foreground.*/


int xPos = int(random(10, 400));
int yPos = int(random(10, 400));
int Sun = int(random(10, 100));

void setup() {
  size(400,400); //Makes the window
  background(97, 199, 203); //Makes the sky
  
  
  if (yPos < 140) {
    background(97, 199, 203);
  } else if ((yPos > 140) && (yPos < 300)) {
    background(19, 154, 160);
  } else {
    background(0, 74, 77);
  }
  //Controls the "time of day" or background.


  fill(255,187,0); // Orange
  ellipse(xPos, yPos, Sun, Sun); //Makes the Sun
  // Randomizes Position of the Sun.
  // Randomizes the size of the Sun.
  
  
  
  fill(50); // Grey
  rect(0, 340, width, 60); //Makes the Floor
  
  
  
  noStroke(); //Gets rid of outline.
  fill(100); //Lighter grey
  rect(0, 300, width, 40); //Skyline
  
  
  
  stroke(0); //Puts outline back.
  fill(20); //Dark Grey
  rect(random(350), 80, 50, 300); //Random Tower 1
  rect(random(350), 110, 50, 270); //Random Tower 2
  rect(random(350), 80, 50, 300); //Random Tower 3
  rect(random(350), 95, 50, 285); //Random Tower 4
  
}


