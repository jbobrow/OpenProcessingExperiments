
//Alana Alfrey
//Credit for instructions and reference http://www.artsnova.com/Nees_Schotter_Tutorial.html

int columns = 15;       
int rows = 25;          
int sqrsize=20;         
float rndStep=.25;      
float randsum=0;        
int padding=2*sqrsize;  
float randval;          
float dampen=0;      
 
void setup() {
  size (400,600);
  background(255);   
  stroke(0);         
  smooth();          
  noFill();          
  rectMode(CENTER);  
  noLoop();          
}
  
void draw() {
  for (int y=1; y <=rows; y++){
    randsum+=(y*rndStep);  
    for (int x=1; x<=columns; x++) {
      pushMatrix();
      randval=random(-randsum,randsum);
      translate( padding + (x*sqrsize) - (sqrsize) + (randval*dampen),
         padding + (y * sqrsize) - (sqrsize) + (randval*dampen));
      rotate(radians(randval));
      rect(0,0,sqrsize,sqrsize);
      popMatrix();
    } 
  }
}
