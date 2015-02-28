
// Thibault Bourgeois
// Trafic light 
// 5-8-2013


rectMode(CENTER);
ellipseMode(CENTER);
noStroke();


// rectangle (trafick light backing)
fill(50,50,50,100);
rect(50,50,50,100);

// green light
fill (6,255,6);
ellipse (50,20,25,25);

// orange light
fill (255,255,6);
ellipse (50,50,25,25);

// red light
fill (255,6,6);
ellipse (50,80,25,25);
noFill();
