
void setup(){
  size(500,500);
  frameRate(30);
}

void draw(){
  background(100);
  stroke(255);
  fill(frameCount/2);
  rectMode(CENTER);
  rect(width/2,height/2,mouseX+10,mouseY+10);
}

void keyPressed(){
  println(key);
  println(frameCount);
}
