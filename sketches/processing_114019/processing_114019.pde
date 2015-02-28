
void setup() {  
  size(400, 400);
  background(255);
  noStroke();
    }
  void draw(){
  fill (random(255),random(255),random(255),random(200));
  rect (mouseX + random(-130,130), mouseY + random(-130,130),130,130);
  
  }
