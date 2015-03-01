
  float y = 0.0;
  float x = 0.0;


void setup() {
  size(500,500);
}

void draw() {
  frameRate(40);
  background(y*.5,100,x*.5);
   y += 5;
  x += 3;
  noStroke();
  fill(x/2,150,y/.9999999);
  ellipse(x,y,x+100,y-20);
  if (y>1000) {
    y = 0;
    x = 0;
  }
}


