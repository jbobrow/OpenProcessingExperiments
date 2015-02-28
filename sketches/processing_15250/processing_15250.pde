

// Basic Drawing Test - Jonathan Zalben - www.jonathanzalben.com

void setup(){
  size(480,800);
  background(200);

}

void draw(){
  smooth();
  strokeWeight(random(20));
  stroke(random(100),random(100),random(100));
  point(mouseX,mouseY); 
}

