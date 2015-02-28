
//MAIN SETUP
void setup(){
  size(400,400);
  smooth();
  noCursor();
  frameRate(120);
}

//ZEICHNEN
void draw (){
  stroke(0,mouseX/20);
  line(0,200,mouseX,mouseY);

  stroke(0,(mouseY+mouseX)/80);
  line(400,400,mouseX,mouseY);

  stroke(255,(mouseY+mouseX)/50);
  line(200,200,mouseX,mouseY);
}
