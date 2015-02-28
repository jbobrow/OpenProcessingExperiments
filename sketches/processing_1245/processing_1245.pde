

class Carre {
  color couleur;
  float coulis;
  float x,y;
  float L,L0,L1;
  float A=0;

  
  
  Carre(float xx,float yy,float LL,float coul) {
    x=xx;
    y=yy;
    L0=LL;
    L1=LL;
    L=LL;
    coulis=coul;
  }
  
  void mouse() {

    
  }
  

  void coul() {
    //coulis=((coulis+random(-10,10)));
    coulis=exp(-((X0-x)*(X0-x)+(Y0-y)*(Y0-y))/(s*s))*255+random(-50,50);
    if (coulis>255) coulis=2*255-coulis;
    if(coulis<0)  coulis=-coulis;
    A=random(-0.3,0.3);
    //L0=L1+3*L1*exp(-((X0-x)*(X0-x)+(Y0-y)*(Y0-y))/(L1*L1));
    L=random(0.9*L0,1.1*L0);
  }

  
  void dessiner() {
    noStroke();
    couleur=color(255,0,coulis);//NB
    //couleur=color(coulis,255,200);//couleur
    //couleur=color(0,255,coulis);//couleur mono
    fill(couleur);
    pushMatrix();
    translate(x,y);
    rotate(A);
    rect(-L/2,-L/2,L,L);
    popMatrix();
  }
}

