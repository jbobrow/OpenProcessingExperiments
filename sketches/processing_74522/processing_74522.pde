
int d=60;
float x=d;
float y=d;
float dirX=random(10);
float dirY=random(10);
int si1=0;
int si2=0;
int si3=0;
int si4=0;

void setup() {
  size(400, 400);
  background(200);
  smooth();
}
void draw() {
  background(200);
  strokeWeight(4);
  stroke(255,50,0,80);
  fill(0,150,255,95);
  ellipse(x, y, d, d);
  x=x+dirX;
  y=y+dirY;

  //right border
  if (x>width-d/2) {
    dirX=-dirX;
  }
  //left
  if (x<d/2) {
    dirX=-dirX;
  }
  //up border
  if (y<d/2) {
    dirY=-dirY;
  }
  //bottom border
  if (y>height-d/2) {
    dirY=-dirY;
  }

  if (mousePressed) {
    //ellipse(mouseX, mouseY, d, d);
    x=mouseX;
    y=mouseY;
  }
  
  //primo quadrato
  noStroke();
  fill(255,150,0,95);
  if(x<d && y<d){
    si1=1;
  }
  if(si1==0){
    rect(d/2,d/2,d/2,d/2);
  }else{
    rect(x-d/2,y-d/2,d/2,d/2);
  }
  
  //secondo quadrato
  fill(255,0,100,95);
  if(x>width-d && y<d){
    si2=1;
  }
  if(si2==0){
    rect(width-d,d/2,d/2,d/2);
  }else{
    rect(x,y-d/2,d/2,d/2);
  }
  //terzo quadrato
  fill(0,155,255,95);
  if(x<d && y>height-d){
    si3=1;
  }
  if(si3==0){
    rect(d/2,height-d,d/2,d/2);
  }else{
    rect(x-d/2,y,d/2,d/2);
  }
  //quarto quadrato
  fill(0,255,100,95);
  if(x>width-d && y>height-d){
    si4=1;
  }
  if(si4==0){
    rect(width-d,height-d,d/2,d/2);
  }else{
    rect(x,y,d/2,d/2);
  }
  
  
  
}
void mouseReleased() {
  dirX=mouseX-pmouseX;
  dirY=mouseY-pmouseY;
}
