
size (400, 400);
background (19, 79, 237);

translate (200, 200);
rotate (PI/6);

for (int i=0; i<6; i++) {
  fill (255);
  ellipse (100, 0, 200, 20);

  rect (100, 10, 20, 20);
  scale (1, -1);
  rect (100, 10, 20, 20);
  scale (1, -1);

  ellipse (150, 20, 20, 20);
  scale (1, -1);
  ellipse (150, 20, 20, 20);
  scale (1, -1);

  ellipse (70, 20, 20, 20);
  scale (1, -1);
  ellipse (70, 20, 20, 20);
  scale (1, -1);

  ellipse (0, 0, 40, 40);

  rotate (PI/3);
}

