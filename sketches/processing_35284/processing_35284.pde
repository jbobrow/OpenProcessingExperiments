
size(300,300);

float Birthdate;
Birthdate = 8;

ellipseMode(RADIUS);
fill(255,0,0);
ellipse(width/2,height/2,3*Birthdate,3*Birthdate);

fill(255,255,0);
ellipse(((width/2)+100),height/2,30,30);

fill(0,255,0);
rectMode(CENTER);
rect(width/Birthdate,height/2,80,80);

stroke(255,125,0);
strokeWeight(2);
line(2*width/3,(height/2)-(3*Birthdate),2*width/3,(height/2)+(3*Birthdate));

fill(0,0,255);
stroke(0);
strokeWeight(1);
triangle(width/3,(height/2)-Birthdate*2,(width/3)-Birthdate*2,(height/2)+Birthdate*2,(width/3)+Birthdate*2,(height/2)+Birthdate*2);

