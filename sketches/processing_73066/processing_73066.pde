
PImage pugman;

void setup() {
  size(476, 600);

  pugman = loadImage("pugman.jpg");

  noStroke();

  rectMode(CENTER);

  /*draw 3000 random squares that take the pictures pixel color at (x,y)
   and draw a 60px square with that color*/
  for (int i=0; i< 3000; i++) {
    int x = int(random(width));
    int y = int(random(height));

    color c = pugman.get(x, y);

    fill(c, 50);
    rect(x, y, 60, 60);
  }
}

void draw() {
  //same as above, but constantly drawing different squares
  for (int i=0; i< 3000; i++) {
    int x = int(random(width));
    int y = int(random(height));

    color c = pugman.get(x, y);

    //distance between mouse and position of squares
    int d = int(dist(mouseX, mouseY, x, y));

    int pixel = int(map(d, 0, 766, 4, 60));

    /*change size of "pixel" in relation to mouse position. If the mouse is
     closer, drawing a smaller pixel.*/
    fill(c, 50);
    rect(x, y, pixel, pixel);
  }
}


