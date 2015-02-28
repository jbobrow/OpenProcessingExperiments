
//Kelsey Simpson  
//Introduction to Digital Media Fall 2012
//Section B
//September 9,2012

float randomArea =15;
float randomDiameter =25; 
int growingDiameter =175; 
int value=0;
int randomRed =0;
int randomBlue=0;
int randomGreen=0;
void setup() {

  size(1200, 600);

  background(255);
}

void draw() {
   fill(value);
  
}

void mousePressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
  
  fill (255, 50);
  rect(0, 0, width, height);
  
  
  randomGreen= int( random(255));
  fill (0, randomGreen, 0);
  randomArea= random (250);
  triangle(mouseX, mouseY, mouseX, randomArea, randomArea, randomArea);


  randomBlue= int (random (255));
  fill (0, 0, randomBlue);
  randomDiameter= random (500); 

  ellipse(mouseX, mouseY, randomDiameter, randomDiameter); 



  fill(value);
  smooth(); 
  randomRed= int(random(255)); 
  fill(randomRed, 0, 0);
  randomArea= random (50); 
  rect(mouseX, 100, 250, mouseY);

  randomBlue= int (random (255));
  fill (0, 255, randomBlue);
  randomDiameter= random (500); 

  ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
}

void mouseMoved() {
  value = value + 5;
  if (value > 250) {
    value = 0;
  }
}









void mouseClicked() {
}
