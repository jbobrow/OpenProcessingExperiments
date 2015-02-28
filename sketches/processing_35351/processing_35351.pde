
size(300, 300);
background(200);

float x;
x = 28;

ellipseMode(RADIUS);
fill(255, 0, 0);
ellipse(width/2, height/2, 3*x, 3*x);

ellipseMode(DIAMETER);
fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

rectMode(CENTER);
fill(0,255,0);
rect(width/x, height/2, 80, 80);

stroke(255,165,0);
strokeWeight(2);
line(width*2/3, height/2+3*x, width*2/3, height/2-3*x);

strokeWeight(1);
fill(0,0,255);
triangle(width/3, height/2-x*2, width/3+x*2, height/2+x*2, width/3-x*2, height/2+x*2);


