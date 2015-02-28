
/* Stair Bounce
By Jake Winstel
9/28/10
*/



float x, y;
float spdX, spdY;
float r;
float gravity;
float damping;
float friction;
int stairCount = 4;
float xPos = -400;
float yPos = 200;

void setup(){
 size(800, 600);
 background(255);
 stairs();
  spdX = 2.25;
  spdY = 0.0;
  r = 5.0;
  gravity = .16;
  damping = .75;
  friction = .80;
}

void draw() {

  ball();
  stairs();
}

void stairs(){
  noStroke();
  fill(130, 250, 30);
  beginShape();
  for(int i=-1; i<stairCount; i++){
    rect(xPos, yPos, 600, 120);
    xPos += 100;
    yPos += 80;
  }
  endShape();
xPos = -400;
yPos = 200;
  
}

void ball(){
  background(255);
  fill(0);
  stroke(0);
  ellipse(x, y, r*2, r*2);
  x+=spdX;
  spdY += gravity;
  y+=spdY;
  
    if (x>width-r){
    x = width-r;
    spdX*=-1;
  } if (x < r) {
    x = r;
    spdX*=-1;
  } if (y>height-r){
    y = height-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } else if (y<r) {
    y = r;
    spdY*=-1;
  } if (y>200-r && x<200){
    y = 200-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } if (y> 280-r && x>200 && x<300){
    y = 280-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } if (y>360-r && x>300 && x<400){
    y = 360-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } if (y>440-r && x>400 && x<500){
    y = 440-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } if (y>520-r && x>500 && x<600){
    y = 520-r;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  }
}


  


  

