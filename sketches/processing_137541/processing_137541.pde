
/* @pjs preload= "lights.jpg"; */

int i = 20;
PImage img;
PFont font;

void setup() {
  
  size(690, 690);
  font = loadFont ("MoonFlowerBold-60.vlw");
  textFont(font, 60);

  img = loadImage("lights.jpg");
  image(img, 0, 0);
}

void draw() {

  stroke(#84CBCA, mouseX, mouseY, 30);
  // if (mousePressed == true) {
  for (int y = 10; y <= height-20; y += 10) {
    for (int x = 10; x <= width-20; x += 10) {
      line(x, y, width/2, height/2);
    }
  }
  // }

  noStroke();

  while ( i <= width ) {
    int t = 10;
    while ( t <= height ) {
      fill (255, 50);
      ellipse( i, t+10, 15, 15);

      fill(i, mouseX, mouseY, 80);
      rect(i-10, t, 20, 20);

      t = t + 50;
    }
    i = i + 50;
  }

  if (keyPressed == true) {
    fill(#2B8893, 80);
    text("TONES", width/2-46, height/2+20);
  }
  else {
    fill(0);
  }
}


