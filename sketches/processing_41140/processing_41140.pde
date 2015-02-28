


import processing.video.*;

float x;
float y;


Capture video;
color trackColor; 

void setup() {
  size(600,600);
  smooth();
  background(255);
  frameRate(100);
  
  x = width;
  y = height;
  
  
  video = new Capture(this,width,height,15); 
}


void draw() {

 
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }


  if (worldRecord < 10) { 
    
    fill(trackColor);
    ellipse(closestX,closestY,100,100);
  }
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  
  // Pick a new x and y
  float newx = constrain(x + random(-20,20),0,width/2-1);
  float newy = constrain(y + random(-20,20),0,height/2-1);
  
  // Find the midpoint of the line
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  
  // Pick the color from the video, reversing x
  color c = video.pixels[(width/2-1-midx) + midy*video.width/2];
  
  // Draw a line from x,y to the newx,newy
  stroke(c);
  strokeWeight(1);
  fill(c);
  ellipse(x,y,100,100);
  
  // Save newx, newy in x,y
  x = newx;
  y = newy;
    
}


