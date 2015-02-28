
size(300,300);
float x;

x = 18;

fill(255,0,0);
ellipse(width/2,height/2,3*x,3*x);

ellipseMode(DIAMETER);
fill(242,236,29);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,200,0);
rect(width/x,height/2,80,80);

stroke(245,114,7);
strokeWeight(2);
line(width*2/3,height/2 + x*3, width*2/3, height/2 - x*3);

stroke(0);
strokeWeight(1);
fill(0,0,200);
triangle(width/3,height/2 - 2*x,width/3 + 2*x, height/2 + 2*x, width/3 - 2*x, height/2 + 2*x);



