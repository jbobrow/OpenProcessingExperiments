
float xOeil = 200;
float yOeil = 200;
float dOeil = 100;


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
   
    float radians = atan2(mouseY-yOeil,mouseX-xOeil);
    float distance = dist(mouseX,mouseY,xOeil,yOeil);
    
    distance = constrain( distance , 0 , dOeil / 2 - dPupille / 2);
    
  
  float xPupille = cos(radians)* distance + xOeil;
  float yPupille = sin(radians)* distance + yOeil;
   
  fill(0);
  ellipse(xPupille,yPupille,dPupille,dPupille);
  
  }     
  
          


