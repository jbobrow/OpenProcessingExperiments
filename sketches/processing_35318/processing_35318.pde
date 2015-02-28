
size(300,300);

float y=30;

fill(255,0,0);
ellipse(width/2,height/2,y*3,y*3);

fill(232,223,54);
ellipse(width+100,height/2,60,60);

fill(16,201,48);
rectMode(CENTER);
rect(300/y,150,80,80);

stroke(256,102,0);
strokeWeight(2);
line(200,150-3*y,200,150+3*y);

stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(100,height/2-y*2, width/3+y*2,height/2+y*2,width/3-y*2,height/2+y*2);

fill(232,214,49);
ellipseMode(CENTER);
ellipse(width/2+100,height/2,60,60);

