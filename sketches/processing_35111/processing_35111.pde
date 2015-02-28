
size(300,300);
smooth();

int date;
date=23;

int width;
width=300;

int height;
height=300;

fill(255,0,0);
ellipse(width/2,height/2,3*date,3*date);

fill(246,255,3);
ellipse(250,height/2,60,60);

fill(46,245,7);
rectMode(CENTER); //Remember: You started rectMode
rect(width/date,height/2,80,80);

strokeWeight(2);
stroke(245,126,7);
line(200,height/2+6*date/2,200,height/2-6*date/2);

strokeWeight(1);
stroke(0,0,0);
fill(10,7,245);
triangle(width/3,height/2-4*date/2,width/3-4*date/2,height/2+4*date/2,width/3+4*date/2,height/2+4*date/2);




