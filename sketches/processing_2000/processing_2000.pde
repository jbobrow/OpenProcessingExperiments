
boolean isDrawing=false;

void setup() {
  
  size(500,500);
  background(0);
  smooth();
  
  
  
};


void draw() {
  if(isDrawing) {
  stroke(100,0,100,150);
  rect(pmouseX,pmouseY,mouseX,mouseY);
  stroke(190,190,90,10);
  line(mouseX,mouseY,mouseX+random(0,15), mouseY+random(0,150)); 
  }
};

void mousePressed() {
  isDrawing = !isDrawing;
  
};

