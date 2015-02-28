
cercle[] cercles ;
poin[] points ;int num;float pas;

void setup(){
  smooth();
  size(400,400);strokeWeight(0.8);
  background(0);noStroke();fill(255,0,0);stroke(255);
  demarre();
}

void demarre(){
  num = int(random(19,59));pas = 200.0/num;
    cercles = new cercle[0];points = new poin[0];
  for(int a=1;a<num;a++){
    new cercle(a*pas);
  }
}

void mousePressed(){
  demarre();
}

void draw(){
  background(0);
  for(int a=0;a<cercles.length;a++){
    cercles[a].avance();
  }
}

class cercle{
  int n; float r, v, an, pas;poin[] mespoints=new poin[0];
  cercle(float _r){
    an=random(TWO_PI);
    v = radians(random(-0.8,0.8));
    r=_r;n=int((PI*_r*2)/60)+1;
    pas = TWO_PI/n;
    cercles = (cercle[]) append(cercles, this);
    for(int a=0;a<n;a++){
      mespoints = (poin[]) append(mespoints, new poin(an+a*pas, r, this));
    }
  }
  void avance(){
   //an+=v;
    for(int a=0;a<mespoints.length;a++){
     mespoints[a].avance(v);
    }
  }
}

class poin{
  float an, r;cercle c;float x,y;
  poin(float _an, float _r, cercle _c){
    r=_r;an=_an;c=_c;
  }
  void avance(float _v){
    an+=_v;
    x = 200+cos(an)*r;
    y = 200+sin(an)*r;
    for(int a=0;a<cercles.length;a++){
      cercle ci = cercles[a];
      if(ci!=c){
        if((c.r - ci.r)<16){
          for(int b=0;b<ci.mespoints.length;b++){
            if(getDistance(x,y,ci.mespoints[b].x,ci.mespoints[b].y)<16){
              line(x,y,ci.mespoints[b].x,ci.mespoints[b].y);
            }
          }
        }
      }
    } 
  }
}

float getDistance(float _x1,float _y1,float _x2,float _y2){
  return sqrt(pow((_x1-_x2),2)+pow((_y1-_y2),2));
}

