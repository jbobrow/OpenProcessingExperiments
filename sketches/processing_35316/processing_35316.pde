
//date of birth: May 28,1990

size(300, 300);
background(200);
smooth();

float oggi = 28;

fill(255, 0, 0);
ellipseMode(RADIUS);
ellipse(width/2, height/2, oggi*3, oggi*3);

fill(255, 255, 0);
ellipseMode(DIAMETER);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/oggi, height/2, 80, 80);

stroke(255, 125, 0);
strokeWeight(2);
line(width*2/3, height/2+oggi*3, width*2/3, height/2-oggi*3);

stroke(0);
strokeWeight(1);
fill(0, 0, 255);
//height is 4*28=112
triangle(100, 94, 156, 206, 44, 206);


