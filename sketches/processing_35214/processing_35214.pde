
size(300,300);
smooth();
float x=22;

fill(255,0,0);
ellipse(width/2,height/2,3*x,3*x);

fill(255,255,0);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,255,0);
rect(width/x,height/2,80,80);

fill(0,0,255);
triangle(width/3,height/2-2*x,width/3-2*x,height/2+2*x,width/3+2*x,height/2+2*x);

stroke(255,122,0);
strokeWeight(2);
line(width*2/3,height/2+3*x,width*2/3,height/2-3*x);




