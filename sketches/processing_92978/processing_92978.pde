
int xPos=6;
int yPos=1;

float angle=0;

void setup () {
  frameRate(9001);
  size(600, 600);
  smooth();
  
}
 void draw(){

 translate(mouseX,mouseY);
 for(int yPos = 0; yPos <400; yPos += 100){
for(int xPos = 0; xPos < 400; xPos += 50){
  pushMatrix();
  rotate(angle+=.1);
  stroke(255,255,255);
  fill(255,0,0);
  rect(xPos,yPos,100,50);
 fill(255,100,255);
 stroke(0);
  rect(xPos,yPos,50,50);
  stroke(0);
  popMatrix();
}
 }
 if(mousePressed){
   rotate(angle-=1);
 }
 if(keyPressed){
   pushMatrix();
  rotate(angle+=.1);
  stroke(255,255,255);
  fill(155,155,255);
  rect(xPos,yPos,100,50);
 fill(100,255,100);
 stroke(0);
  rect(xPos,yPos,50,50);
  stroke(0);
  popMatrix();
 }
 }
