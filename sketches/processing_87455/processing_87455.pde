
//pattern : points01

size (500, 500);
background (255);
smooth ();

stroke (0, 50);
strokeWeight (2);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (x, y);
}

stroke (100, 200, 70, 20);
strokeWeight (10);
for (int x=5; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (x+50, y+50);
}

stroke (255, 20, 0, 20);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (y, x);
}

stroke (255, 0, 0, 20);
strokeWeight (10);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (y, x);
}

stroke (80, 50, 22, 20);
strokeWeight (10);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (x+100, y+100);
}

stroke (0, 30);
strokeWeight (5);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (y+100, x+100);
}

stroke (0);
strokeWeight (1);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (y+105, x+105);
}

for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (x+200, y+200);
}

stroke (255, 0, 0, 70);
strokeWeight (5);
for (int x=2; x<width; x=(x*2)) {
  for (int y=5; y<height; y=y+20)
  point (y+200, x+200);
}



