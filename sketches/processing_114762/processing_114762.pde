
void setup() { 
  size(600,600);
  background(255);
  noStroke();
    }
  void draw(){
  background(5);
  fill (random(255),random(255),random(255),random(200));
  ellipse (mouseX + random(-200,100), mouseY + random(-200,100),100,100);
   
  }



