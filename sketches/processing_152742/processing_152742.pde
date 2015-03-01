


/**  PENCILS FOR PARABOLE
 *
 *   fait par Jacques Maire
 *
 *   Lundi 23 juin 2014
 *
 *    http://www.xelyx.fr
 *
 *    Generation d'une parabole par des homologies
 **/



int nframes=3;
int nbCycles=30;
int nc=200;
int sequence;
PVector[] frames;
float temps, beta, para1;
boolean okDrag,boolturn;
PVector souris, dirv, dirh;
PFont myFont;
Cycle[] aCycles;


void setup() {
  size(600, 600, P2D);
  myFont = createFont("Georgia", 13); 
  frames=new PVector[nframes];
  para1=-200;//coefficient a

  for (int i=0; i<nframes; i++) {
    frames[i]=new PVector();
  }
  frames[0]=new PVector(0, 0);//Centre du faisceau
  frames[1]=new PVector(para1, 0);//A 
  frames[2]=new PVector(200, 0);//E

  dirv=new PVector(0, 200);
  dirh=new PVector(200, 0);
 
  okDrag=false;
  boolturn=true;
  aCycles=new Cycle[nc];
  for (int i=0; i<nc; i++) {
    aCycles[i]=new Cycle(i);
  }
  beta=-TWO_PI/nc;
}




void draw() {
  background(0);
  temps=0.001*millis();
  translate(width/2.0, height*0.6);
  if(boolturn){
   frames[2].x=200*cos(temps);
  frames[2].y=200*sin(temps);
  
  }
  souris=new PVector(mouseX-width/2, mouseY-height/2);

  for (int i=0; i<nframes; i++) {
    noStroke();
    color c=(i<4)? #ffffff :#ffff00;
    fill(c);
    ellipse(frames[i].x, frames[i].y, 7, 7);
  } 
  strokeWeight(2);

  ligneplus(frames[0], dirv, color(255));
  ligneplus(frames[0], dirh, color(255));
  ligneplus(frames[1], dirv, color(255, 0, 0));
  strokeWeight(1 );



  for (int i=0; i<nbCycles; i++) {
    aCycles[i].calculTraces();
    aCycles[i].dessin1();
  }
   if(nbCycles==1){aCycles[0].drawTri();}

  theTexte();
}


void mouseDragged() {
  if(!boolturn){
  frames[2].x+=mouseX-pmouseX;
  frames[2].y+=mouseY-pmouseY;}
}

void keyPressed() {

  if (key=='+' && nbCycles<nc)nbCycles++;
  if (key=='-'  && nbCycles>1) nbCycles--;
  if (key=='w') {boolturn = !boolturn;println(boolturn);}
}

//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}
//---------------------------------------------------
void ligneplus(PVector u, PVector di, color c) {
  stroke(c);
  PVector v=PVector.add(u, di);
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
  text("drag mouse ........ keys  :  '+'   or   '-''   or   'w'", -75, height*0.4 - 20);
}





PVector tourner(int n) {
  float a=n*beta+atan2(frames[2].y, frames[2].x);
  return new PVector(cos(a)*500, sin(a)*500);
}

class Cycle {

  PVector[] pTraces;
  int indice;
   

  public Cycle(int u) {
    indice=u;
    pTraces=new PVector[4];
   
  }
 
  void calculTraces() {
    PVector point2=tourner(indice);
    PVector ve=inter2Lines(frames[0], point2, frames[1],PVector.add(frames[1],dirv) );
    PVector vf=new PVector(0,ve.y);
    PVector vg=new PVector(ve.y,0);
    PVector vp=inter2Lines(frames[0], point2, vg,PVector.add(vg,dirv) );
    pTraces=new PVector[] {ve, vf, vg,vp};
  }


  void dessin1()
  {if(indice==0){strokeWeight(4);}else{strokeWeight(1);}
    ligneplus(frames[0], frames[2], #ffffff);
    ligne(pTraces[1], pTraces[0], #ff7777);
    ligne(pTraces[1], pTraces[2], #00ff55);
    
    ligne(pTraces[3], pTraces[2], #6666ff);   
   ligne(pTraces[3],frames[0], #999900);
    ligne(pTraces[3],pTraces[0], #999900);
    strokeWeight(1); 
    noStroke();
    fill(255, 0, 0);
    ellipse(pTraces[3].x, pTraces[3].y, 9, 9);
  }
 void drawTri(){
    fill(255,150);
    beginShape(TRIANGLES);
    vertex(0,0);
    vertex(para1,0);
    vertex(pTraces[0].x,pTraces[0].y);
    vertex(pTraces[2].x,pTraces[2].y);
    vertex(pTraces[3].x,pTraces[3].y);
    vertex(0,0);
    endShape();
    textFont(myFont);
  fill(255);
  text(" ( x , y=x*x/a )", pTraces[3].x-20,pTraces[3].y-20);
  text(" y ", pTraces[3].x+20,pTraces[3].y/2);
  
    text(" x",para1-20, pTraces[0].y/2+20);
     text(" a ", para1/2, pTraces[0].y+20);
      text(" x ", 10,pTraces[0].y/2);
       text(" x ", pTraces[2].x/2,20);
  }
  
}
