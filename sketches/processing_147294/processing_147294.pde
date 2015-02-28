
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:Hong Jiyae
// ID: 201420117
PImage catHead;
PImage catHead2;
float x=120; 
float y=120; 
float xSpeed=4; 
float ySpeed=2; 
float angle;
float r=250;
float s;
float v;
float b=180;
float e=180;

PImage catTongue;
float yTongue;
float xTongue;

void setup() {
  size (600, 600);
  // noLoop();
  smooth();
  catHead = loadImage ("Cat_head.png");
  catHead2 = loadImage ("Cat_head2.png");
  catTongue = loadImage ("Cat_tongue.png");
}

void draw() {

  background(255);
  angle += 0.08;

  pushMatrix();
  translate(width/2, height/2);
  noTint();
  imageMode(CENTER);
  image (catHead, 0, 0, 250, 250);
  popMatrix();

  pushMatrix();
  translate(245,350);
  imageMode(CORNERS);
  image (catTongue, 0, 0, 75, yTongue);
  popMatrix();

  yTongue = map(second(), 0, 60, 95, 200);
  
  
  
  pushMatrix();
  
  translate(width/2,height/2);
  rotate(-HALF_PI);
  rotate(radians(minute()*6));
  noTint();
  imageMode(CENTER);
  image (catHead2,x,y, 150, 150);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(-HALF_PI);
  //rotate(angle);
  rotate(radians(hour()*15));
  tint(255, 0, 0);
  imageMode(CENTER);
  image (catHead2, b, e, 50, 50);
  popMatrix();

  //eyes

  float eyeLeftX = constrain (mouseX, 323,341); 
  float eyeLeftY = constrain (mouseY, 285,295);
  fill(0);
  ellipse(eyeLeftX, eyeLeftY, 3, 10);
  ellipse(eyeLeftX-80, eyeLeftY, 3, 10);

}



