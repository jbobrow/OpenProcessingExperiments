

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
 
  stroke(16,255,13);
  g2-=1.09;
   
  
  noFill();
  rect(x,y,600,height);
  ellipse(0,400,600,y);
  
  x =+3;
   
  
  ellipse(0,y,width,y);
  
  y += 40;
   
  }
}

