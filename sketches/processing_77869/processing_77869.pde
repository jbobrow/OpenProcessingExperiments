
float noiseval;
float xpos;
float angle = 0.0;

float x1=10;
float y1=0;
float x2=30;
float y2=40;
float x3=20;
float y3=30;


void setup(){
  size (800,600);
  
  noiseval = 0;
  xpos = 10;
  
  
  
}



void draw(){
  
  strokeWeight(0);
//strokeWeight(random(0.1,3));



  noiseval += 0.1;
  xpos=xpos+5;
  
  float n=random(-30,30);
   float valorSeno = sin(angle);
  float valorCoseno = cos(angle);
  
   float r =map(valorSeno,-1,1,0,255);  
  float g =map(valorSeno,-1,1,0,122);
  float b =map(valorCoseno,-1,1,0,255);
  
  //  fill(r,g,b,70);
  //stroke(r,g,b);
  
    fill(0,g,b,70);
  stroke(0,g,b,10);
 
 angle += 0.1;

  
 
 triangle(x1+n+xpos,y1+noiseval,x2-n+xpos,y1-noiseval,x3*n+xpos,y3+random(-200,height));
 triangle(x1+n+xpos,y1+600+noiseval,x2-n+xpos,y1+600-noiseval,x3*n+xpos,y3+random(-200,height));
  
}
