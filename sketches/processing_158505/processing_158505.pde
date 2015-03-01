
float x=0;
float y=0;
float a=0;
void setup() {
  size(800, 400);
  x=width/2;
  y=height/2;
  background(255);
  stroke(random(255), random(255), random(255), 30);

  noFill();
}
float mag=4;

void draw() {
  float t=map(mouseX,0,width,0,50);
  a+=random(-t, t);

  x+=cos( radians(a) )*(noise(x)*mag);
  y+=sin( radians(a) )*(noise(x)*mag);

  float d=noise(x+y);
  ellipse(x, y, d*15, d*15);

  if (x>width) {
    x=0;
    stroke(random(255), random(255), random(255), 30);
    mag=random(3,6);
  }
  if (x<0) {
    x=width;
    stroke(random(255), random(255), random(255), 30);
    mag=random(3,6);
  }
  if (y>height) {
    y=0;
    stroke(random(255), random(255), random(255), 30);
    mag=random(3,6);
  }
  if (y<0) {
    y=height;
    stroke(random(255), random(255), random(255), 30);
    mag=random(3,6);
  }
}

