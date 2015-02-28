
int maxMouths = 4; // Total # of images
int mouthIndex = 0; // Initial image to be displayed is the first

class Critter {

  float r; // radius
  float xpos, ypos;
  float xspeed, yspeed;
  color c = color(255);
  PImage[] mouths = new PImage[maxMouths];  

  // Constructor
  Critter(float tempR) {
    r = tempR;
    xpos = random(width);
    ypos = random(height);
    xspeed = random( -5, 5);
    yspeed = random( -5, 5);
    for (int i = 0; i < mouths.length; i ++ ) {
      mouths[i] = loadImage( "lips" + i + ".png" );
    }
  }
  void move() {
    xpos += xspeed; // Increment x
    ypos += yspeed; // Increment y

    // Check horizontal edges
    if (xpos > width || xpos < 0) {
      xspeed *= - 1;
    }

    // Check vertical edges
    if (ypos > height || ypos < 0) {
      yspeed *= - 1;
    }
  }

  // Whenever the balls are touching, this highlight() function is called 
  // and the color is darkened.
  void highlight() { 
    c = color(255);
  }

  // Draw the ball
  void display() {
    
    //head
    ellipseMode(CENTER);
    fill(255, 204, 0);
    stroke(0);
    strokeWeight(10);
    ellipse(xpos, ypos, 160, 160); //width/2 or 200, height/2 or 200

      // hair
    noFill();
    strokeWeight(10);
    arc(xpos, ypos-87, 50, 50, 0, PI/2); // width/2 or 200, height/3 or 133

    //mouth
    imageMode(CENTER); 
    image(mouths[mouthIndex], xpos, ypos+30, 125, 56);
//    mouthIndex = (mouthIndex + 1) % mouths.length;

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

    // After the ball is displayed, the color is reset back to a darker gray.
    c = color(0);
  }

  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Critter b) {

    // Objects can be passed into functions as arguments too! 
    float distance = dist(xpos, ypos, b.xpos, b.ypos); // Calculate distance

    // Compare distance to sum of radii
    if (distance < r + b.r) {
      return true;
    } 
    else {
      return false;
    }
  }
}


