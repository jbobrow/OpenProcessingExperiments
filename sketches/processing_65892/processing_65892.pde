
PFont f;
int m=25;//número de Envolventes
int n=62;//número de puntos de la circunferencia
int dx=1;//dirección eje OX
int dy=1;//dirección eje OY
int k;
int tx=853;
int ty=480;
float vx=3.75;//velocidad componente OX
float vy=2;//velocidad componente OY
color a=color(0,0,255,150);

float [] puntoX=new float[n];//Vector de las componentes x de cada punto de la circunferencia
float [] puntoY=new float[n];//Vector de las componentes y de cada punto de la circunferencia
Envolvente[] l= new Envolvente[m];
PGraphics fram;

void setup(){
  size(853,480,JAVA2D);
  smooth();
  background(255);
  frameRate(10);
   noiseSeed(19);
  fram = mkFram(30,30);
  f = createFont("BlairMdITCTT-Medium-16",16,true);
  for(int i=0;i<n;i++){
    float r=min(width,height)/10;
    puntoX[i]=r*cos(2*PI*i/n);
    puntoY[i]=r*sin(2*PI*i/n);
  }
  for(int i=0;i<m;i++){
  l[i]=new Envolvente(i,random(0.25,3),random(0.25,3),1,1);
  }
}

PGraphics mkFram(int w,int b){
  PGraphics tmp = createGraphics(width,height,P2D);

  tmp.beginDraw();
  tmp.strokeWeight(w);
  tmp.noFill();
  tmp.rect(0,0,width,height);
  
  tmp.filter(BLUR,b);
  tmp.endDraw();


  return tmp;
}

void draw(){
  println(frameCount);
  background(255);
  textFont(f);
  fill(0,0,255);
  text("Envolvente para k="+int(frameCount/25+2),width/3+40,25);
  for(int i=0;i<m;i++){
  l[i].dibuja();
  l[i].mueve();
  l[i].cambia();
  l[i].click();
  l[i].colores();
  }

  //tint(255,20);
  //image(g,0,0);

  image(fram,0,0);
}

class Envolvente{
int k,dx,dy;
float x,y,vx,vy;

Envolvente(int _k,float _vx,float _vy,int _dx,int _dy){
k=_k;
x=random(2*min(width,height)/10,width-2*min(width,height)/10);
y=random(2*min(width,height)/10,height-2*min(width,height)/10);
dx=_dx;
dy=_dy;
vx=_vx;
vy=_vy;
}
void dibuja(){
  for(int i=0;i<n;i++){
    pushMatrix();
      translate(x,y);
      rotate(int(frameCount/20));
      stroke(a);
      strokeWeight(1.25);
      line(puntoX[i],puntoY[i],puntoX[(k*(i+1))%n],puntoY[(k*(i+1))%n]);
    popMatrix();
  }
} 
  
void mueve(){  
x=x+vx*dx;
y=y+vy*dy;
if(x<min(width,height)/10||x>width-min(width,height)/10){
dx*=-1;
}
if(y<min(width,height)/10||y>height-min(width,height)/10){
dy*=-1;
}
}

void cambia(){
k=int(frameCount/25+2);
}

void click(){
if(mousePressed){
x=mouseX;
y=mouseY;
}
}
void colores(){
if(keyPressed){
  if(key=='b'){
     a=color(0,0,255,150);
  }
if(key=='g'){
     a=color(0,255,0,100);
  }
if(key=='r'){
     a=color(255,0,0,150);
  }
}
}
}





