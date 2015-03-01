
float mida=44;
float petals=25;

void setup() {
  size (255, 255);
}

void draw () { 
  background (0, 0, 255); 
  stroke(0, 0, 0);
  
  //linia vertical
  rect(mouseX, mouseY, 1, -mouseY);

  //cercle mes gran
  stroke(0);
  strokeWeight(4);
  fill(100,20,mouseX);
  ellipse(mouseX, mouseY, mida*3, mida*3);

  //cercle central
  stroke(0);
  fill(255, 255, mouseX);
  ellipse(mouseX, mouseY, mouseY*0.5, mouseY*0.5);

  //X
  line(mouseX+mida, mouseY+mida, mouseX-mida, mouseY-mida);
  line(mouseX-mida, mouseY+mida, mouseX+mida, mouseY-mida);

  //cercles petits
  fill(255, 0, mouseX);
  ellipse(mouseX-petals, mouseY, mouseY*0.15, mouseY*0.15);
  ellipse(mouseX+petals, mouseY, mouseY*0.15, mouseY*0.15);
  ellipse(mouseX, mouseY-petals, mouseY*0.15, mouseY*0.15);
  ellipse(mouseX, mouseY+petals, mouseY*0.15, mouseY*0.15);
}
