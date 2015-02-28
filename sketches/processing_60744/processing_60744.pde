
void setup(){
  size (400,400);
  background (0);
}

void draw(){
float b=random(400);
float c=random(400);
float h=random(400);
float g=random(400);
blueSquare(b,c);
greenSquare(h,g);
}

void blueSquare(float x, float y) {
noStroke();
float n = random (255);
fill(0,0,n,n);
triangle (x,y,20,20,6,6);
}

void greenSquare(float q, float p) {
noStroke();
float o = random (255);
fill(o,o,0,o);
triangle (q,p,20,20,6,6);
}

