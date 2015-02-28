
void setup () {
  size (500, 500);
  /*this function creates a difference of colour 
  depending on the position on the mouse!!*/
}

void draw () {
   float redVal = map(mouseX,0,width,0,255); 
   float greenVal = map(mouseY,0,width,0,255);
   background(redVal,greenVal,0);
}

void mousePressed () {
   float redVal = map(mouseX,0,width,0,255); 
   println(" MouseX: " + mouseX + " redVal " + redVal);
}

