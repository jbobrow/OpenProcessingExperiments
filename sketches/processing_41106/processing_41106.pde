
// Faysal Itani
// Assginment 4



import processing.video.*;

Capture video;

color trackColor; 

void setup() {
  size(320,240);
  video = new Capture(this,width,height,15);
  trackColor = color(255,0,0);
  smooth();
}

void draw() {
  if (video.available()) {
   
  video.read();
  }
  video.loadPixels();
  image(video,0,0);

  float worldRecord = 500; 

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

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 10) { 
    
    
    // Drawing the red face
    redface(closestX,closestY,closestX-50,closestY,closestX+50,closestY,closestX,closestY, closestX-30, closestY+10, closestX+30,closestX,closestY+30, closestX+20, closestY-20, closestX-20 ); //red face
   
  }
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

void redface (int x, int y, int x1, int y1, int x2, int y2, int e1, int e2, int f1, int f2, int ff1, int h1, int h2, int g1, int g2, int g3) {
   //ears   
      strokeWeight (2);
      stroke(0);
      fill (255);
      ellipse(x1, y1, 20, 20);
      
      stroke(0);
      fill (255);
      ellipse(x2, y2, 20, 20);
      
   //face
      strokeWeight (2);
      fill (255);
      ellipse (x, y, 100, 100);
      
  //nose
    fill (0);
    ellipse(e1,e2, 10, 5);
    
    //red head
   strokeWeight (1);
   stroke (0);
   fill(255);

  //red eyes and smile
    ellipse (g1,g2, 10,10);
    ellipse (g3,g2, 10,10);
    ellipse (h1, h2, 20, 20);

  //red spots
    noStroke ();
    fill (210, 14, 2);
    ellipse (f1, f2, 10, 10);

    noStroke ();
    fill (210, 14, 2);
    ellipse (ff1, f2, 10, 10);
   
  
    }

