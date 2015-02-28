
int y = 0;
int x = 0;
 
 
int r1 = 70;
int g1 = 0;
int b1 = 70;
 
int r2 = 8;
int b2 = 4;
int g2 = 200;
 
void setup() {
  size(250,500);
  background(0);
  smooth();
}
 
void draw(){
  while(x<300){
 
  stroke(0, 255, 255);
  g2-=1.09;
   
 
  noFill();
  ellipse(x,y,600,height);
  ellipse(200,400,600,y);
  
  x =+3;
   
  
  ellipse(66,y,width,y);
  
  y += 3;
   
  }
}

