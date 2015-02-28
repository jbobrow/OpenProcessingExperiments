

void setup () {
  size (620,447);
  smooth();
}

void draw() {
  background (0);
  for (int i=0;i<80;i++) {
    for (int j=0;j<80;j++) {
      noStroke();
      float cx=i*10;
      float cy=j*10;
      float dx=mouseX-cx;
      float dy=mouseY-cy;
      float dis=sqrt(dx*dx+dy*dy);
      float r=1500/(dis+10);
      color col=color(255,255,255,70);
      diamond (col,100*r,cx,cy,r);
    }
  }
  //saveFrame("img-####.gif");
}

void diamond (color col,float a,float cx,float cy, float r) {
  fill(col);
  noStroke();
  float x1=cx+r*cos(a);
  float y1=cy+r*sin(a);
  float x2=cx+r*cos(a+PI/2);
  float y2=cy+r*sin(a+PI/2);
  float x3=cx+r*cos(a+PI);
  float y3=cy+r*sin(a+PI);
  triangle (x1,y1,x2,y2,x3,y3);
}


