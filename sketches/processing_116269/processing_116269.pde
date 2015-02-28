
PImage img;
PImage img2;
float smallCircSize = 20;
int bulb1X = 0;
int bulb1Y = 100;
int bulb2X = 0;
int bulb2Y = 200;
int bulb3X = 0;
int bulb3Y = 300;
float bulb1VelX = 5;
float bulb1VelY = 5;
float bulb2VelX = 1;
float bulb2VelY = 1;
float bulb3VelX = 3;
float bulb3VelY = 3;
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
  image(img, bulb1X, bulb1Y, 40, 40);
  image(img, bulb2X, bulb2Y, 40, 40);
  image(img, bulb3X, bulb3Y, 40, 40);
  if (thoughtOn) {
    tint(255, thoughtTint);
    image(img2, thoughtX, thoughtY, 80, 80);
    thoughtTint--; 
  }
  
 if (thoughtTint <= 0) {
 thoughtOn = false;
 }




  if(bulb1X > 460|| bulb1X < 0 ){
    bulb1VelX *= -1;
  }
  bulb1X+=bulb1VelX;
    if(bulb1Y > 460 || bulb1Y < 0  ){
    bulb1VelY *= -1;
  }
  bulb1Y+=bulb1VelY;
  if(bulb2X > 460|| bulb2X < 0 ){
    bulb2VelX *= -1;
  }
  bulb2X+=bulb2VelX;
    if(bulb2Y > 460 || bulb2Y < 0  ){
    bulb2VelY *= -1;
  }
  bulb2Y+=bulb2VelY;
   if(bulb3X > 460|| bulb3X < 0 ){
    bulb3VelX *= -1;
  }
  bulb3X+=bulb3VelX;
    if(bulb3Y > 460 || bulb3Y < 0  ){
    bulb3VelY *= -1;
  }
  bulb3Y+=bulb3VelY;
  if(thoughtX > 420 || thoughtX < 0) {
  thoughtVelX *= -1;
  }
  thoughtX+=thoughtVelX;
  if(thoughtY > 420 || thoughtY < 0) {
  thoughtVelY *= -1;
  }
  thoughtY+=thoughtVelY;
  
}
  void mousePressed() {
  thoughtOn = true;
  thoughtX = mouseX;
  thoughtY = mouseY;
  thoughtVelX= random(-10, 10);
  thoughtVelY= random(-10, 10);
  thoughtTint = 255;
  
  
}

  


