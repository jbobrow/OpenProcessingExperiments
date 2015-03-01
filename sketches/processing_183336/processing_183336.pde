

void setup()
{
  size(400, 400);
  
  background(0);


}

void draw()
{
  
// code that happens every frame
  if (mouseX < width/3) {
      background(#000AFC);
  } else 
  if (mouseX > width/3 && mouseX < 2*width/3 ){
      background(#79C4FF);
  } else {
      background(#FF7231); 
  }
  
}

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

