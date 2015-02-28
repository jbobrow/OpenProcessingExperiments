

//define the size of the window
size(400, 400);

// set the color mode as red green blue
// with a range from 0 - width (in this case 400)

//colorMode(RGB, width);
colorMode(HSB,width);
//this is for loop
//every time it loops x has 1 added to it
//this will loop while x<width (so 399 time in this case)
//this loop steps us through verticle colums
for (int x=0;x<width;x++)
{
  //this loop step  us down each row
  for (int y=0;y<height;y++) {
    stroke(x, y, y);
    point(x, y);
  }
}


