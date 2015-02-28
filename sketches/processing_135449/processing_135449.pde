

void setup() {
  size(600, 600);
  
  
}
void draw() {
  float vt = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la distancia entre la posiciÃ³n actual y la //anterior del cursor
  strokeWeight(5/vt);
  //stroke(0,100);
 fill(220,180,20);
   // traza una línea continua
  ellipse (mouseX,mouseY,vt,vt);
  ellipse (mouseX,mouseY,vt/5,vt/5);
  ellipse (mouseX,mouseY,vt/10,vt/10);
  ellipse (mouseX,mouseY,vt/20,vt/20);
  ellipse (mouseX -vt,mouseY -vt,vt/5 , vt/5);
 ellipse (mouseX-(vt*2),mouseY -(vt*2),vt/5 , vt/5);
 
}
