
poin[] points;
variateur maxi;
variateur diff=new variateur(0.1,1.1,199);
variateur offset=new variateur(-0.0002,0.02,100);
variateur couleur=new variateur(0,255, 2100);
variateur fond=new variateur(0,50,2800);
variateur centre = new variateur(-2,1,200);
float off=0;

void setup(){
  size(500,500);
  strokeWeight(3);
  colorMode(HSB);noFill();
  maxi=new variateur((width/2)*0.2, width*0.45, 212);
  background(0);
  noStroke();
  points = new poin[0];
  for(int a=0;a<3;a++){
  new poin();
  }
}

void draw(){
  fill(fond.avance(),9); 
  centre.avance();
  noStroke();rect(0,0,width,height);noFill();
  stroke(couleur.avance(), 255,255, 250);
  translate(width/2, height/2); 
  float angz = TWO_PI/points.length;
  off+=offset.avance();
  maxi.avance();diff.avance();
  beginShape();
  for(int a=0;a<points.length;a++){
    points[a].dessine(off+a*angz, angz/2+centre.getv());
  }
  endShape(CLOSE);
}

class poin{
  float t=0;
  variateur tModifier = new variateur(1,1, 5);
  poin(){
    points = (poin[]) append(points, this);
  }
  void dessine(float an, float an2){
    tModifier.avance();
    t=t+(maxi.getv()-t)*0.05;
    vertex(cos(an)*t*tModifier.getv(), sin(an)*t*tModifier.getv());
    float t2=t*diff.getv()*tModifier.getv();
    vertex(cos(an+an2)*t2, sin(an+an2)*t2);
  }
}

void mouseReleased(){
 new poin(); 
}

class variateur{ 
  float an,val,v;
  float min, max;
  variateur(float _min, float _max, int n){
    min=_min;max=_max;
    an=random(TWO_PI);
    v=TWO_PI/n;
  }
  float avance(){
    an+=v;
     val = map(cos(an),-1,1,min,max);
     if(random(100)<1){
       v=-v;
     }
     return val;
  }
  float getv(){
    return val;
  }
}

