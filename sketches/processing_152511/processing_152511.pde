


/**  PENCILS FOR HYPERBOLE
 *
 *   fait par Jacques Maire
 *
 *   Lundi 23 juin 2014
 *
 *    http://www.xelyx.fr
 *
 *    Generation d'une hyperbole par des homologies
 **/



int nframes=5;
int nbCycles=50;
int nc=80;
int sequence;
PVector[] frames;
float temps, beta,para1;
boolean okDrag;
PVector souris, dirv, dirh;
PFont myFont;
Cycle[] aCycles;


void setup() {
  size(600, 600, P2D);
  frames=new PVector[nframes];
  para1=80;
  for (int i=0; i<nframes; i++) {
    frames[i]=new PVector();
  }
  frames[0]=new PVector(0, 0);//Centre du faisceau
  frames[1]=new PVector(para1, para1);//R 
   frames[3]=new PVector(-para1, para1);//R 
  frames[2]=new PVector(-para1, -para1);//S  centre du deuxieme faisceau
  frames[4]=new PVector(200*cos(-1.1)+frames[1].x, 400*sin(-1.1)+frames[1].y);
  
  dirv=PVector.sub(frames[2], frames[3]);  
  dirh=PVector.sub(frames[1], frames[3]);
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
 strokeWeight(2);
  
  ligneplus(frames[2], dirv, color(255));
   ligneplus(frames[3], dirh, color(255));
   ligne(frames[0],frames[4],color(0,255, 255));
   strokeWeight(1 );
   ligneplus(frames[0],dirv, color(155));
  ligneplus(frames[0], dirh, color(155));
  for (int i=0; i<nbCycles; i++) {
    aCycles[i].calculTraces(i);
    aCycles[i].dessin1();}
    if(nbCycles==1)aCycles[0].drawTri();

    theTexte();
  }
  
  
  void mouseDragged() {

    frames[4].x+=mouseX-pmouseX;
    frames[4].y+=mouseY-pmouseY;
  }
  
  void keyPressed(){
  
  if(key=='+' && nbCycles<nc)nbCycles++;
  if(key=='-'  && nbCycles>1) nbCycles--;
}

  //---------------------------------------------------
  PVector comb(float a1, PVector v1, float a2, PVector v2) {
    return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
  }
  //---------------------------------------------------
  void ligneplus(PVector u, PVector di, color c) {
    stroke(c);
    PVector v=PVector.add(u,di);
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




  
  PVector tourner(int n){
    float a=n*beta;
  PVector v=PVector.sub(frames[4],frames[1]);
  PVector w=new PVector(cos(a)*v.x-sin(a)*v.y,cos(a)*v.y+sin(a)*v.x);
  return PVector.add(frames[1],w);
  }
  
class Cycle {

  PVector[] pTraces;

   

  public Cycle() {
    pTraces=new PVector[3];
   
  }
 
  void calculTraces(int i) {
    PVector point2=tourner(i);
    PVector ve=inter2Lines(frames[0], point2, frames[2],frames[3] );
    PVector vf=inter2Lines(frames[0], point2, frames[1], frames[3]);
    PVector vg=inter2Lines(vf, PVector.add(vf, dirv), ve, PVector.add(ve, dirh));
   
    pTraces=new PVector[] {ve, vf, vg};
  }


  void dessin1()
  {
    
    ligne(pTraces[1], pTraces[0], #8888ff);
    ligne(pTraces[1], pTraces[2], #00ff00);
    ligne(frames[3], pTraces[2], #00ff00);
    ligne(pTraces[1], pTraces[2], #ff0000);   
    ligne(pTraces[2], pTraces[0], #8888ff);
    noStroke();
    fill(255, 0, 0);
    ellipse(pTraces[2].x, pTraces[2].y, 9, 9);
  }
  void drawTri(){
    fill(255,150);
    beginShape(TRIANGLES);
    vertex(0,0);
    vertex(0,para1);
    vertex(pTraces[1].x,pTraces[1].y);
    vertex(pTraces[0].x,pTraces[0].y);
    vertex(0,0);
    vertex(0,pTraces[0].y);
    endShape();
    textFont(myFont);
  fill(255);
  text(" ( x , y=a*a/x )", pTraces[2].x-20,pTraces[0].y-20);
  text(" y ", 3,pTraces[0].y/2);
    text(" x", pTraces[1].x/2, para1-10);
     text(" a ", 3,para1/2);
      text(" a ", -para1/2,pTraces[0].y-3);
  }
  
}


