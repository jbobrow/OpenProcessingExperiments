
int horizontalx;
int verticaly;
int mano;
float angulo=0.0;

void setup(){
  size(500,500);
  
  horizontalx=0;
  verticaly=0;
  mano=0;
}

void draw(){
  smooth();
 background(255);
  noStroke();
  //yoshi
  rotate(angulo);
  
  
  if(mano==0){
    verticaly=verticaly+5;
  }
  if(verticaly==400){
   mano=1; 
  }
  if(mano==1){
    verticaly=verticaly-4;
  }
  if(verticaly==0){
    mano=0;
  }
  
  //boca
  stroke(200);
  fill(255);
  ellipse(horizontalx+250,verticaly+140,50,55);
  noStroke();
  fill(255,100,100);
  ellipse(horizontalx+250,verticaly+140,40,40);
  noStroke();
  
  fill(100,255,50);
  ellipse(horizontalx+237,verticaly+40,35,60);
  ellipse(horizontalx+263,verticaly+40,35,60);
  fill(255);
  
  ellipse(horizontalx+237,verticaly+40,30,50);
  ellipse(horizontalx+263,verticaly+40,30,50);
  fill(100,255,50);
  ellipse(horizontalx+250,verticaly+100,100,100);
  //ojos,nariz
  fill(0);
  
  ellipse(horizontalx+237,verticaly+40,10,15);
  angulo=angulo+0.1;
  ellipse(horizontalx+263,verticaly+40,10,15);
  ellipse(horizontalx+240,verticaly+75,5,7);
  ellipse(horizontalx+260,verticaly+75,5,7);
angulo=angulo+.001;
}

