
// Copyright by tsulej 2014
// click mouse to change drawing

float nextGaussian = 0;
boolean haveNextGaussian = false;

void setup() {
  size(600, 600,P2D);
  smooth();
  strokeWeight(2);
  
  redraw();
}

void draw() {
// nothing here
}

void mouseClicked() {
  redraw();
}

void redraw() {
  background(255,250,250);
  stroke(150,70);
  
  // circle
  for(int i=0;i<30;i++) {
    fill(230+randomGaussian()*4,230+randomGaussian()*4,240+randomGaussian()*4,10);
    ellipse(300+randomGaussian()*4,300+randomGaussian()*4,500+randomGaussian()*5,500+randomGaussian()*5);
  }
  
  // lines
  for(int i=0;i<3;i++)
    fillCircle(random(0,2*PI),(int)random(30,200));
  
}

// fill half of the circle with pencil drawing
void fillCircle(float ang,int col) {
  pushMatrix();
  translate(width/2, height/2);
  rotate(ang);
  for(float p=0;p<PI/2;p+=0.0174533) {
    float l1 = 220.0 * cos(p);
    float l2 = -220.0 * sin(p);
    float n = 10-(p*6.0);
    for(int i=0;i<n;i++) {
      stroke(180+col/3+randomGaussian()*10,col,220-col/3+randomGaussian()*5,30);
      line( -l1+randomGaussian()*n,l2+randomGaussian()*n,
             l1+randomGaussian()*n,l2+randomGaussian()*n);
    }
  }
  popMatrix();
}

float randomGaussian() {
  if(haveNextGaussian) {
    haveNextGaussian = false;
    return nextGaussian;
  } else {
    float v1,v2,s;
    do {
      v1 = 2 * random() - 1;
      v2 = 2 * random() - 1;
      s = v1 * v1 + v2 * v2;
    } while (s >=1 || s == 0);
    
    float mult = sqrt(-2 * log(s) / s);
    nextGaussian = v2 * mult;
    haveNextGaussian = true;
    return v1 * mult;
  }
}
