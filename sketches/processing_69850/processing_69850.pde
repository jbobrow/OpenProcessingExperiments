
void setup(){
  size(400,400);
  background(255,255,255);
}

void draw(){

  smooth();
  
  ellipse(200,200,(mouseX-mouseY)/2,(mouseX-mouseY)/2);

  strokeWeight(10);
  stroke(mouseY+mouseX,255-mouseY,255-mouseX,200);
  line(mouseX,mouseY,-10*mouseX,10*mouseY);
  line(mouseX,mouseY,-10*mouseX,-10*mouseY);

  line(mouseY,mouseX,-10*mouseY,-10*mouseX);
  line(mouseY,mouseX,10*mouseY,-10*mouseX);
  
  line(mouseX/-10,mouseY/-10,mouseX,mouseY);
  line(mouseY/-10,mouseX/-10,mouseY,mouseX);

  strokeWeight(10);
  stroke(255-(mouseY+mouseX),mouseY,mouseX,200);
  line(mouseX,mouseY,10*mouseX,10*mouseY);
  line(mouseX,mouseY,10*mouseX,-10*mouseY);

  line(mouseY,mouseX,10*mouseY,10*mouseX);
  line(mouseY,mouseX,-10*mouseY,10*mouseX);
  
  line(mouseX/-10,mouseY/10,mouseX,mouseY);
  line(mouseY/10,mouseX/-10,mouseY,mouseX);
}
