
void setup(){
  size(1000,1000);
}

void draw(){
  strokeWeight(4);
  ellipse(350,400,150,75);
  ellipse(650,400,150,75);
  ellipse(400,400,75,75);
  ellipse(700,400,75,75);
  ellipse(500,500,700,800);
  fill(0,0,0);
  rect(mouseX,mouseY, 75,75);
  fill(255,100,mouseX,80);
  rect(mouseX,mouseY,200,mouseY);
}



