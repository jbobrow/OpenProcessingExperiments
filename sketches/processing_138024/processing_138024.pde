
/* 
 My goal in this project is to create a interactive drawing 
 program with saving capacity
 The user can choose one of five background images
 The user can draw different objects using mouse input
 The program options can be changed using keyboard input
 
 INSTRUCTIONS
 ==============================================================
 
 MOUSE INPUT
 --------------------------------------------------------------
 If the user clicks a mouse button a shape is drawn centered at
 the mouse position
 
 KEYBOARD INPUT
 --------------------------------------------------------------
 DELETE or BACKSPACE: Clean screen
 B: Change background image
 S: Save drawing
 E: Set an ellipse as the shape to be drawn
 R: Set a rect as the shape to be drawn
 P: Set a point as the shape to be drawn
 C: Change fill color to a random color
 I: Increase size of the shapes to be drawn
 D: Decrease size of the shapes to be drawn
 */

int s;
int shape;
float r, g, b;
int index;
PImage img;
String[] paths = {"background1.png", "background2.png", "background3.png", "background4.png", "background5.png"};

/* @pjs preload="background1.png", "background2.png", "background3.png", "background4.png", "background5.png"; */

void setup() {
  size(1024, 768);
  s = 50;
  shape = 0;
  index = 0;
  background(#000000);
  img = loadImage(paths[index]);
  image(img, 0, 0);
  rectMode(CENTER);
  r = random(255);
  g = random(255);
  b = random(255);
  fill(r, g, b);
  stroke(r, g, b);
}

void draw() {
}

void keyPressed() {
  switch(key) {
  // Clean screen
  case DELETE:
  case BACKSPACE:
    background(#000000);
    image(img, 0, 0);
    break;
    
  // Change background image
  case 'B':
  case 'b':
    if (index < 4) {
      index += 1;
    } else {
      index = 0;
    }
    img = loadImage(paths[index]);
    image(img, 0, 0);
    break;
  
  // Save image with unique name
  case 'S':
  case 's':
    save("IMG_" + year() + month() + day() + hour() + minute() + second() + ".png");
    break;

  // Choose ellipse shape
  case 'E':
  case 'e':
    shape = 0;
    break;

  // Choose rect shape
  case 'R':
  case 'r':
    shape = 1;
    break;

  // Choose point shape
  case 'P':
  case 'p':
    shape = 2;
    break;

  // Choose random fill color and stroke color
  case 'C':
  case 'c':
    r = random(256);
    g = random(256);
    b = random(256);
    fill(r, g, b);
    stroke(r, g, b);
    break;

  // Increase shape size
  case 'I':
  case 'i':
    s += 10;
    break;

  // Decrease shape size
  case 'D':
  case 'd':
    if (s > 10) {
      s -= 10;
    }
    break;
  }
}

void mousePressed() {
  switch(shape) {
    // Ellipse
  case 0:
    strokeWeight(1);
    ellipse(mouseX, mouseY, s, s);
    break;

    // Rect
  case 1:
    strokeWeight(1);
    rect(mouseX, mouseY, s, s);
    break;

    // Point
  case 2:
    strokeWeight(s / 10);
    point(mouseX, mouseY);
    break;
  }
}


