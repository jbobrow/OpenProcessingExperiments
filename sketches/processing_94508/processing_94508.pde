
// Core
//
// Press Left/Right to change rotation speed
// Press 'b' to clear/delay background 
// Color mode HSB
// Slow in processing.js, so limited to 1000 total points
// Also turned off screen smudge

ArrayList dots,dots2;            // Define arrays for storing particles
float RY=0, rotationY=0.01;      // Refine Y rotation and rotation variable
boolean bgr;                     // Clean screen/smudge

void setup(){
  size(600,600,P3D);
  textSize(10);
  bgr = true;
  smooth(8);                     // Doesn't work in processing.js ??
  background(0);
  dots = new ArrayList();        // Outer array
  dots2 = new ArrayList();       // Inner array
}

void draw(){
  if (bgr) { background(0,0,0); }    // Draw background (clear screen)
  translate(300, 300);           // Draw from center
  pushMatrix();                  // Save matrix
  rotateY(RY);                   // Add rotation variable
  RY+=rotationY;                 // Increase rotation
  if (dots.size()<500) {         // Only add new particles if less than 1000 total [limited for processing.js]
    dots.add(new Dot(200,127));
    dots2.add(new Dot(50,35));
  }
  for (int i=0; i<dots.size(); i++) {        // Iterate and draw each array
   Dot dot = (Dot) dots.get(i);
   dot.drawDot();
   Dot dot2 = (Dot) dots2.get(i);
   dot2.drawDot();
   /*if (dots2.size()>2 && i>0) {              // Draw inner lines - removed for processing.js
     Dot dot3 = (Dot) dots2.get(i-1);
     strokeWeight(0.1);
     stroke(50,200,255,100);
     line(dot2.x, dot2.y, dot2.z, dot3.x, dot3.y, dot3.z);
   }*/
  }
  popMatrix();                    // Load saved matrix (reset)
  fill(255,0,255,100);
  text("Particles on each sphere: "+ dots2.size(),-285,265);
  text("Rotation: ~"+int(rotationY*4000) + "%   /   "+ int(frameRate)+" fps",-285,285);
}

class Dot {
  float x,y,z,s,t,w,r;
  color c;
  
Dot(float radius, color hue) {
  // Needed variables for locating random points on sphere
  r = radius;
  s = random(360);
  t = random(360);
  x = r * cos(s) * sin(t); 
  y = r * sin(s) * sin(t);
  z = r * cos(t);
  // Color+stroke stuff
  colorMode(HSB);
  c = color(hue,255,255,random(255));
  w = random(1.0,3.0); 
}

void drawDot(){
  strokeWeight(w);
  stroke(c);
  point(x,y,z);  
}

}

// Key catches
void keyPressed() {
  //if (key == 98) { bgr=!bgr; }
  if (key == CODED) {
    if (keyCode == RIGHT && rotationY <0.025) { rotationY+=0.0001; } else if (keyCode == LEFT && rotationY >-0.025) { rotationY-=0.0001; }
  }
}


