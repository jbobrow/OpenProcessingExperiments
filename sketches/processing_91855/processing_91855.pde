
  int theShape = 0;
  int theColor = 0;

  void setup() {
    //size(750, 500);
    size(displayWidth, displayHeight);
    background(50);
    grid();
    textSize(15);
    text("you can write and draw on this chalkboard whatever you want",
        160, 25);
    textSize(10);
    text("Controls:: UP/DOWN change shape :: LEFT/RIGHT change color, ",
        160, 50);
    fill(0, 102, 153);
  }

  void draw() {
    // initiating all the available colors
    color[] colors = { color(255, 0, 0), color(255, 255, 0),
        color(0, 255, 0), color(0, 0, 255), color(255, 255, 255) };

    // draw if mouse is pressed
    if (mousePressed == true) {
      // fill out the shapes with the chosen color
      fill(colors[theColor]);
      stroke(colors[theColor]);

      // switch statement to provide the shapes
      switch (theShape) {
      // circle
      case 0:
      default:
        ellipse(mouseX, mouseY, 100, 100);
        break;
      case 1:
        rect(mouseX, mouseY, 30, 30);
        break;
      // triangle
      case 2:
        translate(mouseX, mouseY);
        beginShape(TRIANGLES);
        vertex(0, -20);
        vertex(30, 30);
        vertex(-30, 30);
        endShape();

        endShape();
        break;
      // dashes
      case 3:
        strokeWeight(10);
        smooth();
        // stroke(255);
        line(mouseX, mouseY, pmouseX, pmouseY);
        break;
      }
    }
  }

  // listener for keyboard orders
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        theShape = (theShape + 1) % 4;
      }
      if (keyCode == DOWN) {
        theShape = (theShape + 3) % 4;
      }
      if (keyCode == LEFT) {
        theColor = (theColor + 1) % 5;
      }
      if (keyCode == RIGHT) {
        theColor = (theColor + 3) % 5;
      }
    }
  }

  void grid() {
    for (int i = 0; i < width; i += 20) {
      for (int j = 0; j < height; j += 20) {
        stroke(80);
        line(i, j, i + 20, j);
        line(i, j, i, j + 20);
        line(i + 20, j, i + 20, j + 20);
        line(i, j + 20, i + 20, j + 20);

      }
    }
  }


