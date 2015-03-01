
int r;
int a=100;
boolean fireworks=false;
void setup(){
  size(640,480);
  background(0);
}
void draw(){
  background(0);
  if(fireworks){
  drawLine(mouseX,mouseY,r);
  r++;
  }
  else {
    fill(a,a,a,60);
    ellipse(mouseX,mouseY,10,10);
}
}
void mousePressed(){
  fireworks=true;
}
void mouseReleased(){
  fireworks=false;
  r=0;
}
 
void drawLine(float x,float y,int r){
  for(int i=0; i<width-a; i+=10){
    noFill();
    ellipse(x+5,y+5,r,r);
    ellipse(x-5,y-5,r,r);
    ellipse(x,y,r,r);
  }
  for(int i=0; i<width-a; i+=10){
  stroke(random(i),random(x),random(y));
   ellipse(x,y,r,r+10);
   ellipse(x+5,y+5,r,r+10);
   ellipse(x-5,y-5,r,r+5);
 }
}
