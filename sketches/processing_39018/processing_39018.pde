
void setup(){
  background(255);
  frameRate(150);
  size(800,600);
  smooth();
}
void draw(){
  
  if (mousePressed)
  {
      background(255);
      }
  else
  {
  println(frameRate);
  fill(mouseX,mouseX-mouseY,mouseY);
  ellipse(400,300,mouseX,mouseY);
  }
}
                                                                    
