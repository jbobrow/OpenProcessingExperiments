
int r;
int g;
int b;
int x;
int y;
boolean go;
int count;

void setup () {
  size(800,800);
  background (0,0,0);
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
  stroke(r,g,b);
  strokeWeight(2);
  go=false;
  count=0;
  frameRate(120);
}

void draw () {
  if(go==true && count<10000) {
  r=r+int(random(-10, 10))%255;
  g=g+int(random(-10, 10))%255;
  b=b+int(random(-10, 10))%255;
  count++;
  stroke(r, g, b);
  for (int i=1; i<30; i++) {
  x=x+int(random(-8, 8));
  y=y+int(random(-8, 8));
  point(x, y);
  }

  }
}

void mouseClicked () {
  x=mouseX;
  y=mouseY;
  go=true;
}


