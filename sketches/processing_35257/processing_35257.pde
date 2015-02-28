
size(300,300);
float x = 16.0;

x = 48;
fill(255,0,0);
ellipse(150,150,x,x);


x = 60;
fill(255,255,0);
ellipse(250,150,x,x);

rectMode(CENTER);
fill(0,255,0);
rect(300/x,150,80,80);

x = 48;
strokeWeight(2);
stroke(255,129,3);
line(200,150-x,200,150+x);


noStroke();
fill(0,0,255);
triangle(100,118,68,182,132,182);

