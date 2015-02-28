
poin[] points = new poin[0];

void setup(){
  size(400,400); background(255);
  stroke(0);
  for(int a=0;a<40;a++){
    for(int b=0;b<40;b++){
      if(getDistance(width/2,height/2,a*10+5, b*10+5)<195){
        new poin(a*10+5, b*10+5);
      }
    }
  }
  for(int a=0;a<points.length;a++){
    points[a].checkProx();
  }
}

void draw(){ 
  background(255);
  for(int a=0;a<points.length;a++){
    points[a].avance(); 
  }
  for(int a=0;a<points.length;a++){ 
    points[a].dessine();
  }
  for(int a=0;a<points.length;a++){ 
    points[a].checkLiens();
  } 
}

class poin{
  int balle=0; float liens;
  poin[] proxi = new poin[0];
  float x, y, bx, by, an, v,r;
  poin(float _x, float _y){
    r = random(1.5,3.5);
    an = random(TWO_PI);v=radians(random(-7,7));
    bx=_x;  by=_y; avance();
    points = (poin[]) append(points, this); 
  }
  void checkProx(){
    for(int a=0;a<points.length;a++){
      poin p = points[a];
      if (p!=this){
        if(getDistance(p.bx, p.by,bx,by)<20){
          if(!p.checkIfPresent(this)){
           proxi = (poin[]) append(proxi, p); 
          }
        }
      }
    }
  }
  boolean checkIfPresent(poin qui){
    for(int a=0;a<proxi.length;a++){
      if(proxi[a]==qui){
        return true;
      }
    }
    return false;
  }
  void avance(){
    an+=v;x=bx+cos(an)*r;y=by+sin(an)*r;
  }
  void dessine(){
    liens = 0;
    for(int a=0;a<proxi.length;a++){
      float d=getDistance(proxi[a].x, proxi[a].y,x,y);
      if(d<14){
        liens+=d;
        stroke((d-4)*22);  
        line(proxi[a].x, proxi[a].y,x,y);
        ellipse((x+proxi[a].x)/2, (y+proxi[a].y)/2, 2, 2);
      } 
    } 
  }
  void checkLiens(){
    if(liens>20){
      noStroke();fill(0);
      ellipse(x,y,2,2);
    }
  }
}

float getDistance(float _x1,float _y1,float _x2,float _y2){
  return sqrt(pow((_x1-_x2),2)+pow((_y1-_y2),2));
}

