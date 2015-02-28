
/*
Done for 2011 Bootcamp Purple Section
*/

size(300, 300);
background(0);
strokeWeight(2);

rectMode(RADIUS);
fill(0, 255, 255);
rect(100, 100, 50, 50);

rectMode(CORNER); //this one is by default, but because of the RADIUS above, I had to recall it
fill(255, 0, 0);
rect(100, 100, 50, 50);

rectMode(CORNERS);
fill(0, 255, 0);
rect(100, 100, 50, 50);

rectMode(CENTER);
fill(0, 0, 255);
rect(100, 100, 50, 50);


