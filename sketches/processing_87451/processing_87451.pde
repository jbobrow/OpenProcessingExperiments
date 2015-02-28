
size (500, 500);
smooth ();

float ypos= 0;
float xpos= 0;
background (255);

strokeWeight (2);

for (int i=0; i<500; i+=3) {
  line (0, ypos, width, ypos);
  ypos= ypos+ 5;

  if (i< 100) {
    stroke (255, 0, 0);
  }
  else {
    stroke (100);
  }
}

strokeWeight (5);
for (int i=0; i<500; i+=2) {
  stroke (255);
  line (xpos, 0, xpos, 500);
  xpos= xpos+ 10;
}



