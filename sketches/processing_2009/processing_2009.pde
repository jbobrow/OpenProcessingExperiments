

boolean isDrawing = false;
void setup(){
  
 size(500,500);
 background(0); 
 smooth();
 stroke(255,100,0,40);
 fill(160,25,225,25); 
  
};


void draw(){
  if (isDrawing) {
  stroke(255,255,5,150);
  rect(mouseX,mouseY,20,20);
  stroke(55,0,0,155);
  ellipse(mouseX,mouseY,20,20);
  }
  
};

void mousePressed() {
  isDrawing = !isDrawing;
};

