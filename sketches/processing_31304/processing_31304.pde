
float x;
float y;
float rad=25;
void setup(){
  size(500,500);
  x=width/2;
y=height/2;
}
void draw(){
  background(200);
  fill(255,125,60);
ellipse(x,y,50,50);
if(mousePressed==true){
  if(mouseX>x-rad && mouseX<x+rad && mouseY>y-rad && mouseY<y+rad){
  y=y+15;
  }
}
if(y>496){
  y=0;
}
}
                
                
