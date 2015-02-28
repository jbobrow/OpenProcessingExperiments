
size (300,300);
  background(200);
  smooth();

float dob;
//April 7, 1991
dob = 7;

ellipseMode(RADIUS);
fill(255,0,0);
ellipse(width/2, height/2, dob*3, dob*3);

ellipseMode(DIAMETER);
fill(255,255,0);
ellipse(width/2+100, height/2, 60,60);

rectMode(CENTER);
fill(0,255,0);
rect(width/dob, height/2, 80,80);

stroke(255,125,0);
strokeWeight(2);
line(width*2/3, height/2 + dob*3, width*2/3, height/2 - dob*3);

strokeWeight(1);
stroke(0);
fill(0,0,255);
triangle(width/3, height/2 - 2*dob, width/3 + 2*dob, height/2 + 2*dob, width/3 - 2*dob, height/2 + 2*dob);


