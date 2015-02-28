
int cx, cy;       // Set cx, cy as the variables
int value = 0;

void setup() {
  size(600, 600);  // Set the window to 600 x 600 pixels
  frameRate(2);   // Set the frame rate to 2, show 2 frames each second
  background(0);  // Set the black background
  noFill();
  smooth();       // Smooth the line edges
}

void draw() {

  background(value);  // Clean the whole background each frame

    // Setting of white background
  // Smiling Face
  stroke(0);
  strokeWeight(5);
  ellipse(300, 300, 150, 150);
  ellipse(280, 280, 10, 10);
  ellipse(320, 280, 10, 10);
  line(280, 300, 300, 320);
  line(320, 300, 300, 320);
  
  // Pattern of the white background
  for ( int by = 20; by <= 600; by += 50 ) {
    for (int bx = 20; bx <= 600; bx += 50) {
      if (bx > 300) {
        strokeWeight(0.2);
        stroke(0);
        line(bx,by,bx+30,by-30);
      } else {
        strokeWeight(0.2);
        stroke(0);
        line(bx,by,bx+30,by+30);
      }
    }
  }
  
  // Setting of black background

  cx = floor(random(width));
  cy = floor(random(height));


  stroke(255);             // Set line value to
  strokeWeight(5);         // Set line width to 5 pixels
  ellipse(cx, cy, 100, 100);    // Set the ellipse with different locations randomly
  print(cx);
  print(',');               
  println(cy);              // The Coordinate of each circle will be printed


  int dx = 50, dy = 50;
  for (int y = 0; y <= height-80; y = y + dy) {
    for (int x = 0; x <= width-80; x = x + dx) {     
      strokeWeight(0.5);   // Set line width to 0.5 pixels
      stroke(0, 100, 250);   // Blue color
      rect(x, y, 100, 100);
    }
  }


  int ax = 50, ay = 50;
  for (int y = 50; y <= height-50; y = y + ay) {
    for (int x = 50; x <= width-50; x = x + ax) {
      strokeWeight(0.5); // Set line width to 0.5 pixels
      stroke(0, 250, 90);  //Yellow color 
      ellipse(x, y, 100, 100);
    }
  }
}

//Change the background color
void mouseClicked() {
   if (value == 0) {  
    value = 255;
  } 
  else {
    value = 0;
  }
}
