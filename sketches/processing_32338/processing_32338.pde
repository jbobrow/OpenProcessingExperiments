
void setup(){
  println("This is setup");
  strokeWeight(30);
  smooth ();
  size(900,900);
}

void draw(){
  //println("I'm drawing");
  //println(frameCount);
  background(0,125,175);
  stroke(125,175,0);
  line(mouseX, mouseY, pmouseX , pmouseY);
}

