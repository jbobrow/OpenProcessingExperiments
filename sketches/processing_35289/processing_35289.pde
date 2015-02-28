
//Joey Burnett

size(300,300);
smooth();

float bday = 16.0;

fill (255,0,0);
ellipse(width/2,height/2,3*bday,3*bday);

fill (255,255,0);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,255,0);
rect(width/bday,height/2,80,80);

stroke(255,150,0);
strokeWeight(2);
line(2*width/3,height/2+3*bday,2*width/3,height/2-3*bday);

stroke(1);
strokeWeight(1);
fill(0,0,255);
triangle(width/3,.5*height+2*bday,width/3-2*bday,.5*height-2*bday,width/3+2*bday,.5*height-2*bday);

