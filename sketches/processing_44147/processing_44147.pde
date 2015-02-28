
//  R.A. Robertson 2010.08 "Evasion Cycloidic" 
float x, y, dx, dy, slope, amp, mouseV, angleC, angleS, h, o, a, easing, strayX, strayY;
int change, toggle, toggleT;
void setup() {
  size(600, 400);
  noCursor();
  smooth();
  background(0, 30, 30);
  frameRate(60); // for a reasonable rate in Chrome.
 x = width/2; y = height/2; toggle = -1; easing = 0.05;
 }

void draw() { 
  fill(0, 30, 30); noStroke();
  rect(0, 0, width, height);
  fill(255);
  
   ellipse(mouseX, mouseY, 30, 30); // Chaser (Mouse).
   ellipse(x, y, 20, 20); // Evader.

   dx = mouseX - x;         // Run.
   dy = mouseY - y;         // Rise.
   slope = dy/dx;           // Slope = rise/run.
    // Slope to angle conversion.
  if (dx >= 0 && dy >= 0) { angleS = atan(slope); } // AngleS = slope derivation.
  else if (dx < 0 && dy > 0) { angleS = atan(slope) + PI;}
  else if (dx < 0 && dy <= 0) { angleS = atan(slope) + PI; }
  else if (dx >=0 && dy < 0) { angleS = atan(slope) + 2*PI; } 
    
    mouseV = dist(mouseX, mouseY, pmouseX, pmouseY);
    amp = 40; // Amplitude. Here, radius of cycloid.
    
if (dist(mouseX, mouseY, x, y) <= amp) { // Set reaction distance.

  x = (mouseX) - (sin(angleC - PI/2) * amp); // Cycloidic behavior
  y = (mouseY) + (cos(angleC - PI/2) * amp);
  angleC = (angleC + mouseV/(amp)* toggle); // % (2*PI) for debugging clarity.

  } 
  else {  angleC = angleS + PI;  } // Regular angle passed to initialize cycloidic angle.
  
  // Make line of intent indicator (optional).
//       h = amp - 20; // Define length of hypotenuse.
//       o = sin(angleS) * h; // Find length of opposite.
//       a = cos(angleS) * h; // Find length of adjacent.
//      stroke(255); line(mouseX, mouseY, mouseX - a, mouseY - o);
 
   change = int(random(50, 100)); // Reverse direction unpredictably.
   toggleT = frameCount % change;
  if (toggleT == change - 1) { toggle = toggle * -1; }
  
   strayX = width/2 - x; strayY = height/2 - y;// Return to center if straying.
  if(abs(strayX) > 0 && abs(strayY) > 0) { x += strayX * easing; y += strayY * easing; }
  
}


