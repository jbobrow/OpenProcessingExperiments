
float xOeil = 200;
float yOeil = 200;
float dOeil = 100;

float radians;

float dPupille = 30;
  
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
  
  
void draw() {
  background(0);
  fill(255);
  
  stroke(0);
  ellipse(xOeil,yOeil,dOeil,dOeil);
   
  radians = radians + 0.1;
  float distance = dOeil/2 - dPupille/2;
    
  
  float xPupille = cos(radians)* distance + xOeil;
  float yPupille = sin(radians)* distance + yOeil;
   
  fill(0);
  ellipse(xPupille,yPupille,dPupille,dPupille);
  
  }             
