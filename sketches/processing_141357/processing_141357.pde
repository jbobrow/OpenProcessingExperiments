
void setup() {
  size(1200, 1000);
}
 
void draw() {
  background(255);
  horLines();
  vertLines();
  otherHorLines();
  otherVertLines();
  colorChange();
}
 
void horLines(){
  for (float x=0;x<=1200;x) {
    line(mouseX, mouseY, x, 0);
  }
}
 
void vertLines(){
  for(float y=0;y<=1000;y){
    line(mouseX,mouseY,0,y);
  }
}
 
void otherHorLines(){
  for(float x=0;x<=1200;x){
    line(mouseX,mouseY,x,1000);
  }
}
 
void otherVertLines(){
  for(float y=0;y<=1000;y){
    line(mouseX,mouseY,1200,y);
  }
}
     
void colorChange(){
  if(mousePressed){
    stroke(120,0,120);
  }
  else stroke(0);
}



