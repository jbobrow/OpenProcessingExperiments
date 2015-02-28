
float speedX=0;
float speedY=0;
float x=200;
float y=200;
float radi=50;
float friction=0.9;
int mouseX1=0;
int mouseY1=0;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
}

void draw() {
  background(255); 
  if (x>width-(radi/2)) {
    x=width-(radi/2);
    speedX=-speedX*friction;
  }
  else if (x<(radi/2)) {
    x=(radi/2);
    speedX=-speedX*friction;
  }
  x=x+speedX;
  if (y>height-(radi/2)) {
    y=height-(radi/2);
    speedY=-speedY*friction;
  }
  else if (y<(radi/2)) {
    y=(radi/2);
    speedY=-speedY*friction;
  }
  y=y+speedY;
  ball();
}

void ball() {
  noStroke();

  fill(255, 0, 0);
  ellipse(x, y, radi, radi);
}
void mousePressed(){
  mouseX1=mouseX;
  mouseY1=mouseY;
}
void mouseReleased(){
  speedX=(float)(mouseX1-mouseX);
  speedY=(float)(mouseY1-mouseY);
}


