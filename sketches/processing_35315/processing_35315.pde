
//my birthday is november 23
size (300,300);
smooth();
float bday= 23;

fill(255,18,18);
ellipseMode(CENTER);
ellipse(width/2, height/2, 3*bday, 3*bday);

fill(246,255,0);
ellipse(100+width/2, height/2, 60, 60);

fill(30,253,15);
rectMode(CENTER);
rect(width/bday, height/2, 80, 80);

strokeWeight(2);
stroke(255,119,38);
line(2*width/3, height/2-3*bday, 2*width/3, height/2+3*bday);

stroke(0);
strokeWeight(1);
fill(30,57,246);
triangle(width/3, height/2-2*bday, width/3+2*bday, height/2+2*bday, width/3-2*bday, height/2+2*bday);







