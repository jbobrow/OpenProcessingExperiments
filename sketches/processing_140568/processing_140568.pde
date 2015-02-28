
void setup (){
  
  size (800, 400);
  println ();
  smooth (20);
  background (#1C6743);
  frameRate (30);
  println ();
  
}

void draw () {
   
  println ("eje x:" + mouseX, "eje y:" + mouseY);
  
  if (mousePressed) {
    background (#1C6743);
  }
  
  fill (#CB6927, 100);
  ellipse (mouseX, mouseY, 100, 100);
}
