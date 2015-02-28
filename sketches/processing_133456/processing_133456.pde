
void setup() {

  size(600, 600);
}

void draw() {

  //randomnessEllipses

  int randomEllipse = round ( random(0, 600) );
  int randomFill = round ( random(0, 255) );

  //randomnessLines

  int random1 = round( random(10, 100) );
  int random2 = round( random(100, 200) );
  int random3 = round( random(300, 400) );
  int random4 = round( random(500, 600) );
  int random5 = round( random(600, 10) );
  int random6 = round( random(600, 300) );
  int random7 = round( random(300, 100) );
  int random8 = round( random(500, 25) );

  //ellipses

  ellipse(300, 300, randomEllipse, randomEllipse);
  fill(randomFill);

  //lines

  line(random2, random1, random4, random3);
  stroke(randomFill);
  line(random4, random3, random2, random1);
  stroke(randomFill);
  line(random3, random4, random1, random2);
  stroke(randomFill);
  line(random5, random5, random6, random7);
  stroke(randomFill);
  line(random8, random8, random8, random8);
  stroke(randomFill);
  line(random5, random8, random7, random6);
  stroke(randomFill);
  line(random8, random8, random7, random6);
  stroke(randomFill);
}



