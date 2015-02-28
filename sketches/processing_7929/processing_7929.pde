
float nombredor = (1+sqrt(5))/2;
float angledor = TWO_PI/(1+nombredor);  
float generalAngle=0;
poin[] points;

void setup(){
  points=new poin[0];
  size(500,500 );
  smooth();
  noStroke();
  background(0); 
  float x=width/2;
  float y=height/2; 
  float c=5;
  float coulr =   250.0/2300;
  for(int a=1;a<2300;a++){
    float r=c*sqrt(a); 
    x+=cos(angledor*a)*r;
    y+=sin(angledor*a)*r; 
    float di = dist(x,y,width/2,height/2);
    if(di<200){
      float cl =  (250- a*coulr)+5;
      new poin(x,y,a, r,cl);
    }
  } 
  for(int a=0;a<points.length;a++){
    points[a].trouveToiDesCopains();
  }
} 

void draw(){ 
  generalAngle-=0.03;
  background(0); 
  for(int a=0;a<points.length;a++){
    points[a].dessine();
  }
  points[floor(random(points.length))].go(3, col());
}

class poin{
  float x,y,an,num,ray;
  poin[] copains;
  float vx,vy;
  float encours=0;
  color coul=color(255);
  float basecoul ;
  float gris;
  poin(float _x, float _y, float _n, float _r, float c){
    num=_n;ray=_r*1.5;
    basecoul=gris=c;
    x=_x;
    y=_y;
    an= random(TWO_PI);
    vx=cos(an)*0.1;
    vy=sin(an)*0.1;
    points = (poin[]) append(points, this);
    copains = new poin[0]; 
  }
  void dessine(){  
    fill(gris);
    gris=approche(gris,basecoul); 
    ellipse(x,y,8,8);
    if(encours>1 ){ 
      encours*=0.93;
      for(int a=0;a<copains.length;a++){  
        copains[a].go(encours, gris);
      }
    }
    
    x=width/2+cos(generalAngle+angledor*num)*ray;
    y=height/2+sin(generalAngle+angledor*num)*ray;  
  }
  void trouveToiDesCopains(){
    for(int a=0;a<points.length;a++){
      poin p= points[a] ;
      if(p != this && dist(x,y,p.x,p.y)<18){
        copains = (poin[]) append(copains, p);
      }
    }

  }
  void go(float n, float cc){
    if(n>0){
      gris=cc;
      encours=n; 
    }
  }
}

float col(){

  return random(255);
}

float approche(float v, float fin){

  return  v+(fin-v)*0.07;
}




