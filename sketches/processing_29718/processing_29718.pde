
class Carre {
  
  PVector pos;
  PVector dep;
  PVector vel;
  PVector posa;
  PVector posb;
  PVector posc;
  PVector posd;
  float cote;
  int r;
  int g;
  int b;
  int t;
  
  Carre(float xin,float yin, float cotein, int rin, int gin, int bin, int tin) {
    pos = new PVector(xin, yin);
    dep = new PVector(0,0);
    vel = new PVector(0,0);
    cote = cotein;
    posa = new PVector(pos.x+cote/2,pos.y+cote/2);
    posb = new PVector(pos.x+cote/2,pos.y-cote/2);
    posc = new PVector(pos.x-cote/2,pos.y-cote/2);
    posd = new PVector(pos.x-cote/2,pos.y+cote/2);
    r = rin;
    g = gin;
    b = bin;
    t = tin;
  }
  
  void run() {
    frame();
    update();
    display();
  }
  
  void display() {
    noStroke();
    fill(r,g,b,t);
    rectMode(CORNERS);
    float subwsize = wsize/division;
    for (int i = 0; i < division; i++) {
      for (int j = 0; j < division; j++) {
        if (symetrie) {
          if (i%2 == 0 && j%2 == 0) {
            rect(i*subwsize,posa.y/division+j*subwsize,i*subwsize+subwsize,posb.y/division+j*subwsize);
            rect(posa.x/division+i*subwsize,j*subwsize,posc.x/division+i*subwsize,j*subwsize+subwsize);
          } else if (i%2 == 0 && j%2 == 1) {
            rect(i*subwsize,subwsize-(posa.y/division)+j*subwsize,i*subwsize+subwsize,subwsize-(posb.y/division)+j*subwsize);
            rect(posa.x/division+i*subwsize,j*subwsize,posc.x/division+i*subwsize,j*subwsize+subwsize);
          } else if (i%2 == 1 && j%2 == 0) {
            rect(i*subwsize,posa.y/division+j*subwsize,i*subwsize+subwsize,posb.y/division+j*subwsize);
            rect(subwsize-(posa.x/division)+i*subwsize,j*subwsize,subwsize-(posc.x/division)+i*subwsize,j*subwsize+subwsize);
          } else if (i%2 == 1 && j%2 == 1) {
            rect(i*subwsize,subwsize-(posa.y/division)+j*subwsize,i*subwsize+subwsize,subwsize-(posb.y/division)+j*subwsize);
            rect(subwsize-(posa.x/division)+i*subwsize,j*subwsize,subwsize-(posc.x/division)+i*subwsize,j*subwsize+subwsize);
          }
        } else {
          rect(i*subwsize,posa.y/division+j*subwsize,i*subwsize+subwsize,posb.y/division+j*subwsize);
          rect(posa.x/division+i*subwsize,j*subwsize,posc.x/division+i*subwsize,j*subwsize+subwsize);
        }
      }
    }
    if (show) {
      noFill();
      stroke(0);
      strokeWeight(1);
      beginShape();
      vertex(posa.x/division,posa.y/division);
      vertex(posb.x/division,posb.y/division);
      vertex(posc.x/division,posc.y/division);
      vertex(posd.x/division,posd.y/division);
      endShape(CLOSE);
    }
  }
  
  void frame() {
    if (pos.x > wsize-cote/2-ecart/2) {
      pos.x = wsize-cote/2-ecart/2;
    }
    if (pos.x < cote/2+ecart/2) {
      pos.x = cote/2+ecart/2;
    }
    if (pos.y > wsize-cote/2-ecart/2) {
      pos.y = wsize-cote/2-ecart/2;
    }
    if (pos.y < cote/2+ecart/2) {
      pos.y = cote/2+ecart/2;
    }
  }
  
  void update() {
    if (diagonale) {
      if (pos.y != pos.x) {
        dep.y -= pos.y-pos.x;
      }
    }
    vel.add(dep);
    vel.mult(damping);
    pos.add(vel);
    dep.mult(0);
    posa = new PVector(pos.x+cote/2,pos.y+cote/2);
    posb = new PVector(pos.x+cote/2,pos.y-cote/2);
    posc = new PVector(pos.x-cote/2,pos.y-cote/2);
    posd = new PVector(pos.x-cote/2,pos.y+cote/2);
  }
  
}

