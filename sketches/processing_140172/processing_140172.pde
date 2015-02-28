
float r;
float rr;
float gg;
float bb;
float gg;
float o;

void setup() {
  size(500,300);
  background(0);
}

void draw() {
    r = random(40);
    p = random (45);
    rr = random (200);
    gg = random (200);
    bb = random (200);
    o = random (256);
    r = r + 10;
 }
 

 void mouseMoved() {
     noStroke();
     fill(rr,gg,bb,o);    
     ellipse(mouseX+p,mouseY+p,r,r);   
 
