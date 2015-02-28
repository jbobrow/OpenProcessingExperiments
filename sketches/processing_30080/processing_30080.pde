
float x []= new float[1150];
float y []= new float[1150];
float vx[]= new float[1150];
float vy[]= new float[1150];

int nBol;
float diam;
void setup(){
  size(800,800);
  //da os valores iniciais para as variaveis
 
 nBol= 1150;
 
  for(int i = 0; i<nBol; i++){
 
    x[i]=width/2;
    y[i]=height/2;
    vx[i]=random(-2,5);
    vy[i]=random(-2,5);
  } 
 diam=100; 
}

void draw(){
  background(150);
 

 for(int i=0; i<nBol;i++){
   figura(x[i],y[i],150);
   x[i]= x[i]+vx[i];
   y[i]=y[i]+vy[i]; 
  
  
  if(x[i]<0){
    vx[i]=-vx[i];
 }
 
 
 if(x[i]>width){
   vx[i]=-vx[i];
 }
 
   
  if(y[i]<0){
    vy[i]=-vy[i];
 }
 
   
  if(y[i]>height){
    vy[i]=-vy[i];
 }
 }
}


void figura(float xe, float ye,float d){
  fill(100,random(13),110);
  
  if(dist(mouseX, mouseY,xe,ye)<d/1){
    fill(0);  
  }
  
 // fill(random(124),25,0);
  //triangle(random(0,1950),random(600),600,500,300,500);

 // fill(random(227),0,0);
 //triangle(random(1950),random(800),600,500,300,500);

  

  fill(22,142,245);
  ellipse(xe,ye,10,10);
}


