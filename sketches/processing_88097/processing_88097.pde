
size(500, 500);
background (200);
fill (0);
for (int x = 20; x< width-20; x+=15)
{
  for (int y = 20; y<height-20; y+=10)

    if (x<=width/2 && y<=height/2) {

      triangle(x, y, x-2, y+2, x-5, y-5);
    }
    else if (x<=width && y<=height/2) {
      triangle(x, y, x+2, y+2, x+5, y-5);
    }
    else if (x<=width/2 && y<=height) {
      triangle(x, y, x-2, y-2, x-5, y+5);
    }
    else {
      triangle(x, y, x+2, y-2, x+5, y+5);
    }
}



