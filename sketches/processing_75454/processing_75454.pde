
float r;
float rr;
float gg;
float bb;
float p;
float o;

void setup() {
  size(600,400);
  background(0);
}

void draw() {
    r = random(50);
    p = random (40);
    rr = random (256);
    gg = random (256);
    bb = random (256);
    o = random (256);
    r = r + 10;
  }

 void mouseMoved() {
     noStroke();
     fill(rr,gg,bb,o);    
     ellipse(mouseX+p,mouseY+p,r,r);   
  }
