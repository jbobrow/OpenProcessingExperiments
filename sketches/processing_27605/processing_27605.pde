
int nbOiseaux=2000;
float asp=0;
Oiseaux[] oiseau = new Oiseaux[nbOiseaux];
 
class Oiseaux {
  float x,px;
  float y,py;
  float a;
  float v;
  float d;
  color c;
  float numer;
  float denom;
 
  Oiseaux() {
    this.x=random(width);
    this.y=random(height);
    this.d=random(1,20);
    this.c=color(random(64),random(128),random(256));
    this.denom=100;
    this.numer=floor(random(denom));
  }
 
  void deplace() {
    asp=0;
    px=x;
    py=y;
    a=atan2(mouseY-y,mouseX-x);
    v=v*numer/denom;
    v+=(sqrt(sq(mouseX-x)+sq(mouseY-y))-((width+height)/d))*(denom-numer)/denom;
    x+=cos(a)*v;
    y+=sin(a)*v;
  }
 
  void rassemble() {
    px=x;
    py=y;
    a=atan2(mouseY-y,mouseX-x);
    x+=cos(a)*(asp);
    y+=sin(a)*(asp);
  }
 
  void trace() {
    stroke(c);
    line(x,y,px-(px-x)/2,py-(py-y)/2);
  }
}
 
void setup() {
  frameRate(30);
  colorMode(HSB);
  size(500,500);
  for (int i=0;i<nbOiseaux;i++) {
    oiseau[i]=new Oiseaux();
  }
  fill(0,100);
}
 
void draw() {
  background(0);
  asp++;
  for (int i=0;i<nbOiseaux;i++) {
    if (mousePressed==true) {
      oiseau[i].rassemble();
    }
    else{
      oiseau[i].deplace();       
    }
  }
  for (int i=0;i<nbOiseaux;i++) {
    oiseau[i].trace();
  }
}

