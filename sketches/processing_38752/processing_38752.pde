
void setup () {
  
  size(480,220);
  smooth();
}

void draw (){
  
  if (mousePressed) {
    fill (30);
  } else{
    fill(130);
  }
  rect(mouseX,mouseY,20,60);
}
  

