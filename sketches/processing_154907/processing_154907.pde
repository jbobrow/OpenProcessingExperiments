
/* @pjs preload="florine.jpg"; 
 */



/**   Florine
 *
 *   fait par Jacques Maire
 *
 *   le 15 juillet 2014
 *
 *    http://www.xelyx.fr
 *
 *
 **/


 
int numeroEnPrise;
Hexagone hexagone;

float temps;
boolean okDrag;



void setup() {
  size(700,700,P3D);
 
  hexagone=new Hexagone();
  okDrag=false;
  numeroEnPrise=100;
}




void draw() {
  background(220, 50, 200);
  temps=0.001*millis();
  translate(width/2.0, height/2.0);
 
  hexagone.actualiser( );
 
 
}

void mouseReleased() {
  okDrag=false;
}

void mousePressed() {
  if (!okDrag) {
    numeroEnPrise=100;
    float distance=2000;
    for (int i=0; i<hexagone.nsommets; i++) {
      float d=sqrt(sq(hexagone.points1[i].x-mouseX+width/2)+sq(hexagone.points1[i].y-mouseY+height/2));
      if ( d<distance && d<20) {
        numeroEnPrise=i; 
        okDrag=true;
      }
    }
  }
}


void mouseDragged() {

  if (okDrag && numeroEnPrise<hexagone.nsommets) {
   
    hexagone.points1[numeroEnPrise].x=mouseX-width/2;
    hexagone.points1[numeroEnPrise].y=mouseY-height/2;
  }
}



//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}



//---------------------------------------------------
void ligne(PVector u, PVector u1) {
  
  line(u.x, u.y, u1.x, u1.y);
}

//---------------------------------------------------
PVector barycentre(float lamb, PVector u, PVector v) {
  return comb(1-lamb, u, lamb, v);
}
class Hexagone {
  int nsommets;
  PImage image;
  PVector[] sommets, points, points1, points2, circonf;
  float rayon=80;
  float c3=cos(PI/3);
  float s3=sin(PI/3);
  PVector dir0, dir1, dir2;
  Hexagone() {
    image=loadImage("florine.jpg" );
    nsommets=6; 
    sommets=new PVector[nsommets];
    points=new PVector[nsommets];
    points1=new PVector[nsommets];
    points2=new PVector[nsommets];
    circonf=new PVector[nsommets*3+1];
    dir0=new PVector(0, 2.0*s3*rayon);
    dir1=new PVector(-2.0*s3*s3*rayon, -2.0*s3*c3*rayon);
    dir2=new PVector(2.0*s3*s3*rayon, -2.0*s3*c3*rayon);
    for (int i=0; i<nsommets; i++) {
      sommets[i]=new PVector();
      points[i]=new PVector();
    }
    reset();
  }
  void   actualiser() {
    for (int i=0; i<nsommets; i++) {
      PVector centre=comb(0.5, points1[i], 0.5, points[i]);
      PVector ray=comb(0.5, points1[i], -0.5, points[i]);
      points2[i]=PVector.add(centre, tourner(temps, ray));
    }

    circonf[0]=sommets[0];
    circonf[1]=points2[0];
    circonf[2]=points2[1];
    circonf[3]=sommets[1];
    circonf[4]=PVector.add(dir0, points2[5]);
    circonf[5]=PVector.add(dir0, points2[4]);
    circonf[6]=sommets[2]; 
    circonf[7]=points2[2]; 
    circonf[8]=points2[3]; 
    circonf[9]=sommets[3];  
    circonf[10]=PVector.add(dir1, points2[1]); 
    circonf[11]=PVector.add(dir1, points2[0]);  
    circonf[12]=sommets[4]; 
    circonf[13]=points2[4];
    circonf[14]=points2[5];
    circonf[15]=sommets[5];
    circonf[16]=PVector.add(dir2, points2[3]); 
    circonf[17]=PVector.add(dir2, points2[2]); 
    circonf[18]=sommets[0];
    stroke(0);

    for (int u=-4; u<4; u++) {   
      pushMatrix();
      translate(1.5*rayon*u, s3*rayon*u);
      for (int k=-6; k<5; k++) {
        pushMatrix();
        translate(k*dir0.x, k*dir0.y);
        PVector vtt=tourner(temps, new PVector(1.5*rayon*u+k*dir0.x, s3*rayon*u+k*dir0.y));
        vtt=PVector.add(vtt, new PVector(0.5*width, 0.5*height));
        dessin(u, k, vtt.x, vtt.y);
        popMatrix();
      }
      popMatrix();
    }
    fill(255, 255, 0);

    for (int i=0; i<nsommets; i++) {
      noStroke();
      pushMatrix();
      translate(points1[i].x, points1[i].y, 4);
      sphere(8);
      popMatrix();
    }
  }



  void dessin(int v, int w, float dx, float dy) {
    noStroke();
    int u1=v%3;
    int u2=w%3;
    int u=abs(u1-u2)%3;
    int c=#ff9999;
    if (u==0)c=#ffffff;
    if (u==1)c=#9999ff;
    fill(c);
    beginShape();
    texture(image);
    for (int i=0; i< (3*nsommets+1); i++) { 
      vertex(circonf[i].x, circonf[i].y, (circonf[i].x+dx), (circonf[i].y+dy));//
    }
    endShape(CLOSE);
  } 
  void reset() {
    sommets[0]=new PVector( rayon, 0);
    sommets[1]=new PVector(c3*rayon, s3*rayon);
    sommets[2]=new PVector(-c3*rayon, s3*rayon);
    sommets[3]=new PVector( -rayon, 0);
    sommets[4]=new PVector(-c3*rayon, -s3*rayon);
    sommets[5]=new PVector(c3*rayon, -s3*rayon);
    points[0]=barycentre(0.4, sommets[0], sommets[1]);
    points[1]=barycentre(0.6, sommets[0], sommets[1]);
    points[2]=barycentre(0.4, sommets[2], sommets[3]);
    points[3]=barycentre(0.6, sommets[2], sommets[3]);
    points[4]=barycentre(0.4, sommets[4], sommets[5]);
    points[5]=barycentre(0.6, sommets[4], sommets[5]);
   
   
    points1[0]=tourner(2*PI/6, new PVector(20, 0 ));
    points1[1]=tourner(4*PI/6, new PVector(20, 0 ));
    points1[2]=tourner(6*PI/6, new PVector(20, 0 ));
    points1[3]=tourner(8*PI/6, new PVector(20, 0 ));
    points1[4]=tourner(10*PI/6, new PVector(20, 0 ));
    points1[5]=tourner(12*PI/6, new PVector(20, 0 ));
  }
  PVector tourner(float t, PVector v) {
    return new PVector(cos(t)*v.x-sin(t)*v.y, cos(t)*v.y+sin(t)*v.x);
  }
}



