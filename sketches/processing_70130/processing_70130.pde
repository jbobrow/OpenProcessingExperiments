
Ball myBall;
  PImage character, ghostkitten, bow, fire, ghostkittenmad;

int MAXBALLS = 1300000;
 
Ball[] balls = new Ball[MAXBALLS];
int numballs = 0;
boolean spray = false;
int fps = 20;
 
void setup() {
  size(500,500);
  smooth();
  noStroke();
  frameRate(fps);
    ghostkitten = loadImage("ghostkitten.png");
    ghostkittenmad = loadImage("ghostkittenmad.png");
    bow = loadImage("bow.png");
    fire = loadImage("fire.png");

}

void draw() {
  background (0,16,66);
  
 
  if(spray) {
    boolean done = makeNewBall();
  }
 
  for(int i = 0; i< numballs; i++) {
    balls[i].moveBall();
    balls[i].bounceBall();
  }
 
  for(int i = 0; i< numballs; i++) {
    balls[i].drawBall(); 
  }
 
}
 
void mousePressed() {
  spray = true;
    pushMatrix();
    translate(mouseX-100,mouseY-100); 
    image(ghostkittenmad,0,0,200,200);
    image(bow, 80, 200, 40, 20);
    popMatrix();
}
 
void mouseReleased() {
  spray = false;
}
 
boolean makeNewBall() {
 
  float xspeed = random(0.1,5);
  float yspeed = random(0.1,5);
 
 
  if(random(10) > 5) {
    xspeed *= -1;
  }
  if(random(10) > 5) {
    yspeed *= -1;
  }

  float w = 15 + random(10);
  float h = w;
 
  balls[numballs] = new Ball(mouseX,mouseY,xspeed,yspeed,w,h);
  numballs++;
 
  return true;
}
 

