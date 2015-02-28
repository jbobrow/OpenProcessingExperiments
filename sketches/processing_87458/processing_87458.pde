
// pattern : rectangles

size (500, 500);

background (0);

noFill ();
stroke (255);
strokeWeight (2);

for (float i=0; i<=width; i+=10) {
  for (float j=0; j<=height; j+=50) {
    rect (i*5, j, j*20, i+2);

    if (j<50) {
      stroke (61, 163, 193, 20);
      noFill ();
    }
    else {
      stroke (255, 0, 0, 50);
    }
  }
}
strokeWeight (2);
stroke (61, 163, 193, 50);
for (float i=0; i<=width; i+=10) {
  for (float j=0; j<=height; j+=50) {
    rect (j+i, i-j, j, i);
  }
}



