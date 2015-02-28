
/*
---------------------------
  Created by Jose Gonzalez
  Argentina - 2013
---------------------------
*/

PImage gun;

void setup(){
  size(500, 500);
  
  gun = loadImage("gun.png");
}

void draw(){
  background(0);
  showScoup(mouseX, mouseY, 20);
  showGun(mouseX);
}

void showScoup(int posX, int posY, int size){
  noFill();
  stroke(0,255,0);
  line(posX-(size-(size/3)), posY, posX+(size-(size/3)), posY);
  line(posX, posY-(size-(size/3)), posX, posY+(size-(size/3)));
  ellipse(posX, posY, size, size);
}

void showGun(int posX){
  image(gun, posX-75, height-150, 150, 150);
}



