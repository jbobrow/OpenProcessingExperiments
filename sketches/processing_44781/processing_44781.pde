
PImage img;
void setup() {
 
  size(330, 500);
  img = loadImage("DSC00021_01.jpg");
  smooth();
  int x=1;
}
 
float v = second();
float y = second();
float w = second();
float b = second();
float c = second();
float d = second();
float e = second();
 
 
 
void draw() {
   image (img, 0,0);
  
  v = v+0.5;
  stroke (255,50);
  strokeWeight (1);
  fill(2,25,255,40);
  ellipse(sin(v)+260, 510-v, 10, 10);
 
  y = y+0.4;
   strokeWeight (1.5);
  fill(25,2,255,40);
  ellipse(sin(y)+252, 530-y, 20, 20);
 
  w = w+0.7;
   strokeWeight (2);
  fill(2,25,255,40);
  ellipse(sin(w)+300,550-w, 50, 50);
 
 
  b = b+0.3;
   strokeWeight (1);
  fill(25,2,255,40);
  ellipse(sin(b)+250,990-b, 24, 24);
 
  c = c+0.2;
  fill(2,25,255,30);
  ellipse(sin(c)+340,505-c, 15, 15);
 
  d = d+0.5;
   strokeWeight (1.5);
  fill(25,2,255,40);
  ellipse(sin(d)+270,1208-d, 50, 50);
 
  e = e+0.6;
  fill(2,25,255,30);
  ellipse(sin(e)+290,1140-e, 66, 66);
  
  
  if(y>640){
    y=0;
  }
  if(v>600){
    v=0;
  }
  if(w>600){
    w=0;
  }
 
  if(b>1000){
    b=0;
  }
 
  if(c>1500){
    c=0;
  }
 
  if(d>600){
    d=0;
  }
}
//http://www.openprocessing.org/visuals/?visualID=8011


