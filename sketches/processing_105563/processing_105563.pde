
//Lathem Wojno
//Traffic Light:
//8/5/13

rectMode(CENTER);
ellipseMode(CENTER);
noStroke();

background(225);

//rectangle (traffic light backing)
fill(195,195,55);
rect(50,50,50,100);

//green light
fill(6,225,6);
ellipse(50,80,25,25);

//yellow light
fill(225,225,6);
ellipse(50,50,25,25);

//red light
fill(225,6,6);
ellipse(50,20,25,25);
noFill();
