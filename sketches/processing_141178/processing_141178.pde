
size (750, 530);
background(255);

stroke (0);
strokeWeight (13);
line (0,55, 750,55);

stroke (0);
strokeWeight (13);
line (0,200, 750,200);

stroke (0);
strokeWeight (13);
line (0,450, 750,450);

stroke (0);
strokeWeight (13);
line (115,0, 115,530);

stroke (0);
strokeWeight (13);
line (220,0, 220,530);

stroke (0);
strokeWeight (13);
line (400,0, 400,530);

stroke (0);
strokeWeight (13);
line (620,0, 620,530);

stroke (0);
strokeWeight (13);
line (115,390, 220,390);

float quadrilatero = random (100);
if (quadrilatero <50) {
fill (255, 0, 0);
rect(115,55, 105,145);
}

float rettangolo = random (100);
if (rettangolo <50) {
  fill( 0, 0,255);
  rect(400,55, 220,145);
}

float forma = random (100);
if (forma < 50) {
   fill(250, 250, 0);
  rect(115,385, 105,65);
}
