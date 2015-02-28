
boolean isDrawing = false;

void setup(){

  size(500,500);
  background(0);
  smooth();
  
};

void draw() {
  
  if (isDrawing) {
  stroke(236,157,250,50);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(220,16,250,50);
  ellipse(mouseX,mouseY, mouseX + random(0,20) , mouseY + random(0,20));
  }
  
  
};

void mousePressed(){
  
  isDrawing=!isDrawing;
  
};

