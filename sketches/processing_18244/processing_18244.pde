
float bigRadius;
float smallRadius;
boolean sm;

void setup () {

size (320,320);
bigRadius = width/17;
smallRadius = bigRadius*.4;
sm = true;
}

void draw() {
if (sm) smooth();
else noSmooth();
background(0);
for (int i=0;i<16;i++)
  for (int j=0;j<16;j++) {
    float x = map(i,0,15,width/40, width-width/40);
    float y = map(j,0,13,height/30, height-height/30);
    fill(255,map(i,0,15,0,255));
    ellipse(x,y,bigRadius,bigRadius);
    fill(255);
    ellipse(x,y,smallRadius,smallRadius);
  }
}

void mouseClicked() {
  sm = !sm;
}

