
void setup() {
  size(200,200);
  smooth();
  frameRate(10);
}

void draw() {
  background(mouseX,0,mouseY);
  
  rectMode(CORNER);
  fill(255,150,0);
  rect(50,50,100,100);
  
  stroke(255);
  line(80,50,50,30);
  line(120,50,150,30);

  ellipseMode(CENTER);
  stroke(255);
  fill(150);
  ellipse(80,80,20,20);
  ellipse(120,80,20,20);
  ellipse(100,100,5,10);
  
  stroke(0);
  if(mouseX > 50 && mouseY > 50 && mouseX < 150 && mouseY < 150);{
    fill(255);
  } 

  rect(mouseX,mouseY,30,15);
  
  fill(0);
  line(mouseX,mouseY+7.5,mouseX+30,mouseY+7.5);
}
  


