
void setup(){
  size(300,300);
  background(240,39,39);
}
void draw(){
  ellipse(mouseX,mouseY,50,50);
  mouseX=300-mouseX;
  ellipse(mouseX,mouseY,50,50);
  if (keyPressed && key == 'a'){
    background(240,39,39);
}
}

    

  



