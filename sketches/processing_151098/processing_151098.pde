
void setup(){
size(600,400);
}
void draw(){
background(255);
fill(0,0,255);
if(mouseX<49){
  fill(255,0,0);
  }
if(mouseX>width-50){
fill(255,0,0);
}
rect(mouseX,mouseY,30,30);
}
  
