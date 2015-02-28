
float posX; // position variables
float posY;
float[] circle_a;
float[] circle_b;
int index = 0;
  
float speedX; // speed variables
float speedY;
 
void setup(){
  size(600,600);
  background(245,138,183);
    smooth();
  circle_a = new float[40];
  circle_b = new float[40];
  
   
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
    noStroke();
  for (int i=0; i < circle_a.length; i++) {
      
    int pos = (index+i) % circle_a.length;
      
  
    fill(map(i, 0, circle_a.length, 0, 100), 25, 13, 100);  
    ellipse(circle_a[pos], circle_b[pos], 20+i, 20+i);
  }
   circle_a[index] = posX;
  circle_b[index] = posY;
  index++;
  if (index >= circle_a.length) index = 0;
  
 
 // stroke(0);
  fill(64,21,15);
  //ellipse(posX, posY,60,60);
 
}

