
// width, height
size(400, 200);

// black
background(0);

noFill();
// white
stroke(255, 255, 255);
strokeWeight(3);

// curve x1, y1, x2, y2, x3, y3, x4, y4
curve(5, 25, 5, 25, 75, 25, 75, 60);
// blue
stroke(0, 0, 255);
curve(5, 25, 75, 25, 75, 60, 15, 65); 
// white
stroke(255, 255, 255);
curve(75, 25, 75, 60, 25, 60, 5, 60);


