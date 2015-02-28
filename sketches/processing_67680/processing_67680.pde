
import processing.video.*;
MovieMaker myMovie;

Capture video;

color trackColor; 

// A rainbow variable
rainbow rainbow;

class rainbow {
  // x and y positions
  int[] xpos;
  int[] ypos;

  rainbow(int n) {
    xpos = new int[n];
    ypos = new int[n];
  }

  void update(int newX, int newY) {
    for (int i = 0; i < xpos.length-1; i ++ ) {
      xpos[i] = xpos[i+1]; 
      ypos[i] = ypos[i+1];
    }

    // Update the last spot in the array with the mouse location.
    xpos[xpos.length-1] = newX; 
    ypos[ypos.length-1] = newY;
  }

  void display() {
    // Draw everything
    for (int i = 0; i < xpos.length; i ++ ) {
      noStroke();
      color c = color(random(255), random(255), random(255));
      fill(c);
      ellipse(xpos[i], ypos[i], i, i);
    }
  }
}



void setup() {
  size(320, 240);
  // MakeMovie
  println("press spacebar to stop the recording");
  //Variable = new MovieMaker(this, cameraWidth, cameraHeight, "Filename.mov", frameRate, Codec, Quality);
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);


  video = new Capture(this, width, height, 15);
  // Start off tracking for black
  trackColor = color(0);
  smooth();

  // Initialize the rainbow
  rainbow = new rainbow(70);
}

void draw() {
  
  // MakeMovie
  myMovie.addFrame();
  
  if (video.available()) {
    video.read();
  }

  video.loadPixels();
  image(video, 0, 0);

  float closestColor = 500; 

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
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < closestColor) {
        closestColor = d;
        closestX = x;
        closestY = y;
      }
    }
  }


  if (closestColor < 50) { 
   rainbow.update(closestX, closestY);
  }

  rainbow.display();
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  saveFrame("makeawish.tif");
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

void keyPressed() {
  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
    println("recording stopped");
  }
}

void stop() {
  myMovie.finish(); // This finishes off the file properly...
  super.stop();
}


