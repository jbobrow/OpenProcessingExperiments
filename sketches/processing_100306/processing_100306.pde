
int counter = 0;
boolean Drawing = false;

// Array for saved mouse points
int[] x = new int[1];
int[] y = new int[1];
float faderX = (float)mouseX/width;

// Easing Points
float penX, penY, ppenX, ppenY;
float targetX, targetY;

// Array for colors
color one = color(0); // Black
color two = color(255, 0, 0); // Red
color three = color(34,139,34); // Blue
color four = color(30,144,255); // Green
color five = color(255,255,0); // Yellow
color six = color(255,140,0); // Orange
color seven = color(255,105,180); // Pink
color eight = color(148,0,211); // Purple
color nine = color(205,133,63); // Brown
color ten = color(255,255,255); // White
color[] colors = {one, two, three, four, five, six, seven, eight, nine, ten}; // Color Array
int index = 0; // Used to switch between the provided colors
 
void setup () {
  size(1000, 1000);
  background (255);
  smooth();
  
}
 
void draw() {
  // rotateX (framecount*0.5);
  // rotateY (framecount*0.5);
  // Save points and expand array
  if (Drawing == true) {
  if (counter >= x.length)
    {
      x = expand(x);
      y = expand(y);
    }
    
    x[counter] = int(penX);
    y[counter] = int(penY);
    counter++;
  }
  
  // Easing Property
  if (penX != targetX || penY != targetY) {
    ppenX = penX;
    ppenY = penY;
    penX = penX + 0.05 * (targetX - penX);
    penY = penY + 0.05 * (targetY - penY);
    
    // Control color and opacity is calculated via the distance between the 2 coordinates
    strokeWeight(dist(ppenX, ppenY, penX, penY) * 0.1);
    strokeWeight(0.1);
    point(ppenX, ppenY);
    strokeWeight(0.01);
  }
   // Check the mouse against all of the stored points
  for (int i = 0; i < counter; i++) {
   // If the mouse is within the maximum join length to a previous point
   //if (dist(x[i], y[i], penX, penY) < joinDistance) {
   // Draw a line to the previously stored point
   stroke(colors[index], (dist(ppenX, ppenY, penX, penY) * 2));
   line(x[i], y[i], penX, penY);
   //line(x[i]*1, y[i]/2, penX, penY);
  }
}
 
void mousePressed() {
    // Easing
    Drawing = true;
    targetX = mouseX;
    targetY = mouseY;
    penX = targetX;
    penY = targetY;
    ppenX = penX;
    ppenY = penY;
}
 
void mouseReleased() {
    Drawing = true;
}
 
 void mouseDragged() {
  targetX = mouseX;
  targetY = mouseY;
}

void keyPressed() {
  // Keyboard controls for two colors
  if (key == DELETE || key == BACKSPACE) {
    background(255);
  }
  if( key == '9' || key == '9') {
    index = 9;
  }
  if( key == '8' || key == '8') {
    index = 8;
  }
  if( key == '7' || key == '7') {
    index = 7;
  }
  if( key == '6' || key == '6') {
    index = 6;
  }
  if( key == '5' || key == '5') {
    index = 5;
  }
  if( key == '4' || key == '4') {
    index = 4;
  }
  if( key == '3' || key == '3') {
    index = 3;
  }
  if( key == '2' || key == '2') {
    index = 2;
  }
  if( key == '1' || key == '1') {
    index = 1;
  }
  if( key == '0' || key == '0') {
    index = 0;
  }
}
