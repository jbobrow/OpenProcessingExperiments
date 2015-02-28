

/**
* Alcys_LireEnArbre
*
* Fait par Jacques Maire
* le lundi 14 mai 2012
*/
PImage img;
Repere repere;
int dimension ;
float cb, sb, cd, sd;
float pas=6;
int nbtrait, augment;
boolean fini,debut;
void setup() {
  size(700, 700, P2D);
  img=loadImage("chien700.gif");
  dimension = img.width*img.height-1;
  img.loadPixels();
  repere=new Repere(new PVector(190, 590), new PVector(190+pas, 591));
  cb=cos(-0.04);
  sb=sin(-0.04);
  cd=cos(0.001);
  sd=sin(0.001);
  frameRate(30);
  fini =false;
  debut=true;

 
}
void draw() {
  if(debut){debut=false; image(img,0,0);}
  nbtrait++;
  println(nbtrait);
  augment=nbtrait/5000;
  if (nbtrait<5450) {
    if (repere.enRecherche)
      repere.recherche();
    else
    { 
      repere.calculer();
    }
  }
}

void mouseDragged () {
  if (mousePressed && (mouseButton == LEFT)) {
    repere.from=new PVector(mouseX, mouseY);
    PVector dir=new PVector(mouseX-pmouseX, mouseY-pmouseY);
    dir.normalize();
    dir.mult(pas);
    repere.to=PVector.add(repere.from, dir);
    repere.enRecherche=true;
  }
}





int indice1(PVector v) {

  int pos=round(v.y)*img.width+round(v.x);
  pos=constrain(pos, 0, dimension-1);
  return pos;
}

float indice2(PVector v, PVector w) {
  PVector vpw=PVector.add(v, w);
  return indice1(vpw);
}

float brillance(float n) {
  float  re=brightness(img.pixels[round(n)]);
  return re;
}



void ligne(PVector u, PVector v) { 
  stroke(180);
  line(u.x, u.y, v.x, v.y);
  
  
}
PVector rotateb(PVector v) {
  PVector  res=new PVector();
  res.x=v.x*cb-v.y*sb;
  res.y=v.x*sb+v.y*cb;
  return res;
} 
PVector rotatea(PVector v, float a) {
  PVector  res=new PVector();
  res.x=v.x*cos(a)-v.y*sin(a);
  res.y=v.x*sin(a)+v.y*cos(a);
  return res;
} 
PVector rotated(PVector v) {
  PVector  res=new PVector();
  res.x=v.x*cd-v.y*sd;
  res.y=v.x*sd+v.y*cd;
  return res;
} 

public PVector comb(float t1, PVector v1, float t2, PVector v2) {
  PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
  return res;
}


