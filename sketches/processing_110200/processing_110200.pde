
int grid = 20;
float b = 0;
ArrayList<Prism> prisms;

//slider variables
boolean dragging = false; // Is the slider being dragged?
boolean rollover = false; // Is the mouse over the slider?

// Rectangle variables for slider
float rx = 50;
float ry = 500;
float rw = 10;
float rh = 100;
// Start and end of slider
float sliderStart = 70;
float sliderEnd = 570;
float offsetX = 0;  // Offset for dragging slider

void setup() {
  size(640, 640);
  prisms = new ArrayList<Prism>();
  for (int y = 0; y < width; y += grid) {
    for (int x = 0; x < height; x += grid) {
      float r = random(1);
      color c = color(noise(y, x)*255, noise(y, x)*200, noise(y, x)*55, random(255));
      if (r < 0.25) {
        prisms.add(new Prism(x, y, x, y+grid, x+grid, y+grid, c /*v*/)); // add a new instance of the class Prism to the arrayList prisms.
      } 
      else if (r >= 0.25 && r < 0.5) {
        c = color(noise(r)*105, noise(r)*200, noise(r)*155, random(255));
        prisms.add(new Prism(x, y, x+grid, y, x, y+grid, c /*v*/));
      } 
      else if (r >= 0.5 && r < 0.75) {
        prisms.add(new Prism(x, y, x+grid, y, x+grid, y+grid, c /*v*/));
      } 
      else {
        prisms.add(new Prism(x+grid, y, x+grid, y+grid, x, y+grid, c /*v*/));
      }
    }
  }
}

void draw() {
  background(255);

  for (int i = 0; i < prisms.size(); i++) {
    prisms.get(i).display();
  }

  b = (int) map(rx, sliderStart, sliderEnd - rw, 2, 6);

  noStroke();
  fill(color(255, 255, 255, 220));
  rect(50, 480, 540, 140);

  float d = sliderStart;
  while (d < sliderEnd) {
    for (float h = -10; h > -100; h = h-2.71) {
      fill(color(255, 0, 0, 60));
      noStroke();
      rect(d, 600, 10, h);
      d = d+14.848;
    }
  }

  if (dragging) {
    rx = mouseX + offsetX;
  }
  // Keep rectangle within limits of slider
  rx = constrain(rx, sliderStart, sliderEnd - rw);

  stroke(0);
  if (dragging) {
    fill(color(255, 77, 90));
  } 
  else {
    fill(color(255, 128, 137));
  }

  // Draw rectangle for slider
  noStroke();
  rect(rx, ry, rw, rh);
}

void mousePressed() {
  // Did I click on slider?
  if (mouseX > rx && mouseX < rx + rw && mouseY > ry && mouseY < ry + rh) {
    dragging = true;
    // If so, keep track of relative location of click to corner of rectangle
    offsetX = rx - mouseX;
  }
}

void mouseReleased() {
  // Stop dragging
  dragging = false;
  for (int i = 0; i < prisms.size(); i++) {
    if (prisms.get(i).should_grow()) {
      prisms.remove(i);
    }
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  rx -= e;
}


class Prism {
  int x1, x2, x3, y1, y2, y3, max_height, current_height, desired_height, x_offset, current_x_offset, desired_x_offset, mouseRange;
  color c;

  Prism(int tempx1, int tempy1, int tempx2, int tempy2, int tempx3, int tempy3, color tempcolor) {
    x1 = tempx1;
    y1 = tempy1;
    x2 = tempx2;
    y2 = tempy2;
    x3 = tempx3;
    y3 = tempy3;
    c = tempcolor;
    max_height = (int) random(100);
    current_height = 1;
    current_x_offset = 0;
    desired_x_offset = 0;
    mouseRange = (int) random(10, 50);
    x_offset = (int) random(30, 100);
  }

  boolean should_grow() {
    //needs to be fixed because some prisms aren't getting picked up
    if (mouseX > x1 - mouseRange && mouseX < x1 + grid + mouseRange && mouseY > y1 - mouseRange && mouseY < y1 + grid + mouseRange) {
      return true;
    } 
    else {
      return false;
    }
  }

  void change_height() {
    if (current_height < desired_height) {
      current_height += b;
    } 
    else if (current_height > desired_height) {
      current_height -= 1;
    }

    if (current_x_offset < desired_x_offset) {
      current_x_offset += b;
    } 
    else if (current_x_offset > desired_x_offset) {
      current_x_offset -= 1;
    }
  }
  
  void change_color() {
    c = color(random(255), random(255), random(255), random(255));
 
  }

  void display() {

    fill(c);
    if (should_grow()) {
      desired_height = max_height + int(b) *20;
      desired_x_offset = x_offset;
    }
    else {
      desired_height = 0;
      desired_x_offset = 0;
    }
    noStroke();

    triangle(x1, y1, x2, y2, x3, y3);

    if (current_height > 0 || current_x_offset > 0) {
      stroke(255);
      quad(x1, y1, x2, y2, x2 - current_x_offset, y2 - current_height, x1 - current_x_offset, y1 - current_height);
      quad(x1, y1, x3, y3, x3 - current_x_offset, y3 - current_height, x1 - current_x_offset, y1 - current_height);
      quad(x2, y2, x3, y3, x3 - current_x_offset, y3 - current_height, x2 - current_x_offset, y2 - current_height);
      triangle(x1 - current_x_offset, y1 - current_height, x2 - current_x_offset, y2 - current_height, x3 - current_x_offset, y3 - current_height);
    }
    change_height();
  }
}


