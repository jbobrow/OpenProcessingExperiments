
/*TRAVAIL DE RATTRAPAGE
  L'OEIL
  PAR GABRIELLE DEMERS*/




float x = 200;
float y = 200;
float d = 100;
float xCiblee = 200;
float yCiblee = 200; 
float pupilleD = 30;
float vitesse; 

   
void setup() {
  size(400,400);
  smooth();
  noStroke();
  
  
}
   

   
void draw() {
  background(0);
  fill(255);
// la pupille qui se déplace dans l'oeil    
  stroke(0);
  ellipse(x,y,d,d);
    
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distance,0,d/2 - pupilleD/2);
   
   
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
  
  // suivre la souris 
  
   float radiansP = atan2( yCiblee-y, xCiblee-x );
  float distanceP = dist( xCiblee, yCiblee, x, y );
  x = cos(radiansP) * min(distanceP,vitesse) + x;
  y = sin(radiansP) * min(distanceP,vitesse) + y;
  
  //assouplissement 
  
  x = (xCiblee - x) * 0.04 + x;
y = (yCiblee - y) * 0.04 + y;

   
  }
  

     void mousePressed() {
    xCiblee = mouseX;
  yCiblee = mouseY;

    
    
  }
