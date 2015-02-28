
int numPos = 300;
int[] xPos = new int[numPos];
int[] yPos = new int[numPos];
float[] speedX = new float[numPos];
float[] speedY = new float[numPos];
 
void setup(){
  size(400, 600);
  noStroke();
   
 
  for(int i = 0; i < numPos; i++){
    xPos[i] = int(390);
    yPos[i] = int(590);
    speedX[i] = random(40);
    speedY[i] = random(10);
  }
}
 
void draw(){
  background(0);
  fill(mouseX, 255, mouseY);
  rect(0, 0, 400, 100);
  
 fill(mouseY, 200, mouseX);
 rect(0, 100, 400, 100);
 
 fill(200, mouseX, mouseY);
 rect(0, 200, 400, 100);
 
 fill(255, mouseY, mouseX);
 rect(0, 300, 400, 100);
 
   fill(mouseX, mouseY, 255);
 rect(0, 400, 400, 100);
 
    fill(mouseY, mouseX, 250);
 rect(0, 500, 400, 100);
   
   
  for(int i = 0; i < numPos; i++){
    
    fill(255, mouseY, mouseX);
    ellipse(xPos[i], yPos[i], 15, 15);
 
    if(xPos[i] > width - 5 || xPos[i] < 5){
    speedX[i] = speedX[i] * (-1);   
    }
     
    if(yPos[i] > height - 5 || yPos[i] < 5){
    speedY[i] = speedY[i] * (-1);
    } 
 
    xPos[i] += speedX[i];
    yPos[i] += speedY[i];
  }
  
}
