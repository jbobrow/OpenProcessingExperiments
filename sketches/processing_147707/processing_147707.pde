
float[] x = new float [1]; // X-coordinates
float[] y = new float [1]; // Y-coordinates
color[] c = new color[1]; // colour
PVector[] p = new PVector[1];
ArrayList historyGlobal;
int selector;
void setup() {
  size(800, 800);
  colorMode(HSB, 140, 450, 200);
  background(0);
  x[0] = random(width/4);
  y[0] = random(height/7);
  c[0] = color(random(60, 330), random(30, 730), random(50, 130));
  p[0] = new PVector (random(0, 1), random(-1, 1));

  // the history global array is a list of all the points from each
  // line
  historyGlobal  = new ArrayList();
  // Add an array to a global array. A new one is created each time
  // the mouse button is clicked.
  historyGlobal.add(new ArrayList());
  selector = int(random(1, 2));
}

void draw() {
  for (int i = 0; i < x.length; i++) {
    updateVector(i);
    // constrain the vector
    p[i].x = constrain (p[i].x, -4, 4);
    p[i].y = constrain (p[i].y, -9, 9);
    // Update the position of the point with a vector
    x[i] += p[i].x; 
    y[i] += p[i].y;
    x[i] = constrain(x[i], 0, width); // Constrain x to width of display
    y[i] = constrain(y[i], 0, height); // Constrain y to height of display

    // Draw the point
    strokeWeight(.1);
    stroke(c[i], random (30, 70));

    // Get the current array element from the global history array
    ArrayList history = (ArrayList) historyGlobal.get(i);
    // Loop through the current array 
    for (int ii=0; ii<history.size(); ii++) {
      PVector histP = (PVector) history.get(ii);

      // Fill in the gap between the current line point and
      // previous historical points of the current array element

      if (dist(x[i], y[i], histP.x, histP.y) < 30) {
        line(x[i], y[i], histP.x, histP.y);
      }
    }  

    // Add the current point to the history
    history.add(new PVector(x[i], y[i]));
  }
}
void updateVector(int i) {
  if (selector>1) {
    p[i].x = p[i].x + random(-0.8, 0.8);
  }
  else p[i].y = p[i].y + random(-0.8, 0.8);
}

void mousePressed() {
  x = append(x, mouseX);
  y = append(y, mouseY);
  c = append(c, color(random(30, 330), random(30, 330), random(30, 330)));
  PVector newP = new PVector (random(0, 1), random(-1, 1));
  p = (PVector[])append(p, newP);
  // Add a new array to the global history array
  historyGlobal.add(new ArrayList());
}

