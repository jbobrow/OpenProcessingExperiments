
size(300,300);
//September 2nd
float x = 2;

//yellow circle
fill(255,255,0);
ellipse(250,150,60,60);

//green rectangle
fill(0,255,0);
rectMode(CENTER);
rect(width/x,height/2,80,80);

//red circle
fill(255,0,0);
ellipse(width/2,height/2,x*3,x*3);

//orange line
stroke(255,140,0);
strokeWeight(2);
line(width*.66,height/2+6,width*.66,height/2-6);

//blue triangle
stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3, height/2-2*x, width/3+2*x, height/2+2*x, width/3-2*x, height/2+2*x);


