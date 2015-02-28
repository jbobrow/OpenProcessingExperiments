
//Interactive Project using mouse and keyboard inputs
//This project is an interactive sketch of three shapes: polygons,
//circles, and squares. The shapes (chosen by the user) are drawn
//using various colors from the palette.

/*Project specifics:
 drag: draw
 
 KEYS
 1-3 : shape to be drawn (1 for polygon, 2 for circle, and 3 for
 square)
 b, w : switch between black (b) and white (w) background
 s : save png (default) or jpg screenshot
 */

//global variables
color black = #050505;
color white = #FFFFFF;
String shape = "polygon";
color[] palette = {
  #FF530D, #E82C0C, #FF0000, #E80C7A, 
  #FF0DFF, #FFB84B, #E844A1, #577CFF, #44E87A, #FFF6BB
};

//setup()
void setup() {
  size(800, 800);
  background(black);
  noFill();
}

//draw()
void draw() {
  if (mousePressed) {
    //total number of the particular shape to be drawn
    float counter = random(1, 10);

    //style
    strokeWeight(2);
    stroke(palette[int(random(10))]);

    if (shape == "polygon") {
      pushMatrix();
      beginShape();
      for (int i = 0; i <= counter; i++) {
        float x1 = mouseX - (25*i);
        float y1 = mouseY - (25*i);
        vertex(x1, y1);
        float x2 = mouseX + (25*i);
        float y2 = mouseY - (25*i);
        vertex(x2, y2);
      }
      endShape();
      popMatrix();
    }
    else if (shape == "circle") {
      for (int i = 1; i <= counter; i++) {
        ellipse(mouseX, mouseY, 25*i, 25*i);
      }
    }
    else if (shape == "square") {
      for (int i = 1; i <= counter; i++) {
        rect(mouseX-(25*i), mouseY-(25*i), 25*i, 25*i);
      }
    }
  }
}

//keyPressed()
void keyReleased() {
  if (key == 'b' || key == 'B') {
    background(black);
  } 
  else if (key == 'w' || key == 'W') {
    background(white);
  } 
  else if (key == 's' || key == 'S') {
    saveFrame("screenshot.png");
    //saveFrame("screenshot.jpg");
  }

  switch (key) {
  case '1':
    shape = "polygon";
    break;
  case '2':
    shape = "circle";
    break;
  case '3':
    shape = "square";
    break;
  }
}


