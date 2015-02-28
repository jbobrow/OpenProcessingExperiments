
// Allison Etheredge
// Lab 4.2 - Iterative Composition using a nested loop
// September 19, 2011

size(400, 400);
background(0); 

// set variables
int spacing = 15; // sets spacng of the grid
int margin = 57; // sets margin size - black space around drawing
float circleSize;  

// draws the transluscent circle 
smooth(); 
fill(255, 55); 
noStroke(); 
ellipse(width, height, 710, 710); 
//ellipse(0, 0, 710, 710); 

// for() loops 
for (int x=margin; x < height-margin; x+=spacing) {
  for (int y=margin; y < width-margin; y+=spacing) {
    for (int z=0; z < 2; z+=1) { // adds variation to circle sizes 
      circleSize = random(20); // alters the maximum size the circle can reach

      // details for what is drawn within parameters of the for() loops
      // ellipse of varying sizes set to grid with gradient color change
      smooth();
      noStroke(); 
      fill(x, y, 255, 90); 
      ellipse(x, y, circleSize, circleSize);
    }
  }
}

