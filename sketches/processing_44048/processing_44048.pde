


void setup() {
  size(500, 500);
  background(255);
  strokeWeight(5);
  smooth();
  noLoop();
}



void draw() {
 float xstep = 1;
float lastx = -999;
float lasty = -999;
float angle = 0;
float y = height/2;
for (int x=20; x<=480; x+=xstep) {
float rad = radians(angle);
y = height/2 + (1-(pow(sin(rad), 2) * noise(rad*3)*100));
if (lastx > -999) {
line(x, y, lastx, lasty);
}
lastx = x;
lasty = y;
angle++;
}
}


