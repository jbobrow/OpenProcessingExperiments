
PImage img;
PFont font;

void setup() {
  size (400, 400);
  smooth();
  background(22, 22, 22);
  img = loadImage("owl.png");
  font = loadFont ("Georgia-40.vlw");
  textFont (font);


  //blue
  stroke (40, 225, 247, 120);

  translate (400, 400);

  for (int i =0; i < 100; i ++) {

    strokeWeight(i);
    rotate(PI/25);
    line (0, 0, 400, 400);
  }

  //lime
  stroke (224, 255, 90, 120);

  translate (0, 0);

  for (int i =0; i < 150; i ++) {

    strokeWeight(i);
    rotate(PI/15);
    line (0, 0, 0, 400);
  }
}

void draw() {
  noStroke();

  //owl
  image(img, 120, 110);

  //eyeball (left)
  fill (255, 155, 0);
  ellipse (235, 257, 15, 15); 

  //eyeball (right)
  fill (255, 155, 0);
  ellipse (320, 257, 15, 15); 

  //pupil (left)
  float m = map (mouseX, 0, width, 235-2, 235+2);
  fill(0);
  ellipse (m, 254, 8, 8);

  //pupil (right)
  float n = map (mouseX, 0, width, 320-2, 320+2);
  fill(0);
  ellipse (n, 254, 8, 8);

  //text
  fill(255);
  text ("Hooot.", 10, 390);
}


