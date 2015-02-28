
size(300,300);
float a=28;


fill(255,3,32);
ellipse(height/2,width/2,3*a,3*a);

fill(255,234,0);
ellipse(width/2+100,height/2,60,60);

fill(23,255,36);
rectMode(CENTER);
rect(width/a,height/2,80,80);

stroke(255,139,23);
strokeWeight(2);
line(width*2/3,height/2+3*a,width*2/3,height/2-3*a);

stroke(23,36,255);
fill(0,0,255);
triangle(width/3,height/2-2*a,width/3-2*a,height/2+2*a,width/3+2*a,height/2+2*a);

