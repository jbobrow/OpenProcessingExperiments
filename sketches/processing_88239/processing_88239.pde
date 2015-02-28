
int n = 200;      // Change this number if you want
float y = .05;    // Try making small changes to this
float dy = .02;   // This changes the value of y for each item;
                  //   try making (very) small changes
float noiseY;     // Leave this
int x;            // Leave this
 
size(500, 200);   // Can change this
background(255);  // Can change this
stroke(100);      // Can change this
  
for(int i = 1; i < n; i++) {   // This cycles through the loop n times
  y += dy;                     // This increments y by a small amount
  x = i * (width/n);           // This moves across the window from left to right
  noiseY = noise(y)*height;    // This determines the y coordinate for the top
                               //   of each line
  line(x, height, x, noiseY);  // This draws the lines
