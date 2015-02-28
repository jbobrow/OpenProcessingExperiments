
// Set the size
size(500, 500);
// Change color mode to hue-saturation-brightness and set scales for HSB and opacity from 0-100
colorMode(HSB, 100, 100, 100, 100);
// Set the background to black
background(0);
// Turn on smoothing & turn off the stroke
smooth();
noStroke();

// Define the color palette for the sketch by picking a random
// starting color and then choosing a range, somewhere between 0 and 30
// values away 
float startColor = random(0, 100);
float endColor = startColor + random(0, 30);

// Run a loop that draws 15 arcs
for (int i = 0; i < 15; i++) {
  // Set the fill color to a random color somewhere in the color palette range
  // For example, startColor could be 30, endColor could be 42, and it will
  // choose a random color between 30 and 42 for each arc

  // The 2nd & 3rd numbers (80) are the brightness and saturation for the fill color
  // The 4th number (50) is the transparency/opacity, which is 50%
  fill(random(startColor, endColor), 80, 80, 50);

  // Randomly choose a size for the arc that is no bigger than a quarter of a circle
  float size = random(0, PI/2);

  // Randomly choose a starting point anywhere in the circle
  float start = random(0, 2*PI);
  
  // Finally, draw the arc
  // Using width/2 and height/2 places the arc in the center of the screen
  // Using height*.8 sets the height & width of the arc to 80% of the canvas
  // Use the variable start to pick the starting point of the arc
  // Use the value (start + size) to define the end point of the arc
  arc(width/2, height/2, height*.8, height*.8, start, start + size);

  // Alternatively, place the arcs randomly on the screen instead of all starting from the center
  //arc(random(0, width), random(0, height), height*.8, height*.8, start, start + size);

  // Or, draw the arcs starting close to the center but add a random amount of variation
  //arc(width/2 + random(-30, 30), height/2 + random(-30, 30), height*.8, height*.8, start, start + size);
}


