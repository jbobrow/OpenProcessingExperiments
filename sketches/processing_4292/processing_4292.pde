
float r=100; // declare and initialise variables
float g=150;
float b=200;
float a=200;

float z=100;
float x=100;
float y=100;

void setup(){
  size (800,800);
  background (255); //white background
  smooth(); // setting smoothness
}

void draw(){
  //filling all variables with random values
  r=random(255);//random red
  g=random(255);// random green
  b=random(255);// random blue
  a=random(255);// random opacity
  x=random(width);// random x position between 0 and 100
  y=random(height);// random y position between 0 and 100
  
  //use values to draw an ellipse
  
  
  stroke (r,g,b,a);//fill with random colour and opacity
  line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions
}

void keyPressed(){
  background (255);// makes white background when a button is pressed
}
  
  


