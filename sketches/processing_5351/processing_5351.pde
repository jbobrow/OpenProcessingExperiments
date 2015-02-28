
arq[] arcs;

void setup(){
  size(500,500); background(255);arcs= new arq[10];
  for(int a=0;a<10;a++){
    arcs[a]=new arq(250,250,50+a*45);
  }
  noFill();strokeWeight(20); smooth(); strokeCap(SQUARE);
}

void draw(){
  background(255);
  for(int a=0;a<arcs.length;a++){
    arcs[a].dessine();
  }
}

class arq{
  int x,y;float r,a,l,v;
  arq(int _x, int _y, int _r){
    x=_x;y=_y;r=_r;a=random(TWO_PI);l=random(PI*0.3,PI*0.85);
    v=random(-0.04,0.04);
  }
  void dessine(){
    arc(x, y, r, r, a, a+l); arc(x, y, r, r, a+PI, a+PI+l);
    a+=v;
  }
}

