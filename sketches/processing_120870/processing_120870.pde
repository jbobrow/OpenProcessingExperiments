
Ball[] balls = new Ball [10];
PImage book1;
PImage book3;
PImage eye;
PImage eyeb;
int flag=0;
float lx;
float ly;
float rx;
float ry;
float easing = 0.07;
float easingT = 0.04;

void setup() {
  for (int i = 0; i < balls.length; i = i+1) {
    balls[i] = new Ball();
  }
  frameRate(60);
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  eye = loadImage("eye.png");
  eyeb = loadImage("eyeb.png");
  book1 = loadImage("book1.png");
  book3 = loadImage("book3.gif");
  loadFont("Dotum-48.vlw");
}
 

void draw() {
  if (flag==1) {
  fill(0,30);
  rect(0,0,width,height);
  image(book1,100,380,400,200);
  fill(0,255,50);
  rect (535,300,30,30);
  fill(255);
  textSize(15);
  text("snooze",523,350);
  for (int i = 0; i < balls.length ; i = i+5) {
    balls[i].ballMove();
    balls[i].ballPositionCheck(); 
    balls[i].ballDisplay();
  }
}
if (flag==0) {
  fill(0,30);
  rect(0,0,width,height);
  image(book1,100,380,400,200);
  fill(255,30,30);
  rect (535,240,30,30);
  fill(255);
  textSize(15);
  text("work all night",500,290);
  
  //eye w
  ellipse (220,180,100,100);
  ellipse (370,180,100,100);
  //eye l
  float newlx = constrain (mouseX, 175,200);
  float newly = constrain (mouseY, 133,160);
  lx += (newlx - lx) * easing;
  ly += (newly - ly) * easing;
  image(eyeb, lx, ly, 70,70);
  //eye r
  float newrx = constrain (mouseX, 320,350);
  rx += (newrx - rx) * easing;
  image(eyeb, rx, ly, 70,70);
  if (mousePressed && mouseX>100 && mouseX<500 && mouseY>350 && mouseY<550){
  image(book3,100,250,400,330);
}
}


  if (mousePressed && mouseX>535 && mouseX<565 && mouseY>240 && mouseY<270){
   flag=1;
  }
  if (mousePressed && mouseX>535 && mouseX<565 && mouseY>300 && mouseY<330){
   flag=0;
  }
}
 

class Ball {
  float xPosition, yPosition;
  float xSpeed, ySpeed;
  float xAccel, yAccel;

  Ball() {
    xPosition = 100;
    yPosition = 100;

    xSpeed = 0;
    ySpeed = 0;

    xAccel = (float)( random(0, 0.05) );
    yAccel = (float)( random(0, 0.05) );
  }

  void ballMove() {
    xSpeed = xSpeed + xAccel;
    ySpeed = ySpeed + yAccel;

    xPosition = xPosition + xSpeed;
    yPosition = yPosition + ySpeed;
  }

  void ballPositionCheck() {
    if (xPosition < 80 || xPosition > 400) {
      xSpeed = -1 * xSpeed;
    }

    if (yPosition < 50 || yPosition > 250) {
      ySpeed = -1 * ySpeed;
    }

    xPosition = constrain(xPosition, 80, 400);
    yPosition = constrain(yPosition, 50, 250);
  }

  void ballDisplay() {
  image(eye,xPosition,yPosition,100,100);
  }

  void ballMonitoring() {
    println("xAccel = " + xAccel);
    println("yAccel = " + yAccel);
    println("xPosition = " + xPosition);
    println("yPosition = " + yPosition);
    println("xSpeed = " + xSpeed);
    println("ySpeed = " + ySpeed);
  }
}

