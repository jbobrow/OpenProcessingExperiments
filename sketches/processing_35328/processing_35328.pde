
size(300,300);
smooth();
float a;
a = 14;

ellipseMode(CENTER);
fill(255,0,0);
ellipse(width/2,height/2,3*a,3*a);

ellipseMode(CENTER);
fill(255,255,0);
ellipse((width/2)+100,height/2,60,60);

rectMode(CENTER);
fill(0,255,0);
rect(width/a,height/2,80,80);

strokeWeight(2);
stroke(255,100,0);
line((2*width)/3,height/2+3*a,(2*width)/3,height/2-3*a);

stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3-2*a,height/2+2*a,width/3,height/2-2*a,width/3+2*a,height/2+2*a);






