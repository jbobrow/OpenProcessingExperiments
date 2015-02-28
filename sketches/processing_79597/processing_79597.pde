
size(800,600);
noStroke();
smooth();
float radius = 1.0;
colorMode(HSB,360,100,100);
background(0,0,0);
int degLong=0;
for (int H=0; H<360*4; H+=20) {
  for (int degShort=0; degShort<360; degShort+=11) {
    degLong+=11;
    float angle=radians(degLong);
    float x=400+(cos(angle)*radius);
    float y=300+(sin(angle)*radius);
    fill(map(abs(sin(radians(H/4))),0,1,0,360),100,100, map(abs(sin(radians(degLong/60))),0,1, 255,0));
    ellipse(x,y,15,15);
    radius+=0.60;
  }
}
