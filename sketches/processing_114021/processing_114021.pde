
void setup() { 
  size(400, 400);
  background(255);
  println("Press and release the mouse to change the colours");
    }
  void draw(){
  if (mousePressed == true)
  fill (random(255),random(255),random(255),random(200));
  rect (mouseX + random(-70,70), mouseY + random(-70,70),70,70);
  }
