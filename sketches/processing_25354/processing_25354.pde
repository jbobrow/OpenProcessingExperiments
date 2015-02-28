

//création de la classe
class Meteorite {

  float x;
  float y;
  int impact;
  float d;//dimension
  float e=d;
  float v;//vitesse 
  float dirx;// direction en x
  color feu=color(255,150,0);
  int k;//trainée de feu
  color c=color(120,185);
  int dir = 1;
  int sol=50;




  //constructeur

  Meteorite(float X, float V, float D) {
    x=X;
    d=D;
    v=V;
    y=d*0.5;
    dirx=random(-PI,PI);
  }
  void drop() {
    e=d;
    fill(feu);
    ellipse(x+dirx,y-k,d,e+k);
    fill(c);
    ellipse(x+dirx,y,d,e);
    smooth();
    y=y+v;
    k=10;
    if(y >height-sol) {
      c=color(0);
      e=d/4;
      y=height-sol;
      feu=0;
      dirx=0;
    }

    dirx=dirx+random(-0.1,0.1);
    x=x+dirx;
  }
}


