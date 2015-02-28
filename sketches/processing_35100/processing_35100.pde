
size(300, 300); 
smooth();

float bday =5;

fill(255, 0, 0);
ellipse(width/2, height/2, 3*bday, 3*bday);

fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/bday, height/2, 80, 80);

stroke(255, 116, 0);
strokeWeight(2);
line(200, height/2+bday*3, 200, height/2-bday*3);

stroke(0);
fill(0,0,255);
triangle(width/3, height/2-bday*2, width/3-bday*2, height/2+bday*2, width/3+bday*2, height/2+bday*2);


