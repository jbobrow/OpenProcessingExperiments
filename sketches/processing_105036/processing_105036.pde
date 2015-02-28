
void setup() {
  size(700, 700);
}

void draw() {

  background(255);
  fill(255,0,0);
  
  fill (100,0,0); 
  fill (100+mouseX, 20+mouseY,250);
  fill (mouseX,mouseY, 0);
  rect(0,0, 350,350);
  fill (0,mouseX,mouseY);
  rect (350, 350, 350,350);
  ellipse (350,350, 450, 450);
  fill (70,mouseY,mouseX);
  ellipse (350,350, 400,400);
  fill (mouseX,200,mouseY);
  ellipse (350,350, 350,350);
  fill(mouseY,mouseX,10);
  ellipse (350,350, 300,300);
  fill (0, mouseY, mouseX);
  ellipse(350,350,250,250);
  fill (mouseX,255,mouseY);
  ellipse ( 350, 350, 200, 200);
  fill (255, mouseX, mouseY);
  ellipse ( 350, 350, 150, 150);
  fill ( mouseY, mouseX, 0); //
  ellipse(350, 350, 100, 100);
  
  ellipse(mouseX, mouseY, 25, 25);
  
}
