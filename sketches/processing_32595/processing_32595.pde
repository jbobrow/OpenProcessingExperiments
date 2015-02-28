
int y = 125;
int x = 10;
 
 
int r1 = 70;
int g1 = 0;
int b1 = 70;

int r2 = 8;
int b2 = 4;
int g2 = 200;
 
void setup() {
  size(250,500);
  background(8,30,162);
  
  smooth();
}
 
void draw(){
  while(x<300){
 
  stroke(0, 227,35);
  g2-=10;
   
  
  noFill();
  ellipse(x,y,width,height);
  ellipse(0,400,600,y);
  
  x =+6;
   
  
  ellipse(66,y,width,height);
  
  y += 6;
   
  }
}

