
void setup()
{
size (200,200);  
}
void draw()
{
  rectMode(CENTER);  
  background(255);
  fill(124, 243, 255);
  rect(mouseX,mouseY,50,50);
  fill(115, 255, 106);
  ellipse(mouseX,mouseY,40,40);
  fill(255, 244, 118);
  rect(mouseX,mouseY,10,10);   
}

// I do not understand how to create functions however I tried
// to create a code that would produce the shapes and move with
// the mouse co-ordinates
