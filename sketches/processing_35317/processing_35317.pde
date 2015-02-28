
size(300,300);

int d = 31;
//date of birth, December 31, 1990//

fill(255,0,0);
ellipseMode(RADIUS);
ellipse(width/2,height/2,3*d,3*d);

fill(255,255,0);
ellipseMode(CENTER);
ellipse((width/2)+100,height/2,60,60);

fill(0,255,0);
rectMode(CENTER);
rect(300/d,height/2,80,80);

strokeWeight(2);
stroke(255,140,0);
line(width*2/3,(height/2)-3*d,width*2/3,(height/2)+3*d);

strokeWeight(1);
stroke(0);

fill(0,0,255);
triangle((width/3),(height/2)-2*d,(width/3)-2*d,(height/2)+2*d,(width/3)+2*d,(height/2)+2*d);

//awwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww yeah//

