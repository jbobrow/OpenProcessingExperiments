

int y = 0;
int x = 0;
 
 
int r1 = 70;
int g1 = 0;
int b1 = 70;
 
int r2 = 8;
int b2 = 4;
int g2 = 200;
 
void setup() {
  size(500,500);
  background(0);
  frameRate(30);
  smooth();
}
 
void draw(){
  
  while(x<200){
 strokeWeight(60);
  stroke(r2,g2,b2,20);
  g2-=1.09;
   
  //lineas interferencia
  noFill();
  rect(x,y,600,height);
  ellipse(0,460,600,y);
  //incrementa
  x =+3;
   
  //linea horizontal
  ellipse(0,y,width,y);
  
  y += 40;
   
  }
}

