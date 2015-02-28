
size (300,300);

//April 30th
float bday = 30;

//red circle
fill(255,0,0);
ellipse(width/2, height/2, 3*bday, 3*bday);

//yellow circle
fill(253,255,0);
ellipse(width/2 + 100, height/2, 60,60);

//green cube
fill(0,255,0);
rectMode(CENTER);
rect(width/bday, height/2, 80,80);

//orange line
stroke(250,139,63);
strokeWeight(2);
line((width*2)/3, (height/2)+(3*bday), (width*2)/3, (height/2)-(3*bday));

//blue triangle
fill(0,0,250);
stroke(30,30,30);
strokeWeight(1);
triangle(width/3, height/2-bday*2, width/3-bday*2, height/2+bday*2, width/3+bday*2, height/2+bday*2);


