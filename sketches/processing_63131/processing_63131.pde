
//mouseX mouseY

void setup(){
size(500,500);
smooth();
}

void draw() {
  background(255);
  println( mouseX + ", "+mouseY);
  
  fill(0);
  //ellipse(mouseX,mouseY, 30,30);
  for(int i=0; i<width; i+=10) {
    
   // line(i, 0, mouseX, mouseY);
    line(i, 0, 600, 714);
}
}

