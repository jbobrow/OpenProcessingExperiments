
int maxMouths = 4; // Total # of images
int mouthIndex = 0; // Initial image to be displayed is the first

class Critter {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  PImage[] mouths = new PImage[maxMouths];

  Critter(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
    for (int i = 0; i < mouths.length; i ++ ) {
      mouths[i] = loadImage( "lips" + i + ".png" );
    }
  } 
  
  // Move Critter
  void jiggle() { // For simplicity we have also removed the “speed” argument from the jiggle() function. Try adding it back in as an exercise.
    // Change the location
    xpos = xpos + random(-4, 4);
    ypos = ypos + random(-4, 4);
    // Constrain Critter to window
    xpos = constrain(xpos, 0, width);
    ypos = constrain(ypos, 0, height);
  }

  void display() {
    // head
    ellipseMode(CENTER);
    fill(255, 204, 0);
    stroke(c);
    strokeWeight(10);
    ellipse(xpos, ypos, 160, 160); //width/2 or 200, height/2 or 200

      // hair
    noFill();
    strokeWeight(10);
    arc(xpos, ypos-87, 50, 50, 0, PI/2); // width/2 or 200, height/3 or 133

    //mouth
    imageMode(CENTER); 
    image(mouths[mouthIndex], xpos, ypos+30, 125, 56);
    mouthIndex = (mouthIndex + 1) % mouths.length;

    // left eye
    ellipseMode(CENTER);
    fill(c);
    noStroke();
    ellipse(xpos-27, ypos-26, 35, 25); // width/2.3 or 173, height/2.2 or 181

    // right eye
    ellipseMode(CENTER);
    fill(c);
    noStroke();
    ellipse(xpos+27, ypos-26, 35, 25); // width/1.75 or 228, height/2.2 or 181
  }
}        


