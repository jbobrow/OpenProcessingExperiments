
size(300,300);

float o=8;

ellipseMode(RADIUS);
fill(255,0,0);
ellipse(width/2,height/2,3*o,3*o);

ellipseMode(CENTER);
fill(255,255,0);
ellipse((width/2)+100,height/2,7.5*o,7.5*o);

rectMode(CENTER);
fill(0,255,0);
rect(width/o,height/2,10*o,10*o);

strokeWeight(2);
stroke(255,127.5,0);
line((2*width)/3,(height/2)-(3*o),(2*width)/3,(height/2)+(3*o));

strokeWeight(1);
stroke(0);
fill(0,0,255);
triangle((width/3)+(2*o),(height/2)+(2*o),(width/3)-(2*o),(height/2)+(2*o),width/3,(height/2)-(2*o));

