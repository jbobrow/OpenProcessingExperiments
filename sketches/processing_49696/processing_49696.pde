
void drawLines() {

  fill(#AC403E);
  triangle(0, 0, width, -166, width, 166);
  triangle(0, 0, -width, 166, -width, -166);

  line(0, 0, width, height/height-height/3);
  line(0, 0, -width, -(height/height-height/3));

  line(0, 0, width, height/height-height/5);
  line(0, 0, -width, -(height/height-height/5));

  line(0, 0, width, height/height-height/9.5);
  line(0, 0, -width, -(height/height-height/9.5));

  line(0, 0, width, 0);
  line(0, 0, -width, 0);

  line(0, 0, width, height/9.5);
  line(0, 0, -width, -height/9.5);

  line(0, 0, width, height/5);
  line(0, 0, -width, -height/5);

  line(0, 0, width, height/3);
  line(0, 0, -width, -height/3);
}


