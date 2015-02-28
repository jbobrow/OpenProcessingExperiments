
float a=0;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  
  
 float x=width/2+cos(a)*200;
  float y=height/2+sin(a)*200;
   float x1=width/2+cos(a)*100;
  float y1=height/2+sin(a)*100;
  float x2=width/2+cos(a)*50;
  float y2=height/2+sin(a)*50;
   ellipse(x,y,10,10);
  ellipse(x,y,10,10);
  ellipse(x1,y1,10,10);
  ellipse(x1,y1,10,10);
  ellipse(x2,y2,10,10);
  ellipse(x2,y2,10,10);
  a=a+0.1;
  
  if(a>TWO_PI){
    noLoop();
  }
}

