
PFont type;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  type = loadFont ("Helvetica-100.vlw");
  textFont (type);
}

void draw() {

  color bluebird = color (random(162), 236, 255, 100); 
  color yellow = color (255, 255, 98);
  color pink = color (255, 36, 139);
  color black = color (3, 3, 3);

  for (int i = 0; i <= width; i += 15) {
    for (int j = 0; j<= height; j+=15) {

      stroke (2, 157, 2);
      strokeWeight(2);
      fill(yellow);
      ellipse (i + j/35, j+i/35, 25+i/35, 60);

      noStroke();
      fill (bluebird);
      rect (random(width), random(height), 20, 20);

      fill (pink);
      ellipse (random(width), random(height), 10, 10);
    }

    //mouse interaction thing
    int x = mouseX;

    if (x > width/2) {
      //speech bubble
      fill (255, 255, 255);
      ellipse (width/2, height/2, 120, 100);

      //text
      fill (black);
      text ("?", 170, 240);

      //bubbles
      fill (255, 255, 255);
      ellipse (240, 255, 20, 20);

      fill (255, 255, 255);
      ellipse (250, 275, 15, 15);
    }
  }

  //monster 
  fill(black);
  ellipse (400, 400, 400, 350);

  //righteye
  fill(255, 255, 255);
  ellipse (350, 320, 10, 10);

  //lefteye
  fill(255, 255, 255);
  ellipse (280, 320, 10, 10);

  //mouth
  fill(214, 30, 30);
  ellipse (310, 350, 30, 20);

  //mouth thing
  fill(black);
  ellipse (310, 355, 35, 20);
}


