
PImage img;
PImage img2;
float smallCircSize = 20;
int bulbNumber = 50;

int[] bulbsX = new int[bulbNumber];
int[] bulbsY = new int[bulbNumber];

float[] bulbVelX = new float[bulbNumber];
float[] bulbVelY = new float[bulbNumber];

float frames = 0;
int thoughtX = -40;
int thoughtY = 0;
float thoughtVelX = 1;
float thoughtVelY = 1;
boolean thoughtOn = false;
float thoughtTint = 255;
 
 
void setup() {
  size(500, 500);
  frameRate(30);
  img = loadImage("lightbulb.png");
  img2 = loadImage("thoughtcloud.png");
  for(int i = 0; i < bulbNumber; i++) {
    bulbsX[i] = int(random(width));
    bulbsY[i] = int(random(height));
    bulbVelX[i] = random(-12,12);
    bulbVelY[i] = random(-12,12);
  }
}
 
void draw() {
   background(255);
    
  noStroke();
  fill(255, 106, 158);
  ellipse(100, 400, 200, 200);
  ellipse(200, 200, 200, 200);
  ellipse(350, 300, 200, 200);
  ellipse(400, 100, 200, 200);
  ellipse(100, 50, 200, 200);
 
   
 smallCircSize = sin(frames)*5+10;
 frames += .1;
  
  for(int i = 0; i < 30; i++ ) { //make 40 things x-axis
    for(int j = 0; j < 30; j++ ) { //make 40 things on the y axis
      fill(255, 198, 231);
      ellipse(i*52+20, j*52+20, 50, 50);
      fill(random(100, 250), random(0, 90), random(50, 150));
      ellipse(i*52+20, j*52+20, smallCircSize, smallCircSize);
    }
  }
   
  tint(255, 255);
  
  for(int i=0; i<bulbNumber; i++) {
    image(img, bulbsX[i], bulbsY[i], 40, 40);
    bulbsX[i] += bulbVelX[i];
    bulbsY[i] += bulbVelY[i];
    bulbVelX[i] = checkBoundsX(bulbsX[i], bulbVelX[i]);
    bulbVelY[i] = checkBoundsY(bulbsY[i], bulbVelY[i]);
  }

  
  
  
   
}
  void mousePressed() {
  thoughtOn = true;
  thoughtX = mouseX;
  thoughtY = mouseY;
  thoughtVelX= random(-10, 10);
  thoughtVelY= random(-10, 10);
  thoughtTint = 255;
}

float checkBoundsX(int x, float velX) {
  if(x > width || x < 0) {
    return velX *-.9;
  }else{ 
    return velX;
  }
}
  
float checkBoundsY(int y, float velY) {
  if(y > height || y < 0) {
  return velY *-.9;
  }else{ 
    return velY;
  }

}



