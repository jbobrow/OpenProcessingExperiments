
Rec [] recs = new Rec [16000]; // Array of Recs

Logo w; // A logo for W.W.

void setup () {
  size (800,800);
  smooth ();
  
  // Recs inputs
  for (int i = 0; i < recs.length; i++) {
    float recR = i/135+130/(i+1);
    float recG = i/135+130/(i+1);
    float recB = i/135+130/(i+1);
    recR = recR + 0.03*random (400) - 0.03*random (400);
    recG = recG + 0.03*random (400) - 0.03*random (400);
    recB = recB + 0.03*random (400) - 0.03*random (400);
    recs [i] = new Rec (color (recR, recG, recB), i/20, i/20, -i/1200.0+random (45)-random (45), -i/1200.0+random(45)-random(45), 25-((i-8000)/1350)*((i-8000)/1350)+random(50)-random(50), 25-((i-8000)/1350)*((i-8000)/1350)+random(50)-random(50));
  }
  
  // logo inputs
  
  w = new Logo (255, 255, 255, 0, 400, 400, 0, 0, 0); 
}

// Draw Recs and the logo
void draw () {
  background (255);
  for (int i = 0; i < recs.length; i++) {
    recs [i].move ();
    recs [i].display ();
  }
  
  
  w.colorchange ();
  w.display ();
}

// Define the Rec class
class Rec {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float xsize;
  float ysize;
  
  Rec(color c_, float xpos_, float ypos_, float xspeed_, float yspeed_, float xsize_, float ysize_) {
    c=c_;
    xpos=xpos_;
    ypos=ypos_;
    xspeed=xspeed_;
    yspeed=yspeed_;
    xsize=xsize_;
    ysize=ysize_;
  }
  
  // Draw Recs
  void display () {
    rectMode (CENTER);
    noStroke ();
    fill (c);
    rect (xpos, ypos, xsize, ysize);
  }
  
  // Recs slow down, but once below 18, increase the speed and disapear
  void move () {
    xspeed = 0.99*xspeed;
    yspeed = 0.99*yspeed;
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if (xpos > width || xpos < 0) {
      xspeed = -xspeed;
    }
    if (ypos > width || ypos < 0) {
      yspeed = -yspeed;
    }
    if (xspeed < 18 || yspeed < 18) {
      xspeed = xspeed*1.1;
      yspeed = yspeed*1.1;
    }
  }
}

// Define the logo class
class Logo {
  float wR;
  float wG;
  float wB;
  float wAlpha;
  float centerPotX;
  float centerPotY;
  float eR;
  float eG;
  float eB;
  
  Logo(float wR_, float wG_, float wB_, float wAlpha_, float centerPotX_, float centerPotY_, float eR_, float eG_, float eB_) {
    wR=wR_;
    wG=wG_;
    wB=wB_;
    wAlpha=wAlpha_;
    centerPotX=centerPotX_;
    centerPotY=centerPotY_;
    eR=eR_;
    eG=eG_;
    eB=eB_;
  }
  
  void display () {
    ellipseMode (CENTER);
    rectMode (CENTER);
    
    // Draw logo's circle
    stroke (wR, wG, wB, wAlpha);
    noFill ();
    ellipse (centerPotX,centerPotY,270-centerPotX*0.005-centerPotY*0.005,270-centerPotX*0.005-centerPotY*0.005);
    noStroke ();
    fill (255-wR, 255-wG, 255-wB, wAlpha-50);
    ellipse (centerPotX,centerPotY,268-centerPotX*0.005-centerPotY*0.005,268-centerPotX*0.005-centerPotY*0.005);
  
    // Draw W.W.'s body
    noStroke ();
    fill (wR, wG, wB, wAlpha);
    triangle (centerPotX/1.005,centerPotY/1.005-35,centerPotX/1.005-40,centerPotY/1.005+30,centerPotX/1.005+40,centerPotY/1.005+30);
  
    // Draw W.W.'s head
    noStroke ();
    fill (wR, wG, wB, wAlpha);
    rect (centerPotX,centerPotY-70,80,40);
  
    // Draw W.W.'s eyes
    noStroke ();
    eR = random (255);
    eG = random (255);
    eB = random (255);
    fill (eR*0.04+eG*0.03+135, eR*0.02+eB*0.02+45, eG*0.04+eB*0.05+35, wAlpha+5);
    rect (centerPotX-30,centerPotY-70,15,30);
    rect (centerPotX+30,centerPotY-70,15,30);

    // Draw W.W.'s leg
    noStroke ();
    fill (wR, wG, wB, wAlpha);
    triangle (centerPotX/1.01-20,centerPotY/1.01+45,centerPotX/1.01+20,centerPotY/1.01+45,centerPotX/1.01,centerPotY/1.01+75);
 
    // Draw W.W.'S pot
    noStroke ();
    fill (160, centerPotX*0.02+120, centerPotY*0.01+30, wAlpha+5);
    ellipse (centerPotX/1.005,centerPotY/1.005,13,13);
  }
  
  
  
  void colorchange () {
    wR = wR-2;
    wG = wG-2;
    wB = wB-2;
    wAlpha = wAlpha+2;
  }
}
    
    
  

