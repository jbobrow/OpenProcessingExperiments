
void setup(){
  size(800,500, P3D);
  background(0);
}
void draw(){
  fill(random(10), random(90) , 125, random(90));
  ellipse(random(1000), random(1000), 20, 20);
  fill(125, 125, 125);
  line(random(1000), random(1000),mouseX, mouseY);
  if (mousePressed == true)
  {
  background(random(90), random(20), random(100));
  translate(mouseX, mouseY);
  rotate(random(10));  
  fill(255, random(60), 255);
  box(50);
  }
  
  
}

