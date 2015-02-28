
float brushSize_x = 10;
float brushSize = map(brushSize_x, 10, width / 3 - 10, 1, 45);
float alpha_x = 10;
float alpha = map(alpha_x, 10, width / 3, 255, 0);
float red_x = width / 3 + 50;
float red = map(red_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
float green_x = width / 3 + 50;
float green = map(green_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
float blue_x = width / 3 + 50;
float blue = map(blue_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);

void setup()
{
  size(700, 700);
  background(255, 255, 255);
  
}

void mouseDragged()
{
  if (mouseY > height - 50) {
    if (mouseX < width / 3) {
      if (mouseY > height - 40) {
        if (mouseY < height - 20) {
          // BRUSH SIZE CONTROL
          brushSize_x = mouseX;
          brushSize_x = constrain(brushSize_x, 10, width / 3 - 10);
          brushSize = map(brushSize_x, 10, width / 3, 1, 45);
        }
      }
      if (mouseY > height - 10) {
        // TRANSPARENCY CONTROL
        alpha_x = mouseX;
        alpha_x = constrain(alpha_x, 10, width / 3 - 10);
        alpha = map(alpha_x, 10, width / 3, 255, 1);
      }
    }
    if (width / 3 < mouseX) {
      if (mouseX < 2 * width / 3 - 30) {
        // COLOR CONTROL
        if (mouseY > height - 31) {
          if (mouseY < height - 23) {
            // RED
            red_x = mouseX;
            red_x = constrain(red_x, width / 3 + 50, 2 * width / 3 - 50);
            red = map(red_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
          }
        }
        if (mouseY > height - 22) {
          if (mouseY < height - 14) {
            // GREEN
            green_x = mouseX;
            green_x = constrain(green_x, width / 3 + 50, 2 * width / 3 - 50);
            green = map(green_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
          }
        }
        if (mouseY > height - 13) {
          // BLUE
          blue_x = mouseX;
          blue_x = constrain(blue_x, width / 3 + 50, 2 * width / 3 - 50);
          blue = map(blue_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
        }
      }
    }
  } else {
    // DRAW
    stroke(red, green, blue, alpha);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}


void mouseReleased()
{
}

void draw()
{
  strokeWeight(1);
  stroke(0);
  fill(168, 168, 168);
  rect(0, height - 50, width / 3, 50); // size
  rect(width / 3, height - 50, width / 3, 50); // color
  rect(2 * width / 3, height - 50, width / 3, 50); // clear
  // size control
  fill(200, 200, 200);
  rect(10, height - 30, width / 3 - 20, 1);
  ellipse(brushSize_x, height - 30, 10, 10);
  // transparency control
  rect(10, height - 6, width / 3 - 20, 1);
  ellipse(alpha_x, height - 6, 10, 10);
  // text
  fill(0);
  textSize(18);
  text("Clear", 2 * width / 3 + 75, height - 25);
  textSize(14);
  text("Brush Color", width / 3 + 25, height - 32);
  text("Brush Size", 25, height - 35);
  text("Transparency", 25, height - 11);
  textSize(10);
  text("Red", width / 3 + 5, height - 24);
  text("Green", width / 3 + 5, height - 14);
  text("Blue", width / 3 + 5, height - 4);
  // color
  noStroke();
  fill(255, 255, 255);
  rect(2 * width / 3 - 47, height - 25, 47, 25);
  fill(0);
  rect(2 * width / 3 - 47, height - 50, 47, 25);
  fill(red, green, blue, alpha);
  ellipse(2 * width / 3 - 25, height - 25, brushSize, brushSize);
  // color control
  stroke(0);
  fill(200, 200, 200);
  rect(width / 3 + 50, height - 27, width / 3 - 100, 1);
  red_x = constrain(red_x, width / 3 + 50, 2 * width / 3 - 50);
  green_x = constrain(green_x, width / 3 + 50, 2 * width / 3 - 50);
  blue_x = constrain(blue_x, width / 3 + 50, 2 * width / 3 - 50);
  ellipse(red_x, height - 27, 8, 8);
  rect(width / 3 + 50, height - 18, width / 3 - 100, 1);
  ellipse(green_x, height - 18, 8, 8);
  rect(width / 3 + 50, height - 9, width / 3 - 100, 1);
  ellipse(blue_x, height - 9, 8, 8);
}
void mousePressed()
{
  if (mouseY > height - 50) {
    if (mouseX < width / 3) {
      if (mouseY > height - 40) {
        if (mouseY < height - 20) {
          // BRUSH SIZE CONTROL
          brushSize_x = mouseX;
          brushSize_x = constrain(brushSize_x, 10, width / 3 - 10);
          brushSize = map(brushSize_x, 10, width / 3, 1, 45);
        }
      }
      if (mouseY > height - 10) {
        // TRANSPARENCY CONTROL
        alpha_x = mouseX;
        alpha_x = constrain(alpha_x, 10, width / 3 - 10);
        alpha = map(alpha_x, 10, width / 3, 255, 1);
      }
    }
    if (width / 3 < mouseX) {
      if (mouseX < 2 * width / 3 - 30) {
        // COLOR CONTROL
        if (mouseY > height - 31) {
          if (mouseY < height - 23) {
            // RED
            red_x = mouseX;
            red_x = constrain(red_x, width / 3 + 50, 2 * width / 3 - 50);
            red = map(red_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
          }
        }
        if (mouseY > height - 22) {
          if (mouseY < height - 14) {
            // GREEN
            green_x = mouseX;
            green_x = constrain(green_x, width / 3 + 50, 2 * width / 3 - 50);
            green = map(green_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
          }
        }
        if (mouseY > height - 13) {
          // BLUE
          blue_x = mouseX;
          blue_x = constrain(blue_x, width / 3 + 50, 2 * width / 3 - 50);
          blue = map(blue_x, width / 3 + 50, 2 * width / 3 - 50, 0, 255);
        }
      }
    }
  } else {
    // DRAW
    noStroke();
    fill(red, green, blue, alpha);
    ellipse(mouseX, mouseY, brushSize, brushSize);
  }
}

void mouseClicked()
{
  if (mouseY > height - 50 && mouseX > 2*width/3) {
  // CLEAR SCREEN
  background(255, 255, 255);
  }
}


