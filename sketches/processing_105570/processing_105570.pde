
//Jonah Abramson
//Traffic Light: draws a traffic light
//8/5/13

//Traffic Light: exercise 2 (Processing mod 1)

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();

// rectangle (traffic light backing)
fill(195, 195, 55);
rect(50, 50, 50, 100);

// green light
fill(6, 255, 6);
ellipse(50, 81, 26, 26);

// yellow light
fill(255, 255, 6);
ellipse(50, 50, 25, 25);

// red light
fill(255, 6, 6);
ellipse(50, 20, 27, 27);
noFill();
