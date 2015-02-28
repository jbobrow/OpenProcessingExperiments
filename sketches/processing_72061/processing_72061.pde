
Earth earth;
Venus venus;
Mars mars;

PImage img;

void setup() {
  size(800, 800);

  venus = new Venus(width/2, height/2, .015, 125, 35);
  earth = new Earth(width/2, height/2, .005, 250, 20);
  mars = new Mars(width/2, height/2, .003, 325, 35);
  img = loadImage("sun.png.-m1.png");
}

void draw() {
  background(0);

  stroke(0, 0, 255, 50);
  strokeWeight(5);

  line(earth.x, earth.y, venus.x, venus.y);

  noFill();
  stroke(255, 0, 0, 50);

  ellipse(width/2, height/2, 250, 250);
  ellipse(width/2, height/2, 500, 500);
  //ellipse(width/2, height/2, 650, 650);

  image(img, (width/2)-50, (height/2)-50);

  venus.move();
  venus.display();

  fill(135, 206, 235);

  earth.move();
  earth.display();

  //mars.move();
  //mars.display();
}


