
class Quiggle {
  float x; 
  float y;
  float w;
  float h;
  float r;
  float eyeSize;
  boolean hit = false;
  
  // Perlin noise
  float xt;
  float yt;
  float increment;
  
 // Quiggle Constructor 
Quiggle(float tempX, float tempY, float tempW, float tempH, float tempEyeSize, float tempxt, float tempyt, float tempincrement) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
    xt = tempxt;
    yt = tempyt;
    increment = tempincrement;
  }
  
  // Display Quiggle
  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    //Quiggle Body 
    r = random(255);
    noStroke();
    if (hit) {
      fill(232, 60, 12);
    } else {
      fill(r, 211, 53);
    }
    rect(x, y, w, h);
    rect(x + 20, y, w, h);

    //Quiggle Eyes
    fill(237, 176, 7);
    if (hit) {
      ellipse(x + 3, y - 26, eyeSize*1.35, eyeSize*1.35);
      ellipse(x + 16, y - 26, eyeSize*1.35, eyeSize*1.35);
    } else {
      ellipse(x + 3, y - 26, eyeSize, eyeSize);
      ellipse(x + 16, y - 26, eyeSize, eyeSize);
    }

    //Quiggle Legs
    noStroke();
    fill(237, 126, 7);
    rect(x + 5, y + 26, w/8, h/4);
    rect(x + 15, y + 26, w/8, h/4);
    
}

// Move Quiggle
   void wiggleQuiggle() {
     x = width * noise(xt);
     y = height * noise(yt);
   
     xt += increment;
     yt += increment;
   }

// Hit Test   
   void hitTest(Quiggle quiggle) {
     float distance = (x > quiggle.x ? x : quiggle.x);
     
     if (dist(x, y, quiggle.x, quiggle.y) <= 100) {
       quiggle.hit = true;
       hit = true;
     } else {
       quiggle.hit = false;
       hit = false;
     }
   }
   }

