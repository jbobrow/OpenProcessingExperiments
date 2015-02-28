

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  strokeWeight(mouseY/4);
  
  //module A
  line (0,800,300,mouseY);
  line (800,800,500,mouseY);
  line (0,600,300,mouseY-200);
  line (800,600,500,mouseY-200);
  line (0,400,300,mouseY-400);
  line (800,400,500,mouseY-400);
  line (0,200,300,mouseY-600);
  line (800,200,500,mouseY-600);

 // line (mouseX+20,0,mouseX+20,800);
  //line (mouseX-20,0,mouseX-20,800);
}

