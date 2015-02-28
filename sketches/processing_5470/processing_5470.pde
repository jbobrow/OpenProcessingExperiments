
arq[] arcs;
float ray;int maxi;color nextColor,currentColor;

void setup(){
  size(500,500); maxi=(int)sqrt(250*250+250*250)*2;
  background(255);
  arcs= new arq[10];
  ray = 0;
  for(int a=0;a<10;a++){
    getNextColor();
    arcs[a]=new arq(250,250,50+a*45);
  }
  arcs=(arq[]) reverse(arcs);
  noFill();
  strokeWeight(20); 
  smooth(); 
  strokeCap(SQUARE);
}

void draw(){
  ray+=0.9; 
  if(ray>45){
    ray=0;
    for(int a=0;a<arcs.length;a++){
      arcs[a].r+=45;
    }
    getNextColor();
     arcs = (arq[]) append (arcs, new arq(250,250,50));
      if(arcs[0].r>maxi){
       arcs = (arq[]) subset (arcs, 1);
      }
  }
  background(0);
  for(int a=0;a<arcs.length;a++){
    arcs[a].dessine();
  }
  stroke(getCouleurEnCours());
  ellipse(250,250,45,45);
}

class arq{
  int x,y;
  mouvement m;
  float r,a,l,v;
  color col=nextColor;
  arq(int _x, int _y, int _r){
    col=nextColor;
    m = new mouvement();
    x=_x;
    y=_y;
    r=_r;
    a=random(TWO_PI);
    l=random(0.3,0.7);
    v=random(-0.04,0.04);
  }
  void dessine(){
    stroke(col);
    arc(x, y, r+ray, r+ray, a, a+l*PI); 
    arc(x, y, r+ray, r+ray, a+PI, a+PI+l*PI);
    l=l+(1-l)*0.002;
    a+=m.bouge();
  }
}

class mouvement{
  float n,v,v2;
  mouvement(){
    n=0;v=PI/100;v2=random(0.01,0.08);
  } 
  float bouge(){
    n+=v;v*=1.003;
    if(random(100)<1){
      v=-v;
    }
    return cos(n)*v2;
  }
}

void getNextColor(){
  currentColor = nextColor;
  nextColor =color(random(180,255),random(100,255),random(255)); 
}

color getCouleurEnCours(){
 float d=45-ray;   
 
  
 float b=(blue(currentColor)/45)*d+(blue(nextColor)/45)*ray;  
 float r=(red(currentColor)/45)*d+(red(nextColor)/45)*ray; 
 float g=(green(currentColor)/45)*d+(green(nextColor)/45 )*ray; 
 return color(r,g,b);
}

