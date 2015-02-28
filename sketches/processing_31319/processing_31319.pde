
int value = 0;

void setup()
{
 size(500,500);
  background(255);
  smooth();
  
  ellipse(50, 50, 10, 10);
  fill(0);
  text("1", 55, 45);
  noFill();
  ellipse(250, 50, 10, 10);
   fill(0);
  text("2", 255, 45);
  noFill();
  ellipse(350, 100, 10, 10);
   fill(0);
  text("3", 355, 95);
  noFill();
  ellipse(90, 200, 10, 10);
   fill(0);
  text("5",95, 195);
  noFill();
  ellipse(150, 100, 10, 10);
   fill(0);
  text("4", 155, 95);
  noFill();
  ellipse(0, 100, 10, 10);
   fill(0);
  text("7", 5, 95);
  noFill();
  ellipse(50, 100, 10, 10);
   fill(0);
  text("6", 55, 95);
  noFill();
}


void draw()
{ 
  
  
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 10, 10);
  
 }
 
 
 



