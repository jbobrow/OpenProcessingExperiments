
//pattern : ellipse02

size(500, 500);
smooth();
noFill();
background(165, 234, 225);
strokeWeight (2);
stroke (0, 20);

int xpos= width;
int ypos= height;

for (int x=xpos/2; x<=width; x+=18) {
  for (int y=ypos/2; y<=height; y+=20)
    ellipse (xpos/2, ypos/2, x, y);
}

for (int x=0; x<=width/2; x+=10) {
  for (int y=0; y<=height/2; y+=10)
    ellipse (xpos/2, ypos/2, x, y);
}



