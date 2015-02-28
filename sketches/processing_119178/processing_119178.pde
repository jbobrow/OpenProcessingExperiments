
/*
---------------------------
  Created by Jose Gonzalez
  Argentina - 5 nov 2013
---------------------------
*/

float posX, posY, speed;
int starNumber;
PImage ship;
 
void setup() {
  size(300, 500);
   
  posX = width/2;
  posY = height/2;
  speed = 2;
  starNumber = 50;
  
  ship = loadImage("ship.png");
}
 
void draw() {
  background(0); 
  stroke(255);  
  
  for(int i = 0; i<starNumber; i++){
    point(random(width), random(height));
  }
  
  image(ship, posX, posY, 50, 50);   
}
 
void keyPressed() {
     if (keyCode == LEFT) {
       posX = posX-speed;
     } else if(keyCode == RIGHT) {
       posX = posX+speed;
     } else if(keyCode == UP) {
       posY = posY-speed;
     } else if(keyCode == DOWN) {
       posY = posY+speed;
     }
}


