
void setup(){
  size (800,800);
  background (0);
  smooth();
}


void draw (){
}   


void mousePressed(){ //cuando se hace clic aparece un rectangulo...
  fill (random (200,255), random (100,120), random (0,255), 100); //... relleno de color aleatorio
  
  rectMode(CENTER);
  stroke(255,255,255,150);
  strokeWeight(20);
  rect (mouseX, mouseY, 300, 100);
  
}
