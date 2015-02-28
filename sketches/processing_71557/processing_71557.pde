
// Hi Playgramming this is from the references! Enjoy!

//This will save a bunch of screenshots in your sketch's directory

int x = 0;
void draw()
{
  background(204);
  if(x < 100) {
    line(x, 0, x, 100);
    x = x + 1;
  } else {
    noLoop();
  }
  // Saves each frame as line-0000.tif, line-0001.tif, etc.
  saveFrame("line-####.tif"); 
}

