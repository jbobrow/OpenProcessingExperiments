
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
  if (posX > width - 30 || posX <= 30) {
    speedX = -speedX;
  }
  if (posY > height - 30 || posY <= 30) {
    speedY = -speedY;
  }
   
  // Add a little friction
  speedX = speedX * 0.995;
  speedY = speedY * 0.995;
  
  background(255);
  stroke(0);
  fill(64,21,15);
  ellipse(posX, posY,60,60);
 
}

