
//make a mechanism with 3 arms

float xPos[]= new float[3];
float yPos[]= new float[3];

void setup(){
  size(500, 500);
  smooth();
  background(0,255,0);
}

void draw(){
drawArm(width/2, height/2, 100, 10);
drawArm(xpos[currentARm-1], ypos[currentArm-1, 50 0);
drawArm(xpos[currentARm-1], ypos[currentArm-1, 50, -90);
//drawArm(xpos[currentArm-1] ypos[cost

}

void drawArm (float x, float y, float armLength, float angle){
  float newX = (sin(radians(angle)) * armLength) + x;
  float newY = (sin(radians(angle)) * armLength) + y;
  
  line(x, y, newX, newY);
  xPos[currentArm] = newX;
  yPos[currentArm] = newY;
  
}
