
poin[] points = new poin[0];

void setup(){
size(400,400, P2D);
int pas = 20;
int n=width/pas;
smooth();
background(255);fill(0);
for(int a=0;a<n;a++){
  for(int b=0;b<n;b++){
    new poin(pas*0.5+a*pas , pas*0.5+b*pas ); 
  }
}
stroke(0);strokeWeight(0.2);
for (int a=0;a<points.length;a++){
  points[a].creeTraits();
} 
}

void draw(){
  background(255); 
for (int a=0;a<points.length;a++){ 
   points[a].dessinePoints();
}
}

class poin{
  poin[] mesPoints = new poin[0];
  float x,y,bx,by, an,r,v;
  poin(float _x, float _y){
    an=random(TWO_PI);
    v=radians(random(-6,6));
    r=3.5;
    x=(bx=_x)+cos(an)*r;y=(by=_y)+sin(an)*r; 
    points = (poin[]) append(points, this);
  }
  void creeTraits(){
    for(int a=0;a<points.length;a++){
      poin p = points[a];
      if(p!=this){
        float d=getDistance(x,y,p.x,p.y);
        if(d<23){ 
          mesPoints = (poin[]) append(mesPoints, p);
        }
      }
    }
  }
  void dessinePoints(){
    an+=v;
    x=bx+cos(an)*r;
    y=by+sin(an)*r;
    for(int a=0;a<mesPoints.length;a++){
       line(mesPoints[a].x,mesPoints[a].y,x,y);
    } 
    ellipse(x,y,4,4);
  }
}

float getDistance(float _x1,float _y1,float _x2,float _y2){
  return sqrt(pow((_x1-_x2),2)+pow((_y1-_y2),2));
}

