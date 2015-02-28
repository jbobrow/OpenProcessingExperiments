

float numberA = 100;
float numberB = 100;
int xold;
int yold;
 
void setup() {
  size(700,400);
  background(180,95,110);
  
  smooth();
  fill(255);
  stroke(255);


  fill(255,0,0,20);
  strokeWeight(2);
  stroke(255);
  rect(1,1,width-2,height-2);
  fill(255);
  strokeWeight(3);
  text("Click, hold and drag",width-200,height-5);
}
void draw(){
  if(mousePressed){
    numberA = 50 - dist(xold,yold,mouseX,mouseY);
    numberB = 50 - dist(xold,yold,mouseX,mouseY);
  stroke(0);
  ellipse(mouseX,mouseY,numberA,numberB);
  xold = mouseX;
  yold = mouseY;
  }
   
  noFill();
  strokeWeight(2);
  stroke(255);
  rect(1,1,width-2,height-2);
  fill(255);
  strokeWeight(1);
}
 



