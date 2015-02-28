
void setup(){
  size(300,300);
background(255);
strokeWeight(3);
smooth();
stroke(167);
frameRate(3);
}

void draw(){
stroke(20, 50, 70,35);
int step = 10;
float lastx = -399;
float lasty = -399;
float y = random(299);
float borderx = random(width/2);
float bordery = random(height/2);
for (float x=borderx; x<=width-borderx;
x+=step) {
y = bordery+random(100);
if (lastx > -399) {
line(y, x, lasty, lastx);
}
lastx = x;
lasty = y;
}
}

void keyPressed() {
saveFrame("wiggly-####.jpeg");
}

