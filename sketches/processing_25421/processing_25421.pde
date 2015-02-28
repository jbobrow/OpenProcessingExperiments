
etourneau[] etourneaux;
float cx, cy;

void setup() {
  size(500,500);
  etourneaux = new etourneau[0];
  cx=width/2; 
  cy=height/2;
  for(int a=0;a<4;a++) {
    new etourneau();
  }
  background(0);
  stroke(255); 
  smooth();
  strokeWeight(4);
  fill(0,100);
}

void draw() {
  float cxn=0,cyn=0;
  rect(-2,-2,width+4,height+4);
  for(int a=0;a<etourneaux.length;a++) {
    etourneaux[a].avance();
    cxn+=etourneaux[a].x;
    cyn+=etourneaux[a].y;
  }
  cx=approche(cx,cxn/etourneaux.length,10);
  cy=approche(cy,cyn/etourneaux.length,10);
  float vel = dist(mouseX, mouseY,pmouseX, pmouseY);
  if(mousePressed) vel+=0.5;   
  cx=approche(cx,mouseX,vel);
  cy=approche(cy,mouseY,vel);
  if(random(5)<1){
    etourneau eee=etourneaux[floor(random(etourneaux.length))];
    eee.v=-eee.v;
  }
}

class etourneau {
  etourneau e;
  float x,y, r1, r2, an,v;
  etourneau() {
    init(23);
  }
  etourneau(etourneau _e, int n) {
    e=_e;
    init(n-1);
  }
  void init(int n) {
    an = random(TWO_PI);
    v= random(PI*0.01, PI*0.05);
    if(random(1)<0.5)v=-v;
    r1 = random(20,30);
    r2 = random(20,30);
    x=cx;
    y=cy;
    if((random(3)<2.9 && n>0)) {
      new etourneau(this, n);
    }
    etourneaux = (etourneau[]) append(etourneaux, this);
  }
  void avance() { 
    an+=v;
    if(e==null) {
      // fill(255,0,0);
      x=approche(x,cx+cos(an)*r1,10);
      y=approche(y,cy+sin(an)*r2,10);
    } 
    else {
      //fill(255);
      x=approche(x,e.x+cos(an)*r1,10);
      y=approche(y,e.y+sin(an)*r2,10);
    }
    for(int a=0;a<etourneaux.length;a++) {
      etourneau ee = etourneaux[a];
      if(ee!=this) {
        eloigne(this, ee);
      }
    }
    x=constrain(x,-60,width+60);
    y=constrain(y,-60,height+60);
    point(x,y);
  }
}

float approche(float a, float b, float pc) {
  float toreturn=0;
  toreturn = a+((b-a)/100.0)*pc;
  return toreturn;
}

void eloigne(etourneau one, etourneau two) {
  float d = dist(one.x, one.y, two.x, two.y);
  if(d<13) {
    two.x=one.x+((two.x-one.x)/d)*14;
    two.y=one.y+((two.y-one.y)/d)*14;
  }
}


