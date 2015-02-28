
float posX; // position variables
float posY;
 
float speedX; // speed variables
float speedY;

void setup(){
  size(600,600);
  background(245,138,183);
 
  
  posX = width / 2;
  posY = width / 2;
  speedX = 0;
  speedY = 0;
}

 

void draw(){
  if (mousePressed) {
    if ((mouseX > (posX - 20) && mouseX < (posX + 20)) &&
        (mouseY > (posY - 20) && mouseY < (posY + 20))) { 
      speedX = mouseX - pmouseX;
      speedY = mouseY - pmouseY;
    }
  }

 // Calculate the new position
  posX = posX + speedX;
  posY = posY + speedY;
 
  // If the position is outside of the window: bounce
  if (posX > width - 10 || posX <= 0) {
    speedX = -speedX;
  }
  if (posY > height - 10 || posY <= 0) {
    speedY = -speedY;
  }
  
  // Add a little friction
  speedX = speedX * 0.995;
  speedY = speedY * 0.995;
 
  background(245,138,183);
  stroke(255);
  fill(245,138,183,104);
  rect(posX, posY,20,20);
  rect(posX+2, posY+2,24,24);
  rect(posX+4, posY+4,28,28);
  rect(posX+6, posY+6,32,32);
}
  

