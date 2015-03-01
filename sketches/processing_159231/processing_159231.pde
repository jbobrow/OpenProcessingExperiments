
float bx;
float by;
int boxSize = 99;
boolean overBox = false;
boolean locked = false;
 
void draw()
{
  background(0);

  if (mouseX > bx-boxSize && mouseX < bx+boxSize &&
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;
    if(!locked) {
    
      fill(255);
    }
  } else {
        fill(153);
    overBox = false;
  }
 
    rect(bx, by, boxSize, boxSize);
}

