
size(300,300);
float a = 12;

smooth();
fill(255,0,0); //red
ellipse(150,150,a*3,a*3); //birthday * 3

fill(255,255,0); //yellow
ellipse(250,150,30,30);

fill(0,255,0); //green
rectMode(CENTER); //draw from center
rect(300/a,150,80,80);

stroke(255,150,50);
strokeWeight(2);
line(200,height/2+a*3,200,height/2-a*3);

stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3,height/2-a*2,width/3-a*2,height/2+a*2,width/3+a*2,height/2+a*2);

