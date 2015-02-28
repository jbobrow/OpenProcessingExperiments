
//platformerrrrr
boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
PImage photo;
int[][] level = new int[HEIGHT][WIDTH]; 
Player myPlayer;
Platform[] platforms = new Platform[7];
 
void setup() {
 
  size(1000,600);
  noStroke();
  myPlayer = new Player();
  //draw background
   photo = loadImage ("1217970689551.png");
  //draw random platforms
  for(int i=0; i<platforms.length; i++) {
    platforms[i] = new Platform(random(width),random(height));
  }
}
 
void draw() {
 image (photo,0,0);
  for(int i=0; i<platforms.length; i++) {
    platforms[i].update();
  }
  myPlayer.update();
  myPlayer.collisionCheck();
   
}
 
void keyPressed() {
  
  if (key == CODED) {
    if (keyCode == LEFT) leftPressed = true;
    else if (keyCode == RIGHT) rightPressed = true;
  }
  if (keyCode == UP) {
    upPressed = true; 
 
}
}
  
void keyReleased() {
  
 if (key == CODED) {
   if (keyCode == LEFT) leftPressed = false;
   if (keyCode == RIGHT) rightPressed = false;
   if (keyCode == UP) upPressed = false;
 }
}
 


