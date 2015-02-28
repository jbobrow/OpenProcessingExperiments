
size(400, 400);
background(0); 

// Formula for grid of white dots 
for (int x=50; x < width; x+=75) {  // Variable, Test, Iterate
for (int y=50; y < height; y+=50) {  // Variable, Test, Iterate
    smooth(); 
    stroke(255); 
    strokeWeight(2); 
    point(x, y);
  }
}

// Red lines in composition
    stroke(196, 4, 4); 
    rect(50, 0, 1, height); // Long red vertical line
    //rect(0, 375, width, 1); // Long red horizontal line

// Transparent growing circles 
for (int p=75; p < width-10; p+=300) { // Variable, Test, Iterate
  smooth(); 
  strokeWeight(p); 
  stroke(255, 99); // White circles set to 99% Transparency
  line(p, height/4, p, height/4); // Formula for circle growth
}


