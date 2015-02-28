
/*
By Ellen Wang
Homework #6

tail code based on code taken from processing.org which was based on code from Keith Peters (www.bit-101.com). 
press any key to move creature to the right and mouse click to move it up
eat the red square to grow

*/
float[] xx = new float[20];
float[] yy = new float[20];
float segLength = 1;

float vy = 0;
float vx = 2;
float x = 10;
float y = 200;
float frictiony = -.6;
float frictionx =  .998;
float gravity = .04;
float mode,value,q,w,sa,s;

void setup(){
  size(800,600);
  smooth();
  strokeWeight(1.5);
  stroke(255,0,0);
  sa=20;
  q=400;
  w=300;
  s=10;
}

void draw(){
  background(0);
  
   dragSegment(0, x, y);
  for(int i=0; i<xx.length-1; i++) {
    dragSegment(i+1, xx[i], yy[i]);
  }
  
  vy+= gravity; //vy = vy+gravity
  vx*= frictionx; //vx = vx*frictionx
  x += vx;
  y += vy;
  if(y>595){
    y = 595;
    vy *= frictiony;
  }
  if(y<5){
    y = 5;
    vy*= frictiony;
  }
  if(x>795){
    x = 795;
    vx *=-frictionx;
  }
  if(x<5){
    x = 5;
    vx *=frictiony;
  }
  if (keyPressed == true) {
    vx+=.5;
  }
  
  ellipse(x,y,s,s);
  fill(255,0,0);
  rect(q,w,sa,sa);
  
  if(x>q && x<q+sa && y>w && y<w+sa){
    q=random(5,790);
    w=random(5,580);
    sa=random(15,30);
    s+=2;
    segLength+= .4;
    
  }
  
  
}

 
  
  void dragSegment(int i, float xin, float yin) {
  float dx = xin - xx[i];
  float dy = yin - yy[i];
  float angle = atan2(dy, dx);  
  xx[i] = xin - cos(angle) * segLength;
  yy[i] = yin - sin(angle) * segLength;
  segment(xx[i], yy[i], angle);
}

void segment(float xx, float yy, float a) {
  pushMatrix();
  translate(xx, yy);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}



void mousePressed(){
  vy-= 2;
}
  
  
  



