
//Connor Novak
//Traffic Light
//2013/8/5
//Draws traffic light

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();

// rectangle (traffic light backing)
fill(0);
rect(50,50,50,100);

//green light
fill(6,255,6);
ellipse(50,82,25,25);

//yellow light
fill(355,355,6);
ellipse(50,50,25,25);

// red light
fill(255,6,6);
ellipse(50,18,26,26);
