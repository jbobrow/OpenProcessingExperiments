

/*
Prueba para la tarea 01
Taller de programación MDI UVeritas
 
Author:       David Morera Chavarría
Description:  Bouncing ball on Y. Sketch: bounce & movement.
*/


//variables
float radius=120; //radius size
float xPos=400;   //x position
float yPos;       //y position
boolean ballBck;  //defines true or false for the border/bounce


void setup() {
  size(800, 800);
  smooth();
  noStroke();
  noCursor();
  
}

void draw() {
  background(255);
  rect(0, 0, 800, 400);
  fill(0,20,220);
  ellipse(xPos,yPos,radius,radius);
  fill(0,100,220);
  

  if(yPos < 0){     //borde
  ballBck = false;
  }
 
  if(ballBck == false){ 
  yPos+=10;         //baja rapido
  }
   
  if(yPos > 800){   //borde
   ballBck = true;
  }
   
  if(ballBck == true){
   yPos -=5;        //sube lento
  }
  
}


