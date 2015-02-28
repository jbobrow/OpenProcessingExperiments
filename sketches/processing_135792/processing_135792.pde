
void setup()
{
  size(400,400);
  smooth();
}
void draw(){
  background(240,248,255);
noStroke();
  stroke(0);
  noFill();
  ellipse(mouseX,mouseY,200,200);
  strokeWeight(3);
  noStroke();
  fill(147,112,219,70);
  rect(400-mouseX,mouseY*2,175,175);
  strokeWeight(3);
  stroke(221,160,221);
  line(50,mouseX,350,mouseY);
}

