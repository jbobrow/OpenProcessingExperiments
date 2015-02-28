
float ellpR;
float ellpG;
float ellpB;

float centerX = 250; //the horizontal center
float centerY = 250; //the vertical center


//setup: defines size and some features
void setup() {
  
  size(200, 200);
  smooth();
  
}


//draw: defines the color change and the size
void draw() {
  
  float mouseFloatX;
  
  background(255);
  
  //Set up ellipse to CENTER mode
  ellipseMode(CENTER);
  
  //Draw ellipse
  stroke(0);
  ellpR = random(255);
  ellpG = random(255);
  ellpB = random(255);
  fill(ellpR, ellpG, ellpB);
  
  //ellipse(
  
}

