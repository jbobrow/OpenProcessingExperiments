
// Jennifer Lau
// Exercise: Ellipses #2

size (800, 800);
smooth ();
background (0);

//Variables
int e= 200;

for (int y=250; y >0; y -= 20) {
  strokeWeight (2);
  ellipse (50, 50, y, y);
}

for (int y=750; y >0; y -= 8) {
  strokeWeight (2);
  ellipse (750, 0, y, y);
}



for (int y=550; y >0; y -= 15) {
  strokeWeight (2);
  ellipse (550, width, y, y);
}

for (int y=250; y >0; y -= 10) {

  ellipse (height/2, 50, y, y);
}


for (int y=450; y >0; y -= 5) {
  strokeWeight (2);
  ellipse (750, width/2, y, y);
}

for (int y=250+e; y > 0 ; y -= 10) {
  strokeWeight (1);
  ellipse (450, 450, y, y);
}

for (int y=250+e; y >0; y -= 10) {
  strokeWeight (3);
  ellipse (250, 250, y, y);
}

for (int y=450+e; y > 0; y -= 7) {
  strokeWeight (2);
  ellipse (50, 750, y, y);
}

for (int y=450+e; y > 0; y -= 7) {
  strokeWeight (2);
  ellipse (50, 750, y, y);
}





