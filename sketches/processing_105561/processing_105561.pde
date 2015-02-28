
//traffic light

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();
//rectangle t(traffic light backing)
fill(195, 195, 55);
rect(50,50,50,100);

//green light
fill(6, 255, 6);
ellipse(50, 85, 25, 25);

//yellow light
fill(255, 255, 6);
ellipse(50, 50, 25, 25);

//red light
fill(255, 6, 6);
ellipse(50, 15, 25, 25);
noFill();
