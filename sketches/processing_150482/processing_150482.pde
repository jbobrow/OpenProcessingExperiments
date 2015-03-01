

/**   Coniques Projectives 2D
 *
 *   fait par Jacques Maire
 *
 *   Jeudi 5 juin 2014
 *
 *    http://www.xelyx.fr
 *
 *
 * On utilise 4 points draguables R, S, P, U.
 * Les coniques sont obtenues par intersection des droites isssues du point R 
 * avec leurs images homographiques issues d'un point S .
 * 
 * L'homographie entre les 2 faisceaux est determinee par le couple de droites
 *  secantes SU, RU,et par les droites (tangentes à la conique) en R et S, PR et PS.
 * P est ainsi le point de Pappus de l'homographie.
 **/


int nframes=4;
int numeroEnPrise;
Faisceau faisceau;
PVector[] frames;
float temps;
boolean okDrag;



void setup() {
  size(600, 600, P2D);
  frames=new PVector[nframes];
  for (int i=0; i<nframes; i++) {
    frames[i]=new PVector();
  }
  frames[0]=new PVector(40, 20);//Point de Pappus
  frames[1]=new PVector(-200, -200);//R centre du premier faisceau
  frames[2]=new PVector(200, -200);//S  centre du deuxieme faisceau
  frames[3]=new PVector(-80, 0);//U intersection de 2 droites correspondantes .
  rectMode(CENTER);
  faisceau=new Faisceau();
  okDrag=false;
  numeroEnPrise=-1;
}




void draw() {
  background(255, 200, 150);
  temps=0.0002*millis();
  translate(width/2.0, height/2.0);
 
  faisceau.actualiser( );
  fill(0);
  for (int i=0; i<nframes; i++) {
    noStroke();
    ellipse(frames[i].x, frames[i].y, 18, 18);
  }
  ligne(frames[0], frames[1], color(0, 255, 0));
  ligne(frames[0], frames[2], color(0, 255, 0));
  ligne(frames[2], frames[3], color(0));
  ligne(frames[1], frames[3], color(0));
}

void mouseReleased() {
  okDrag=false;
}

void mousePressed() {
  if (!okDrag) {
    numeroEnPrise=-1;
    float distance=2000;
    for (int i=0; i<nframes; i++) {
      float d=sqrt(sq(frames[i].x-mouseX+width/2)+sq(frames[i].y-mouseY+height/2));
      if ( d<distance && d<20) {
        numeroEnPrise=i;
        okDrag=true;
      }
    }
  }
}


void mouseDragged() {

  if (okDrag && numeroEnPrise>-1) {

    frames[numeroEnPrise].x=mouseX-width/2;
    frames[numeroEnPrise].y=mouseY-height/2;
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


class Droite {
  PVector from, to, dir;
  float angle;


  Droite(float t) {
    from=new PVector();
    to=new PVector();
    dir=new PVector();
    angle=t;
    actualiser();
  }


  void actualiser() {
    from=frames[1];
    dir=new PVector(600*cos(angle+temps), 600*sin(angle+temps));
    to=PVector.add(from, dir);
    ligne(from, to, color(255));//la droite d
    PVector D1=inter2Lines(from, to, frames[2], frames[3]);
    PVector D2=inter2Lines(D1, frames[0], frames[1], frames[3]);
    ligne(frames[2], D2, color(255, 0, 0));
    PVector D3=inter2Lines(from, to, frames[2], D2);
    ligne(from, D3, color(255, 0, 0));
    ligne(frames[2], D3, color(255, 0, 0));
    balle(D3, 8, color(0, 0, 255));
  }


}

class Faisceau {
  int ndroites=120;
  Droite[] droites;
  Faisceau() {   
    droites=new Droite[ndroites];
    for (int i=0; i<ndroites; i++) {
      droites[i]=new Droite((TWO_PI/ndroites)*i);
    }
    actualiser();
  }

  void actualiser() {
    for (int i=0; i<ndroites; i++) {
      droites[i].actualiser();
    }
  }
}
