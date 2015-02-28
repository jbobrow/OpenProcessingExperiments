
void setup() {  
  size(400, 400);
  background(255);
  println("Move the mouse to draw");
    }
  void draw(){
  fill (random(255),random(255),random(255),random(200));
  rect (mouseX + random(-130,130), mouseY + random(-130,130),130,130);
  
  }
