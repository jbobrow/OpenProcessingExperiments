
int r = 255; int b = 0; int temp; //Cjange in between colors
int z = 0; //Change in x direction
int dir = 5; //The amount of how much ying yang would move in either direction

void setup() {
size(1000, 300); //Set the canvas size
background(255); //Set the background color
noStroke(); //No line segments
}

void draw() {
  background(255);
  z= z+dir; //Moves the whole ying yang in x direction
  fill(b); //Fills with white and black
  ellipse(250+z, 150, 301, 301); //Outside black circle
  ellipse(250+z, 150, 300, 300); //Large black half
  
  noStroke(); //No line
  fill(255); //Colors white
  ellipse(250+z, 75, 150, 150); //Half circle
  rect(0+z, 0, 250, 300); // White off 
  
  fill(b); //Sets the circle black
  ellipse(250+z, 225, 150, 150); //Bottom half normal circle
  ellipse(250+z, 75, 50, 50); //Bottom half small circle
  
  fill(r); //Sets the circle white
  ellipse(250+z, 225, 50, 50); //White mini circle 
  
  stroke(0); //sets a line 
  noFill(); //No fill with the circle
  ellipse(250+z, 150, 300, 300); //Outside traced circle
}

void mousePressed(){
  dir = 0-dir; //switch directions
  temp=r; //changes ying yang shape
  r=b;
  b=temp;
}

