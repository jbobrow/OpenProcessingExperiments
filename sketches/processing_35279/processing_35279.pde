
size(300,300);

//September 27
float bday = 27;
fill(250,0,0);
ellipse(width/2,height/2,3*bday,3*bday);

fill(250,250,0);
ellipse(100+width/2,height/2,60,60);

rectMode(CENTER);
fill(0,250,0);
rect(width/bday,height/2,80,80);

strokeWeight(2);
stroke(250,120,0);
line(width*2/3,height/2-6*bday,width*2/3,height/2+6*bday);

strokeWeight(1);
stroke(0);
fill(0,0,250);
triangle(width/3,height/2-2*bday,width/3-2*bday,height/2+2*bday,width/3+2*bday,height/2+2*bday);




