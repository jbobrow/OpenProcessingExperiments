
void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  strokeWeight(mouseX/4);
  line (0,200,400,200);
  line (0,400,400,400);
  line (0,600,400,600);
  
  //module A
 // line (0,400,400,400);
  // strokeWeight(mouseY/4);
  //line (400,400,800,400);}

 
 strokeWeight(mouseY/4);
 line (400,200,800,200);
 line (400,400,800,400);
 line (400,600,800,600);
 }

