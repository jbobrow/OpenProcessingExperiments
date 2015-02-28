
void setup() {
  size(500,500);
  background(150);
  smooth  ();
  mouseX=-300;
  mouseY=-300;
}
 
void draw() {
//dibuixem rectangles al fons per fer efecte desaparicio linea
  fill(255,50);
  noStroke();
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
   
//dibuixem lineas
  stroke(mouseX/2,mouseY/2,50);
  strokeWeight (5);
  line (mouseX,mouseY,mouseY,height/2);
 
 
}



