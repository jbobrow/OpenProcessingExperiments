
PFont f;


float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(200,200);
  background(255);
  f = createFont("Arial", 16, true);

  smooth();    
}

void draw() {
  
  // Body
  noStroke();
  fill(255);
  ellipseMode(CENTER);
  
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  ellipse(mouseX,mouseY,25,25);  
  
  textFont(f);
  fill(255,0,0);
  
  // textAlign() sets the alignment for displaying text. It takes one argument: CENTER, LEFT, or RIGHT.
  textAlign(CENTER);
  text(" LEARNING PROCESSING" ,width/2,60);

  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}








