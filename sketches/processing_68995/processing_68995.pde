
/* --------------------------------------------------------------------------
Travail de rattrapage
oeil
Par Jean-François Bourbeau
-------------------------------------------------------------------------- */



float x = 200;
float y = 200;
float d = 100;
float yCiblee = 0;
float xCiblee = 0;
float vitesse;
float assouplissement = 0.04;

 
float pupilleD = 30;
   
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
  
  
  
   
   
void draw() {
  background(0);
  fill(255);
  
  
    
 
  float radians = atan2( yCiblee-y, xCiblee-x );
  float distance = dist( xCiblee, yCiblee, x, y );
  x = cos(radians) * min(distance,vitesse) + x;
  y = sin(radians) * min(distance,vitesse) + y;
  
  
   
  stroke(0);
  ellipse(x,y,d,d);
    
  float radiansP = atan2(mouseY-y,mouseX-x);
  float distanceP = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distanceP,0,d/2 - pupilleD/2);
   
   
  float pupilleX = cos(radiansP)* distance + x;
  float pupilleY = sin(radiansP)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
  



//Assouplissement

x = (xCiblee - x) * assouplissement + x;
y = (yCiblee - y) * assouplissement + y;



  }
 
void mousePressed() {
 
xCiblee = mouseX;
  yCiblee = mouseY;
   
   
  }
