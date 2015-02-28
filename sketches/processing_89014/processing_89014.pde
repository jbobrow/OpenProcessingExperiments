
void setup(){
size(500,500);
smooth();
noCursor();
}
float rad,rad1,rad2;
float x1=80;
float y1=60;
float x2=250;
float y2=250;
int xcent,ycent;

void draw() {
background(0);
stroke(255,255,255,15);
strokeWeight(abs(mouseX-pmouseX));
  for (int deg1=0; deg1<360; deg1=deg1+60) {
  star(180, 100, 50,mouseX,mouseY);
  star(300,200,75,mouseX,mouseY);
  star(500,300,120,mouseX,mouseY);
  star(1200,600,300,mouseX,mouseY);
  }
}

void star(int rays, int xradius, int yradius, int xcent, int ycent) {
     for (int deg=0; deg<360; deg=deg+60) {
    rad1=radians(deg);
    rad2=radians(deg+120);
    x1=sin(rad1)*xradius+xcent;
    y1=cos(rad1)*yradius+ycent;
    x2=sin(rad2)*xradius+xcent;
    y2=cos(rad2)*yradius+ycent;
    line(x1,y1,x2,y2);
    
    
  }
}


