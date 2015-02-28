
//Created by Tomas de Camino
//Oscilating color example
void setup(){
 size(600,600);
 smooth();
 noCursor();
 ellipseMode(CENTER);
}

void draw(){
  background(255);
  fill(255*sin(frameCount/8));
  noStroke();
  ellipse(mouseX, mouseY, 60,60);
}
