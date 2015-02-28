
//Alex Nelson

size(300, 300);

int spacing = 25;
int margin = 50;
int elementSize = 50;

//ellipse that is whole in the bottom right hand corner and slowly strecthes 
//as it makes its way to the upper left
fill(HSB,200,100,100);
for (int y=margin; y < height-margin; y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    ellipse(x, y, x+elementSize, y+elementSize);
  }
}
  
//smaller ellipses that begin to strech
fill(HSB,200,0,0);
for (int y=margin; y < height-margin; y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    ellipse(x, y, x-elementSize, y-elementSize);
  }
}


