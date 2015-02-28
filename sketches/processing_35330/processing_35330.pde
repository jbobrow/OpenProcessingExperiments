
size(300,300);

float j = 3;

fill(255,0,0);
ellipseMode(RADIUS);
ellipse(width/2,height/2,3*j,3*j);

fill(255,255,0);
ellipseMode(CENTER);
ellipse((width/2)+100,(height/2),60,60);

fill(0,255,0);
rectMode(CENTER);
rect(width/j, height/2,80,80);

stroke(255,140,0);
strokeWeight(2);
line(width*2/3,(height/2)-3*j,width*2/3,(height/2)+3*j);

fill(0,0,255);
stroke(0);
strokeWeight(0);
triangle(width/3, (height/2)-2*j, (width/3)-2*j, (height/2)+2*j, (width/3)+2*j, (height/2)+2*j);

