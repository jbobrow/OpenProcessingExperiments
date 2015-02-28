
void setup() {
  size(400, 400);
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
  for (float x=0;x<=400;x+=20) {
    line(mouseX, mouseY, x, 0);
  }
}

void vertLines(){
  for(float y=0;y<=400;y+=20){
    line(mouseX,mouseY,0,y);
  }
}

void otherHorLines(){
  for(float x=0;x<=400;x+=20){
    line(mouseX,mouseY,x,400);
  }
}

void otherVertLines(){
  for(float y=0;y<=400;y+=20){
    line(mouseX,mouseY,400,y);
  }
}
    
void colorChange(){
  if(mousePressed){
    stroke(255,0,255);
  }
  else stroke(0);
}




