
/**
 * Tempesta
 *
 * Fait par Jacques Maire
 * le 11 mai 2014
 */
  /* @pjs preload="profil300.gif"; */
PImage img;
float angle, co, si;
void setup() {
  size(300, 540);
  img=loadImage("profil300.gif");
  img.loadPixels();
  size(img.width, img.height, P3D);
  
}

void draw() {
  background(0,0,64,255);
  angle+=0.01;
  co=cos(angle);
  si=sin(angle);
strokeWeight(3);
  for (int i=0;i<img.width-1;i+=30) {
    for (int j=0;j<img.height-1;j+=30) { 
      hachure( new PVector( i, j));
    }
  }
}
//+++++++++++++++++++++++++++++++++++++++++++++++
void hachure(PVector depart) {
  float ncol=couleur(depart);
  PVector arrivee=PVector.add(dir(ncol), depart);

  while ( (cadree (arrivee)) && (ncol==couleur(arrivee))) {
    arrivee=PVector.add(dir(ncol), arrivee);
  }
  if (cadree(arrivee)) {
    ligne(depart, arrivee, ncol);
    hachure( arrivee);
  }
  else {
    while (!cadree (arrivee)) { 
      arrivee=PVector.sub(arrivee, dir(ncol));
    }
    ligne(depart, arrivee, ncol);
  }
}


boolean cadree(PVector v) {
  return ((v.x>=0)&&(v.x<img.width)&&(v.y<img.height)&&(v.y>=0));
}

float couleur(PVector v) {
  int c= img.pixels[int(floor(v.y)*img.width+v.x)];

  return blue(c);
}

PVector dir(float cc) {
  float r=range(cc, 0, 255, 0, 10);
  float x=10*co-r*si;
  float y=(r*si+10*co)/3;
  return new PVector(round(abs(x)+0.5), round(abs(y)+0.5));
}


void ligne(PVector u, PVector v, float cc) { 
  stroke(int(cc));
  line(u.x, u.y, v.x, v.y);
}

float range(float x, float a, float b, float aa, float bb) {
  return aa+(x-a)*(bb-aa)/(b-a);
}




