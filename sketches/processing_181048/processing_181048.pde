


void setup()
{
  size(400,400);
  
  background(255);


}

void draw()
{
// code that happens every frame
line(mouseX,mouseY,100,100);
stroke(0,
       map(mouseX,0,400,0,255),
       map(mouseY,0,400,0,255));
strokeWeight(map(pmouseX,0,400,0.25,2));}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}



