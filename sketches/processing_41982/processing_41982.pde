
PShape dibujo;

void setup (){
  size(240,120);
  smooth();
  shapeMode(CENTER);
  dibujo= loadShape("dibujo.svg");
}

void draw() {
  background(0);
 float diameter= map (mouseX,0,width,10,800);
 shape(dibujo,120,60,diameter,diameter);
}


