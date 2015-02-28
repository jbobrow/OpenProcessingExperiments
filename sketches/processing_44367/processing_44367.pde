
//  R.A. Robertson 2010.09 "Restless" ~ www.rariora.org ~

float x, y, dx, dy, slope, amp, mouseV, angleC, angleS,
h, o, a, easing, strayX, strayY, homeX, homeY;
int change, toggle, toggleT;

void setup() {
  size(800, 400);
  noCursor();
  smooth();
//  background(0);
 x = width/2; y = height/2; toggle = -1; easing = 0.005;
  homeY = height/2; homeX = width/2;
 }

void draw() { 
  fill(255);  noStroke();
  rect(0, 0, width, height);
  fill(200);
  stroke(0);
  strokeWeight(.5);
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
    amp = 50; // Amplitude. Here, radius of cycloid.
    
if (dist(mouseX, mouseY, x, y) <= amp) { // Set reaction distance.
  x = (mouseX) - (sin(angleC - PI/2) * amp); // Cycloidic behavior
  y = (mouseY) + (cos(angleC - PI/2) * amp);
  angleC = (angleC + mouseV/(amp)* toggle); // % (2*PI) for debugging clarity.
  change = int(random(1, 10));
  } 
  else {  angleC = angleS + PI;  } // Regular angle passed to initialize cycloidic angle.
  
  // Make line of intent indicator (optional).
       h = amp; // Define length of hypotenuse.
       o = sin(angleS) * h; // Find length of opposite.
       a = cos(angleS) * h; // Find length of adjacent.
  stroke(100);
  strokeWeight(1);
  line(mouseX, mouseY, mouseX - a, mouseY - o);

if (dist(mouseX, mouseY, x, y) <= amp) {  
   change = int(random(1, 5)); } else // Struggle randomly if snared.
   change = int(random(100, 200)); // Reverse direction unpredictably.
   toggleT = frameCount % change; // Set random time interval.
  if (toggleT == change - 1) { toggle = toggle * -1; 
   homeX = random(width); homeY = random(height); }
  
   strayX = homeX - x; strayY = homeY - y; // Return to foraging if out of chaser reach.
   float xThen = x; float yThen = y;
   if(abs(strayX) > 0 && abs(strayY) > 0) { x += strayX * easing; y += strayY * easing; }
   float distX=(x-xThen)*40; float distY=(y-yThen)*40; line(x, y, x-distX, y-distY);
  
}

// Easing to random location updated at random intervals. From "evasion_cycloidic" sketch.

