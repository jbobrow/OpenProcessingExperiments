
import processing.opengl.*;

int numBobs = 200;
int numStars = 200;

Bob[] bob = new Bob[numBobs];
Star[] star = new Star[numStars];

int sW = 640;
int sH = 480;
int fps = 60;
float targetY = sH/2;
float gravity = 1;
float zRange = 200;
float sunY = targetY;
float sunDeltaOrig = 5;
float sunDelta = sunDeltaOrig;
float sunFriction = 0.95;
  
void setup() {
  size(sW,sH,OPENGL);
  frameRate(fps);
  for(int i=0;i<bob.length;i++){
  bob[i]= new Bob();
  }
  for(int i=0;i<star.length;i++){
  star[i]= new Star();
  }
}


void draw() {
background(0);
  for(int i=0;i<star.length;i++){
    star[i].update();
  }
  if(mousePressed){
    sunDelta = sunDeltaOrig;
   strokeWeight(2);
  stroke(255,0,0,random(50)+200);
  line(0,targetY,width,targetY); targetY = mouseY;
  }
  noStroke();
   ellipseMode(CENTER);
  if(sunY<targetY){
    sunY+=sunDelta;
    sunDelta *= sunFriction;
  }else if(sunY>targetY){
  sunY-=sunDelta;
  sunDelta *= sunFriction;
  }
  for(int i=0;i<20;i++){
    fill(200+random(50),random(50),0,50+(3*i));
  ellipse(width/2,sunY,width/(i+6),width/(i+6));
  }
  for(int i=0;i<bob.length;i++){
    bob[i].update();
  }

}

class Bob {

  float posX,posY,posZ,speedX,speedY,bobSize;

  Bob() {
    posX = random(width);
    posY = random(height);
    posZ = random(zRange)-(zRange/2);
    bobSize=random(30)+5;
    speedX = random(5)+2;
    speedY = random(5)+2;
  }

  void update() {

    if(posY<sunY) {
      posY+=speedY;
    }
    else if(posY>sunY) {
      posY-=speedY;
    }
    
if(posY<height){
posY+=gravity;
}
    
    if(posX>width||posX<0){
      speedX*=-1;
    }
    posX += speedX;


    drawBob();
  }

  void drawBob() {
    noStroke();
    fill(random(110),random(20),random(50)+200,random(50)+150);
    ellipseMode(CENTER);
    pushMatrix();
    translate(posX,posY,posZ);
    ellipse(0,0,bobSize,bobSize);
  popMatrix();
}
}

class Star{
float posX, posY;
int starSize;
  Star(){
posX = random(width);
posY = random(height);
starSize = int(random(3)+1);
}

void update(){
  drawStar();
}

void drawStar(){
noFill();
strokeWeight(starSize);
stroke(255,random(100)+100);
point(posX,posY);
strokeWeight(starSize+1);
stroke(0,random(50),random(200),random(20)+50);
point(posX,posY);
}

}

