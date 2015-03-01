
/** The line Conic
 *
 *  fait par Jacques Maire
 *
 *  Samedi 7 juin 2014
 *
 *  http://www.xelyx.fr , http:www.alcys.com
 *
 *  Deux faisceaux de points  en homologie donnent des droites qui enveloppent des coniques
 *  Reference: Frank Ayres Projective Geometry :Schaum's :chapter 8
 *  Reference: Yves Ladegaillerie, Geometrie ed ellipses capitre VIII
 **/



int nframes=6;
int numeroEnPrise;
Faisceau faisceau;
PVector[] frames;
PVector palpha, pbeta, souris;
float lambda02, lambda35,temps;
boolean okDrag;



void setup() {
  size(600, 600, P2D);
  lambda02=0.6;
  lambda35=0.78;
  frames=new PVector[nframes];
  frames[1]=new PVector(0, 0);
  frames[0]=new PVector(-115, -75);// A
  frames[2]=new PVector(53, -70);//C
  frames[1]=barycentre(lambda02, frames[0], frames[2]);//B  
  frames[4]=new PVector(0, 0);
  frames[3]=new PVector(20, -163);// 
  frames[5]=new PVector(147, 40);//
  frames[4]=barycentre(lambda35, frames[3], frames[5]);
  palpha=new PVector(0, 0);
  pbeta=new PVector(0, 0);
  souris=new PVector(0, 0);
  faisceau=new Faisceau();
  okDrag=false;
  numeroEnPrise=100;
}




void draw() {
  background(0);
  translate(width/2.0, height/2.0);
  temps=0.001*millis();
  palpha=inter2Lines(frames[0], frames[4], frames[1], frames[3]);
  pbeta=inter2Lines(frames[1], frames[5], frames[2], frames[4]);

  souris=new PVector(mouseX-width/2, mouseY-height/2);
  faisceau.actualiser( );
  noStroke();
  for (int i=0; i<nframes; i++) {
    color co=(i<3)? #ff0000 : #0000ff;
    fill(co);
    ellipse(frames[i].x, frames[i].y, 18, 18);
    println(frames[i]);
  }

  ligne(frames[0], frames[1], color(255, 255, 0));
  ligne(frames[0], frames[2], color(255, 255, 0));
  ligne(frames[4], frames[3], color(255, 255, 0));
  ligne(frames[3], frames[5], color(255, 255, 0));
  ligneplus(frames[0], frames[4], color(255, 0, 0));
  ligneplus(frames[1], frames[3], color(255, 0, 0));
  ligneplus(frames[1], frames[5], color(255, 0, 0));
  ligneplus(frames[2], frames[4], color(255, 0, 0));
  ligne(palpha, pbeta, color(0, 255, 0));
}


void mouseReleased() {
  okDrag=false;
}

void mousePressed() {
  if (!okDrag) {
    numeroEnPrise=100;
    float distance=2000;
    for (int i=0; i<nframes; i++) {
      float d=sqrt(sq(frames[i].x-souris.x)+sq(frames[i].y-souris.y));
      if ( d<distance && d<20) {
        numeroEnPrise=i;
        okDrag=true;
      }
    }
  }
}


void mouseDragged() {

  if (okDrag && numeroEnPrise<nframes) {
    if (numeroEnPrise!=1 && numeroEnPrise!=4) {
      frames[numeroEnPrise].x=mouseX-width/2;
      frames[numeroEnPrise].y=mouseY-height/2;
    } else {
      if (numeroEnPrise==1) {
        PVector v02=PVector.sub(frames[0], frames[2]);
        PVector v0m=PVector.sub(frames[0], souris);
        lambda02=v0m.dot(v02)/v02.dot(v02);
      }
      if (numeroEnPrise==4) {
        PVector v35=PVector.sub(frames[3], frames[5]);
        PVector v3m=PVector.sub(frames[3], souris);
        lambda35=v3m.dot(v35)/v35.dot(v35);
      }
    }
    frames[1]=barycentre(lambda02, frames[0], frames[2]); 
    frames[4]=barycentre(lambda35, frames[3], frames[5]);
    redraw();
  }
}



//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}



//---------------------------------------------------
void ligne(PVector u, PVector u1, color c) {
  stroke(c);
  line(u.x, u.y, u1.x, u1.y);
}
//---------------------------------------------------
void ligneplus(PVector u, PVector v, color c) {
  stroke(c);
  PVector uu=barycentre(4, u, v);
  PVector vv=barycentre(-4, u, v);
  line(uu.x, uu.y, vv.x, vv.y);
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


void balle(PVector p, float r, color c) {

  stroke(0);
  fill(c);
  ellipse(p.x, p.y, r, r);
}


class Faisceau {

  int nPoint=120;
  UnPoint[] points, pionts;

  Faisceau() {


    points=new UnPoint[nPoint];
    pionts=new UnPoint[nPoint];
    for (int i=0; i<nPoint; i++) {
      points[i]=new UnPoint(new PVector(0, 0));
      pionts[i]=new UnPoint(new PVector(0, 0));
    }
    actualiser();
  }


  void actualiser() {
    for (int i=1; i<nPoint-1; i++) {
      PVector ac=PVector.sub( frames[2], frames[0]);
      PVector centr=new PVector(frames[0].x-ac.y, frames[0].y+ac.x);
      float lang=TWO_PI*i/nPoint+temps;
      PVector dir=new PVector(200*cos(lang), 200*sin(lang));
      points[i].position=inter2Lines(centr, PVector.add(centr, dir), frames[0], frames[2]);
      points[i].actualiser();
    }

    for (int i=1; i<nPoint-1; i++) {
      PVector df=PVector.sub( frames[5], frames[3]);
      PVector cen=new PVector(frames[3].x-df.y, frames[3].y+df.x);
      PVector di=new PVector(200*cos(TWO_PI*i/nPoint), 200*sin(TWO_PI*i/nPoint));
      pionts[i].position=inter2Lines(cen, PVector.add(cen, di), frames[3], frames[5]);
      pionts[i].actualiser();
    }
  }
}



class UnPoint {
  PVector position;
  float angle;


  UnPoint(PVector pos) {
    position=new PVector();
   
 
    actualiser();
  }




  void actualiser() {
    PVector  ax=inter2Lines(palpha,pbeta,position,frames[5]); 
   PVector Mimage=inter2Lines(frames[3],frames[5],frames[2],ax);
    ligneplus(position,Mimage, color(255));
}
void actauliser() {

    PVector  bx=inter2Lines(palpha,pbeta,position,frames[2]);  
    PVector Nimage=inter2Lines(frames[0],frames[2],frames[5],bx);
    ligneplus(position,Nimage, color(255));
    }
  
 


  void ligne(PVector fro, PVector too, color c ) {
    stroke(c);
    line(fro.x, fro.y, too.x, too.y);
  }


 
}

