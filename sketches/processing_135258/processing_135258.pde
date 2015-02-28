
void setup() {
  size(600, 600);
  background(75,52,47);
}
void draw() {
  float vt = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la distancia entre la posiciÃ³n actual y la //anterior del cursor
  strokeWeight(vt/600);
  //stroke(0,150);
  line(mouseX,mouseY,pmouseX,pmouseY); // traza una línea continua
  println(mouseX<750);
  if(mouseX>75&mouseY>60){
    fill(173,145,167);
    random(255,270);
   stroke(106,104,52); 
    strokeWeight(vt/200);
  ellipse(mouseX,mouseY,11,vt);
  ellipse(mouseX,mouseY,40,vt);
  }
  }
