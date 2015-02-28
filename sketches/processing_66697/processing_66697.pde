
void setup(){
  background(121,165,65);
  size(500,500);
  smooth();
}
void draw(){
  if (mousePressed){
    fill(65,134,165);
  }else{
    fill(136,65,165);
  }
  rect(mouseX,mouseY,100,100);

draw2(100);
}


void draw2(int yPos){
ellipse(100,100,yPos,100);
}

