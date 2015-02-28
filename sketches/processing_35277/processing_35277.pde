
size(300,300);
float x=23;

x=x*3;
fill(255,51,51);
ellipse(150,150,x,x);

fill(255,255,102);
ellipse(250,150,60,60);

fill(0,255,102);
rectMode(CENTER);
rect(150/x,150,80,80);

strokeWeight(2);
stroke(255,102,51);
line(200,150-x,200,150+x);

x=x*2/3;
stroke(0,0,0);
strokeWeight(1);
fill(0,51,255);
triangle(100,150-x,100-x,150+x,100+x,150+x);





