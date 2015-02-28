

/**LOUISE
 * 
 *  
 *  Jacques Maire
 * version JAVA faite le Vendredi 1 juin 2012
 * version JS le 11 mai 2014
 */
/* @pjs preload="louise2.jpg"; */
PImage img;
float angle, co, si;
public	void setup() {
  size(500, 565, P2D);
  img=loadImage("louise2.jpg");
  img.loadPixels();
  //	  frameRate(40);
}

public	void draw() {
  background(50,80,20);
  angle+=0.04;
  co=cos(angle);
  si=sin(angle);
  for (int i=0;i<img.width-1;i+=20) {
    for (int j=0;j<img.height-1;j+=20) {
      hachure( new PVector( i, j), i, j);
    }
  }
}
//+++++++++++++++++++++++++++++++++++++++++++++++
void hachure(PVector depart) {
  int compteur=0;
  float ncol;
  PVector arrivee;

  while ( cadree (depart) && compteur<400) {
    ncol=couleur(depart);
    arrivee=PVector.add(dir(ncol), depart);
    compteur++;
    if (cadree(arrivee)) {
      ligne(depart, arrivee, ncol);
      depart=arrivee;
    }
  }
}

boolean cadree(PVector v) {
  return ((v.x>=0)&&(v.x<img.width)&&(v.y<img.height)&&(v.y>=0));
}

float couleur(PVector v) {
  int c;
  int u=round(floor(v.y)*img.width+v.x);
  if ((u<0)||(u>img.width*img.height-1)) c=0x99FFFF; 
  else
    c= img.pixels[u];
  return blue(c);
}

PVector dir(float cc) {
  float r=range(cc, 0, 255, 0, 1);
  PVector res= new PVector(2*co-r*si, r*si+2*co);
  res.normalize();
  res= PVector.mult(res, 8);
  return res;
}


void ligne(PVector u, PVector v, float c) { 
  stroke(c,c/3,0.5*(255-c));
  strokeWeight(2);
  line(u.x, u.y, v.x, v.y);
}

float range(float x, float a, float b, float aa, float bb) {
  return aa+(x-a)*(bb-aa)/(b-a);
}



