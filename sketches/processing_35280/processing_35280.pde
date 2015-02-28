
size(300, 300);
float turtle = 13.0;

fill(255, 0, 0);
ellipse(width/2, height/2, turtle*3, turtle*3);

fill(250, 250, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/turtle, height/2, 80, 80);

stroke(255,150,0);
strokeWeight(2);
line(200,height/2+turtle*3,200,height/2-turtle*3);

fill(0,0,255);
stroke(0,0,0);
strokeWeight(1);
triangle(width/3,height/2-turtle*2,width/3-turtle*2,height/2+turtle*2,width/3+turtle*2,height/2+turtle*2);

