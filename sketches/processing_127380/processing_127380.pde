
//Exercise for Creating Geometric and Generative Art with Code with
//Kunstwurfelspiel Academy

//line sketch 2

// set size
size(500, 500);
// set background to white
background(255);
// set stroke size
strokeWeight(36);
// set ends to give crisp point at edge
strokeCap(PROJECT);

// create outline of square, default colour black
line(60, 60, 440, 60);
line(440, 60, 440, 440);
line(440, 440, 60, 440);
line(60, 60, 60, 440);

// set end of stroke to round end to red line
strokeCap(ROUND);
// set stroke size to give lighter rule, change colour to red
strokeWeight(15);
stroke(255, 0, 0);

// set line to go from lower left corner toward the upper right 
//but not to touch it
// positions compensates for black line thickness
line(50, 450, 400, 100);

// set end of stroke to square end to red line
strokeCap(SQUARE);
// set stroke size to give lighter rule,
strokeWeight(4);

// set line to go from  lower right corner to the upper left, 
//but not to touch it
line(457, 457, 140, 140);


