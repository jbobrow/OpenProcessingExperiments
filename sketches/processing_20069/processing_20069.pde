
void setup(){
  size(640, 480);
  background(0);
  smooth();
  noStroke();
  
}

float eyeWhiteSize = 150;

float eyeBlackSizeMax = 70;
float eyeBlackSizeMin = 20;

int LeyeX = 220;
int LeyeY = 300;
int ReyeX = 420;
int ReyeY = 300;

float d = dist(mouseX, mouseY, LeyeX, LeyeY);
float rd = dist(mouseX, mouseY, ReyeX, ReyeY);

float distanceL;
float distanceR;

int ociliation = 4;

int LeyeLife = 255;
int ReyeLife = 255;


void draw(){
  
  background(255, 200, 0);
  
  fill(0);
  
  d = constrain(d, 0, 40);
  float a = atan2(mouseY-LeyeY, mouseX-LeyeX);
  float x = LeyeX + cos(a) * d;
  float y = LeyeY + sin(a) * d;
  distanceL = dist(x, y, mouseX, mouseY) / 3;
 
  if(LeyeLife < 0){
    fill(255, 0, 0);
    ellipse(LeyeX, LeyeY+10, 150, 150);
    
    fill(0);
    
  }else{
    fill(255, LeyeLife, LeyeLife);
  }
  
  if(distanceL >= eyeBlackSizeMax){
    distanceL = eyeBlackSizeMax;
     ellipse(LeyeX, LeyeY, eyeWhiteSize, eyeWhiteSize);  //Left Eye White 
  
  
  }else if(distanceL <= eyeBlackSizeMin){
    distanceL = eyeBlackSizeMin;
    ellipse(LeyeX + ociliation, LeyeY, eyeWhiteSize, eyeWhiteSize);  //Left Eye White 
    ociliation *= -1;
    LeyeLife--;
  }else{
    ellipse(LeyeX, LeyeY, eyeWhiteSize, eyeWhiteSize);  //Left Eye White 
  }
  
  fill(0);
  
  if(mousePressed && mouseX <= width/2){
     fill(255, 185, 0);
     ellipse(LeyeX, LeyeY-10, eyeWhiteSize, eyeWhiteSize);  //Right Eye White
  }else{
    fill(0);
    ellipse(x, y, distanceL, distanceL);  //Right Eye Black
  }
  
  rd = constrain(rd, 0, 40);
  float ra = atan2(mouseY-ReyeY, mouseX-ReyeX);
  float rX = ReyeX + cos(ra) * rd;
  float rY = ReyeY + sin(ra) * rd;
  distanceR = dist(rX, rY, mouseX, mouseY) / 2;
  
  
  if(ReyeLife < 0){
    fill(255, 0, 0);
    ellipse(ReyeX, ReyeY+10, 150, 150);
    
    fill(0);
  }else{
    fill(255, ReyeLife, ReyeLife);
  }
  
  if(distanceR >= eyeBlackSizeMax){
    distanceR = eyeBlackSizeMax;
    ellipse(ReyeX, ReyeY, eyeWhiteSize, eyeWhiteSize);  //Right Eye White
    
  }else if(distanceR <= eyeBlackSizeMin){
    distanceR = eyeBlackSizeMin;
    
    ellipse(ReyeX + ociliation, ReyeY, eyeWhiteSize, eyeWhiteSize);  //Right Eye White
    ociliation *= -1;
    ReyeLife--;
    
  }else{
    ellipse(ReyeX, ReyeY, eyeWhiteSize, eyeWhiteSize);  //Right Eye White
    
  }
  
  if(mousePressed && mouseX > width/2){
     fill(255, 185, 0);
     ellipse(ReyeX, ReyeY-10, eyeWhiteSize, eyeWhiteSize);  //Right Eye White
  }else{
    fill(0);
    ellipse(rX, rY, distanceR, distanceR);  //Right Eye Black
  }
  
}

void mousePressed(){
 
    
  
}

