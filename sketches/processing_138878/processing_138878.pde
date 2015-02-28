
int n=96;
ligne[] lignes;
PVector[][] vects;
PVector keepMouse;
color fond=color(37, 42, 85);

void setup() {
  size(600, 600);
  background(fond);
    fill(255);
  noStroke();
  vects = new PVector[n][0];
  lignes = new ligne[0]; 
  float divid = width/20;
  for (int a=0;a<width+divid;a+=divid) {
    // new ligne(new PVector(a, height/2 -random(height/2)), new PVector(a,height/2 +random(height/2)));
    float h=random(-70, -50);
    new ligne(new PVector(a, h), new PVector(a, h+random(720,740)));
  }
}

void draw() {
  dessineTout();
//  save("test.png");
 // noLoop();
}

class ligne {
  PVector p1, p2;
  float an=random(TWO_PI);
  float v = random(-0.08, 0.08);
  ligne(PVector _p1, PVector _p2) {
    p1=_p1;
    p2=_p2;
    lignes = (ligne[]) append(lignes, this);
  }
  void dessine() {
     an+=v;
    float tw = ( p2.x-p1.x)/(n*1.0);
    float th = ( p2.y-p1.y)/(n*1.0);
    for (int a=0;a<n;a++) { 
      PVector v=new PVector(p1.x+(a*tw), p1.y+(a*th)+sin(an)*50); 
      point(v.x, v.y);
      vects[a] = (PVector[]) append(vects[a], v);
    }
  }
}

 
 

void dessineTout() {
  background(fond);
  vects = new PVector[n][0];
  for (ligne l:lignes) {
    l.dessine();
  }
  PVector[][] rects=new PVector[0][0];
  for (int a=0;a<vects.length;a++) {
    boolean pair=a%2==0;
    if (pair) {
      rects = (PVector[][]) append(rects, new PVector[0]);
      PVector[] vs = vects[a];
      rects[rects.length-1] = (PVector[]) concat( rects[rects.length-1], vs);
    } 
    else {
      PVector[] vs = (PVector[]) reverse(vects[a]);
      rects[rects.length-1] = (PVector[]) concat( rects[rects.length-1], vs);
    }
  }
  for (int a=0;a<rects.length;a++) {
    beginShape();
    for (PVector v:rects[a]) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
}

