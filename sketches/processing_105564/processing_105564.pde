
// Sherol Chen
// Traffic Light: draws traffic light
// 8-5-2013

//Traffic Light: exercise 2 (Processing mod 1) 

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();

// rectangle (traffic light backing)
fill(195, 195, 55);
rect(50,50, 50, 100);

// green light 
fill(6, 255, 6);
ellipse(50, 80, 25, 25); // x pos should be 50 

// yellow light
fill(255, 255, 6);
ellipse(50, 52, 25, 25); // y pos should be 50 

// red light
fill(255, 6, 6);
ellipse(50, 20, 30, 30); //x pos should be 50, y pos should be 80
noFill();
