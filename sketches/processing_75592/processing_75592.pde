
float posX = 50;
float posY = 50;

float speed = 0;
float gravity = 0.5;

int lastMillies = 0;

float buildingY = 380;
float buildingX = 200;

void setup(){
  size (720,400);
} 

void draw(){
  background (255);
  
  
float tposX = posX + 400;
float tposY = posY-50;
  
  //square-man
  fill (175);
  stroke (0);
  rectMode (CORNERS);
  rect (tposX,tposY,posX,posY);
  
  //add speed to location
  posY = posY + speed;
  //add gravity to speed
  speed = speed + gravity;
  
  //if square hits the building, stop
  if (posY >= buildingY){
   posY = buildingY; 
  }

  //building
  fill (0);
  rect (350,460,buildingX,buildingY);
}

//jumping
 void keyReleased() {
   if (key == ' '  &&  (abs(posY-buildingY) < 5)) { 
     speed = -5;
  }
}
 
//   int millies = millis();
//    if (key == ' '  &&  ( millies-lastMillies >1000 ));
