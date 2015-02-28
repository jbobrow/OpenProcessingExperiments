
//Exercise for Creating Geometric and Generative Art with Code with
//Kunstwurfelspiel Academy

//line sketch 4

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

// set end of stroke to square end to red line
strokeCap(SQUARE);
// set stroke size to give heavier rule, change colour to red
strokeWeight(45);
stroke(255, 0, 0);

// set line to go horizontally from left to right
//centred, but not to touch edges
line(140, 250, 360, 250);

// set stroke size to give lighter rule, change colour to red
strokeWeight(10);

// set line to go from lower left toward the upper right 
//centred, but not to touch edges
line(160, 340, 340, 160);


