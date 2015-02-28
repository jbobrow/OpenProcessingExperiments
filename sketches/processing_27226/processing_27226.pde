
void setup() {
  size(1024, 768);
  smooth();
  background(255);
}

void draw() {  
  noFill();
  stroke(0);
  // stroke(random(255), random(255), random(255));
  if(mousePressed) { //nur malen, wenn die maustatste gedrückt ist
    strokeWeight( dist(mouseX, mouseY, pmouseX, pmouseY)/5 ); //die distanz zwischen der aktuellen und der letzen mausposition
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

