
//bouncing ball
//by Marion Desmonnet

float balleY=25;
float balleX=25;
int ecartY=4;
int ecartX=3;

void setup() {
 background(0);
 noStroke();
 size(400,400);
 smooth();
}
 
void draw() {
  
  fill(0, 20);
  rect(0, 0, 400, 400);
  
  fill(balleX,0,balleY);
  ellipse(balleX,balleY,50,50);
  balleY=balleY+ecartY;
  balleX=balleX+ecartX;
  
  if((balleY>375)||(balleY<25)){
    ecartY=-ecartY;
  }
  
  if((balleX>375)||(balleX<25)){
    ecartX=-ecartX;
  }
}



