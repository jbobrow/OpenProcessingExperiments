
//This program draws a variation on the Hermann grid.

size(300, 300);
background(255);
noStroke();
fill(0);

//This set of for loops draws the black squares.
{
  int margin=15;  
  int spacing=30;

  for (int y=margin; y<height-margin; y+=spacing) {
    for (int x=margin; x<width-margin; x+=spacing) {
      rect(x, y, 25, 25);
    }
  }
}

//This set of for loops draws the red squares.
{
  int margin=35;
  int spacing=30;

  fill(255, 0, 0);
  for (int y=margin; y<height-margin; y+=spacing) {
    for (int x=margin; x<width-margin; x+=spacing) {
      rect(x, y, 15, 15);
    }
  }
}


