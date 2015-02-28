
/* preload="grid.jpg" */
/* preload="sheen.jpg" */
/* preload="losing.jpg" */

PImage losing;
PImage sheen;
PImage grid;
int[] rectX = {10, 36, 63, 185, 210, 250, 340, 375, 300, 400, 460, 460, 475, 520, 555, 600, 625, 655, 725, 150, 770, 680};
int[] rectY = {10, 690, 320, 28, 165, 730, 385, 75, 610, 15, 280, 565, 700, 35, 360, 200, 450, 630, 350, 400, 30, 700};
int rectSize = 25;
int playerX = 400;
int playerY = 775;
int edge = 2;
int inner = edge;
Boolean winning; 

void setup() {
  losing = loadImage("losing.jpg");
  sheen = loadImage("sheen.jpg");
  grid = loadImage("grid.jpg");
  size(800,800);
  image(grid, 0, 0);
  
}
  
  void draw() {
  fill(255); //player avatar & glow effect
  strokeWeight(2);
  stroke(134,250,255);
  filter(BLUR);
  rect(playerX,playerY,20,20);
  playerX = constrain(playerX, inner, width - inner);
  playerY = constrain(playerY, inner, height - inner);
  


  
  fill(0); //AI avatars
  strokeWeight(3);
  stroke(255,145,6);
  for(int i = 0; i < rectX.length; i++){
  rect(rectX[i], rectY[i], rectSize, rectSize);
 rectY[i]+=25;
   rectY[i]%=height;
     if(playerY < 5){
  image(sheen,0,0);
  } 

  }
  }

  
  
void keyPressed() {
  if (keyCode == UP) {
    playerY = playerY - 7;
  }  
    if (keyCode == RIGHT) {
    playerX = playerX + 7;
  }  
    if (keyCode == LEFT) {
    playerX = playerX - 7;
  }  
    if (keyCode == DOWN) {
    playerY = playerY + 7;
  }   
  
}


