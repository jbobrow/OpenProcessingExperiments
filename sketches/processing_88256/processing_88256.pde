
int n = 150;      // Change this number if you want
float y = .015;    // Try making small changes to this
float dy = .05;   // This changes the value of y for each item;
                  //   try making (very) small changes
float noiseY;     // Leave this
int x;            // Leave this
float noiseX;
 
size(500, 200);
colorMode(HSB, 360, 100, 100);
background(66, 35, 99);

  
for(int i = 1; i < n; i++) {   // This cycles through the loop n times
  stroke(126, 100, random(40, 60));
  strokeWeight(15);
  y += dy;                     // This increments y by a small amount
  x = i * (width/n);           // This moves across the window from left to right
  noiseY = noise(y)*height;    // This determines the y coordinate for the top
                               //   of each line
  line(x, height, x, noiseY);  // This draws the lines
}

for(int i = 1; i < n; i++) {
  stroke(6, random(60, 80), 100, 250);
  strokeWeight(2);
  x += .02;
  y = i* (height/n);
  noiseX = noise(x) * width;
  line(width, y, noiseX, y);
}

for(int i = 1; i < n; i++) {
  strokeWeight(5);
  stroke(242, random(85, 100), 100, 175);
  x += .02;
  y = i* (height/n);
  noiseX = noise(x) * width;
  line(width, height, noiseX, y);
}
