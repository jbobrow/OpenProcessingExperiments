
int value1 = 255;
int value2 = 255;
int s = 25;
int s2 = 5;
float s3 = 10;
//int[] sparkXPos = new int[50];
///int[] sparkYPos = new int[50];
int k=0;
float ellipseX = mouseX;
float ellipseY = mouseY; 
int red1 = 255;
int green1 = 255;
int blue1 = 255;
int change = 0;
int change2 = 0;
int change3 = 0;
int change4 = 50;
void setup() {

  size(700,400);
  background(25);
  frameRate(60);
}
void draw() {
  float ss = random(1,3);
  float sss = random(1,3);
  float ssss = random(1,3);
  if(k==0) {
    float ellipseX = mouseX;
    float ellipseY = mouseY; 
    //fill(255, 255, 0);
    noStroke();
    smooth();
    for (int i = 0; i < 5; i = i+1) {
      fill(255);
      ellipse(mouseX-random(-s2,s2), mouseY-random(-s2,s2), sss, sss);
      fill(255,255,170);
      ellipse(mouseX-random(-s,s), mouseY-random(-s,s), ss, ss);
      fill(change,change2,change3,change4);
      ellipse(mouseX-random(-s3,s3), mouseY-random(-s3,s3), ssss, ssss);
    }
    if(mousePressed && s<100) {
      if(mouseButton==LEFT) {
        frameRate(250);
        red1=0;
        s=s+3;
        s2=s2+1;
        s3=s3+2;
        change=205;
        change2=255;
        change3=255;
        change4=250;
        fill(220);
        ellipse(mouseX,mouseY,10,2);
        ellipse(mouseX,mouseY,1,10);
      }
    }
    else if(s>15 || s2>15) {
      frameRate(60);
      s=10;
      red1=255;
      s2=5;
      s3=10;
      change = 0;
      change2 = 0;
      change3 = 0;
      change4 = 50;
    }
    //frameRate(60);
    fill(0,10);
    ellipseY=ellipseY-10;
    rect(0,0,700,400);
  }

  if(k==1) {
    fill(0,30);
    rect(0,0,700,400);
  }
}

void mouseMoved() {
  value1 = value1 + 5;
  value2 = value2 + 5;
  if (value1 > 255) {
    value1 = 0;
    value2 = 0;
  }
}

void mouseClicked() {
  if(mouseButton==RIGHT) {
    if(k==0) {
      k=1;
    }
    else {
      k=0;
    }
  }
  if(mouseButton==LEFT) {
  }
}


