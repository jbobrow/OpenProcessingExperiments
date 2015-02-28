
int x;
int y;
float z;
void setup() {
  size(500,500, P3D); 
  frameRate(10);
}

void draw() {
  if ((x%300)==0) {
    background(0);
  }
  fill(random(0,255),random(0,255),random(0,255));
  rect(random(0,500),random(0,500),random(0,500),random(0,500));
  rotate(radians(x));
  x=(x+5)%500;
  rect(0,0,x,x);
}




