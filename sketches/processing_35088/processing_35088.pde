

size(300,300);
float gilberto=9;

smooth();

fill(250,0,0);
ellipse(width/2, height/2, gilberto*3, gilberto*3);

fill(250,250,0);
ellipse(width/2+100, height/2, 60, 60);

fill(0,250,0);
rectMode(CENTER);
rect(width/gilberto, height/2, 80, 80);

stroke(250,120,0);
strokeWeight(2);
line(200, height/2+gilberto*3, 200, height/2-gilberto*3);

fill(0,0,250);
stroke(30,30,30);
strokeWeight(1);
triangle(width/3, height/2-gilberto*2, width/3-gilberto*2, height/2+gilberto*2, width/3+gilberto*2, height/2+gilberto*2);

