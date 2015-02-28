
// Reese Wills
// Traffic Light: draws traffic light
// 8/5/2013

//Traffic Light: exercise 2 (Processing mod 1)

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();

// rectangle (traffic light backing)
fill(195,195,55);
rect(50,50, 50, 100);

// green Light
fill(6, 255, 6);
ellipse(50,80,25,25);

// yellow light
fill(255, 255, 6);
ellipse(50, 50, 25, 25);

// red light
fill(255, 6, 6);
ellipse(50,20,25,25);
noFill();
