
/**   Coniques Projectives 2D
 *
 *   fait par Jacques Maire
 *
 *   Mercredi 18 juin 2014
 *
 *    http://www.xelyx.fr
 *
 *
 * R, S , U est un triangle rectangle isocele en U .
 * O est le milieu du segment RS.
 * On utilise la direction de droite UO. 
 * Les quatre points R, S,U, O sont fixes.
 * On utilise les faisceaux de droites issues de R (droites rouges), issues de S (droites vertes)
 * et le faisceau bleu des droites de direction fixe OU. 

 * Les faisceaux sont trÃ�ï¿½Ã�Â¨s facilement reperable par leurs couleurs 
 * et leurs axes de rebond .Le faisceau rouge rebondit sur la verticale dans le 
 * faisceau bleu et celui-ci rebondit sur l'horizontale dans le faisceau vert.
 * Les faisceaux rouge et vert rebondissent sur le cercle!
 * C'est pas etonnant puisque la droite verte est hauteur relativement a la rouge
 * Ce sketch bien que faisant reference a une figure elementaire est fondateur 
 * pour comprendre le mecanisme des faisceaux.
 **/

int nframes=5;
int nbCycles=10;
int nc=120;
int sequence;
PVector[] frames;
float temps, beta;
boolean okDrag;
PVector souris;
PFont myFont;
Cycle[] aCycles;


void setup() {
  size(600, 600, P2D);
  frames=new PVector[nframes];
  for (int i=0; i<nframes; i++) {
    frames[i]=new PVector();
  }
  frames[0]=new PVector(0, 150);//Point U
  frames[1]=new PVector(-150, 150);//R 
  frames[2]=new PVector(0, 0);//S  centre du deuxieme faisceau
  frames[3]=barycentre(0.5, frames[1], frames[2]);//milieu de RS .
  frames[4]=new PVector(200*cos(-1.1)+frames[1].x, 400*sin(-1.1)+frames[1].y);
  rectMode(CENTER);
  myFont = createFont("Georgia", 13);
  okDrag=false;
  aCycles=new Cycle[nc];
  for (int i=0; i<nc; i++) {
    aCycles[i]=new Cycle();
  }
  beta=TWO_PI/nc;
}

void draw() {
  background(0);
  temps=0.0002*millis();
  translate(width/2.0, height/2.0);

  souris=new PVector(mouseX-width/2, mouseY-height/2);

  for (int i=0; i<nframes; i++) {
    noStroke();
    color c=(i<4)? #ffffff :#ffff00;
    fill(c);
    ellipse(frames[i].x, frames[i].y, 7, 7);
  }
  ligneplus(frames[0], frames[1], color(0, 255, 0));
  ligneplus(frames[0], frames[2], color(0, 255, 0));
  ligneplus(frames[2], frames[1], color(255, 255, 0));
  for (int i=0; i<nbCycles; i++) {
    aCycles[i].calculTraces(i);
    aCycles[i].dessin1();}

    theTexte();
  }
  
  
  void mouseDragged() {

    frames[4].x+=mouseX-pmouseX;
    frames[4].y+=mouseY-pmouseY;
  }
  
  void keyPressed(){
  
  if(key=='+' && nbCycles<60)nbCycles++;
  if(key=='-'  && nbCycles>1) nbCycles--;
}

  //---------------------------------------------------
  PVector comb(float a1, PVector v1, float a2, PVector v2) {
    return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
  }
  //---------------------------------------------------
  void ligneplus(PVector u, PVector v, color c) {
    stroke(c);
    PVector uu=barycentre(4.0, u, v);
    PVector vv=barycentre(-4.0, u, v);
    line(uu.x, uu.y, vv.x, vv.y);
  }


  //---------------------------------------------------
  void ligne(PVector u, PVector u1, color c) {
    stroke(c);
    line(u.x, u.y, u1.x, u1.y);
  }
  //---------------------------------------------------

  PVector inter2Lines(PVector p1, PVector q1, PVector p2, PVector q2) {
    PVector p1p2=PVector.sub(p2, p1);
    PVector d1=PVector.sub(q1, p1);
    PVector d2=PVector.sub(q2, p2);  
    float lambda=detxy(p1p2, d2)/detxy(d1, d2);
    return barycentre(lambda, p1, q1);
  } 
  //---------------------------------------------------
  PVector barycentre(float lamb, PVector u, PVector v) {
    return comb(1-lamb, u, lamb, v);
  }
  //---------------------------------------------------
  float detxy(PVector u, PVector v) {
    return u.x*v.y-u.y*v.x;
  }
  //---------------------------------------------------
  void quad4(PVector u0, PVector u1, PVector u2, PVector u3) {
    pushMatrix();
    noStroke();
    fill(0, 0, 255);
    beginShape(QUADS);
    vertex(u0.x, u0.y);
    vertex(u1.x, u1.y);
    vertex(u2.x, u2.y);
    vertex(u3.x, u3.y);
    endShape();
    popMatrix();
  } 
 
void balle(PVector p, float r, color c) {
  stroke(0);
  fill(c);
  ellipse(p.x, p.y, r, r);
}

void theTexte() {
  textFont(myFont);
  fill(255);
  text("drag mouse ........ keys  :  '+'   or   '-'", -90, height/2 - 20);
}



class Cycle {

  PVector[] pTraces;


  public Cycle() {
   
    pTraces=new PVector[4];
   
  }
 
  void calculTraces(int i) {
    PVector point2=tourner(i);
    PVector ve=inter2Lines(frames[0], frames[2], frames[1], point2);//point E
    PVector dir=PVector.sub(frames[0], frames[3]);//la direction othogonale a [R,S]
    PVector vf=inter2Lines(frames[0], frames[1], ve, PVector.add(ve, dir));//point F
    PVector vg=inter2Lines(ve, frames[1], vf, frames[2]);//point G
    PVector vh=inter2Lines(frames[1], frames[2], vf, ve);//point H
    pTraces=new PVector[] {
      ve, vf, vg, vh
    };
   
  }


  void dessin1()
  {
    ligne(frames[1], pTraces[0], #ff0000);
    ligne(pTraces[1], pTraces[0], #8888ff);
    ligne(pTraces[1], pTraces[2], #00ff00);
    ligne(frames[2], pTraces[2], #00ff00);

    ligne(frames[1], pTraces[3], #ff0000);
    ligne(frames[1], pTraces[2], #ff0000);
    ligne(frames[1], frames[4], #ff0000);
    ligne(pTraces[3], pTraces[0], #8888ff);

    noStroke();
    fill(255, 255, 0);
    ellipse(pTraces[2].x, pTraces[2].y, 6, 6);
    
    
    fill(255, 0, 0);
   if(nbCycles==1){
     PVector u=PVector.sub(frames[4],frames[1]);
  float ang=atan2(u.y,u.x);
  pushMatrix();
  translate(pTraces[2].x,pTraces[2].y);
  rotate(ang);
    rect(-20, 20, 40, 40);
    popMatrix();
 
    rect(frames[0].x+20, frames[0].y-20, 40, 40);
    pushMatrix();
    translate(pTraces[3].x, pTraces[3].y);
    rotate(PI/4);
    rect(20, 20, 40, 40);
    popMatrix();}
    
  }
}
  
  PVector tourner(int n){
    float a=n*beta;
  PVector v=PVector.sub(frames[4],frames[1]);
  PVector w=new PVector(cos(a)*v.x-sin(a)*v.y,cos(a)*v.y+sin(a)*v.x);
  return PVector.add(frames[1],w);
  }
  


