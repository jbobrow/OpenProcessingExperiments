
size (300, 300);
//Creating a variable "x" to equal my date of birth -  19th
float x=19;
smooth();
fill (250, 0, 0);
ellipse (width/2, height/2, x*3, x*3);

fill(255,255,0);
ellipse(width/2+100, height/2, 60, 60);

fill(0,250,0);
rectMode(CENTER);
rect(width/x, height/2, 80,80);

stroke(250, 120,0);
strokeWeight(2);
line((width*2)/3, (height/2+x*3), 200, height/2-x*3);

fill(0,0,250);
stroke(30,30,30);
strokeWeight(1);
triangle(width/3, height/2-x*2, width/3+x*2, height/2+x*2, width/3-x*2, height/2+x*2);

