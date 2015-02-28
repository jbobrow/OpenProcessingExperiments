
int x = 100;
int y = 100;

void setup () {
size (600,400);
}

void draw () {

  if (keyPressed && (key == CODED)) {
  if (keyCode == LEFT) {
     x--;
  } else if (keyCode == RIGHT) {
      x++;
  } else if (keyCode == UP) {
      y--;
  } else if (keyCode == DOWN) {
      y++;
}
}

noStroke();
background (255);
fill (65,66,66);
ellipse (x +  81, y + 184, 23, 20);
ellipse (x +  168, y + 184, 23, 20);

fill (75,142,129);
rect (x +  66, y + 45, 15, 15);
fill (75,142,129);
rect (x + 170, y + 45, 15, 15);
fill (92,188,171);
rect (x + 66, y + 60, 120, 120);

fill (65,66,66);
rect (x + 41, y + 61, 50, 4);
rect (x + 158, y + 67, 24, 4);
rect (x + 118, y + 116, 24, 4);

fill (75,142,129);
rect (x + 95,y +  127, 54, 54);

fill (227,229,211);
ellipse (x + 81, y + 100, 58, 48);
fill (65,66,66);
ellipse ( x + 93,y +  96, 23, 20);
fill (227,229,211);
ellipse (x +  154, y + 94, 29, 39);
fill (65,66,66);
ellipse (x +  155, y + 99, 15, 15);

}


