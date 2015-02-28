
/* @pjs preload="flywind.jpg, cole.jpg, cielo.jpg"; */
 
 
size(920, 620);
 
//download image wing
PImage wing = loadImage("flywind.jpg");
blend( wing, 0, 0, wing.width, wing.height, -116, -44, 1152, 708, DIFFERENCE );
 
//download the person
PImage cole = loadImage("cole.jpg");
blend(cole, 0, 0, cole.width, cole.height, 115, 35, 700, 590, DIFFERENCE );
 
//add bubble
PImage cielo = loadImage("cielo.jpg");
imageMode(CENTER);
tint(0, 153, 204, 126);
image(cielo, 465, 120, 1920, 1080);

for(int positionX = 60; positionX <= 840; positionX = positionX+170){
  for(int positionY = 40; positionY <= 660; positionY = positionY+160 ){
    blend( positionX,positionY, 120,62, positionX,positionY, 120,62, ADD);
  }
}

