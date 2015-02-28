
void setup (){
  size (400,400);
  background (255);
}

void draw (){
  if (mousePressed){
    //stroke(r,g,b,alpha)
    stroke(119,8,102,25);
    strokeWeight(7);
    ellipse(mouseX,mouseY,30,30);
  }
}


