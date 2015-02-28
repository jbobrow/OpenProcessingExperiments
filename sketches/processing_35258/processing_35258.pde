
size(300,300);
float bday = 30;
fill(200,0,0);
ellipse(width/2,height/2,bday*3,bday*3);
fill(250,250,0);
ellipse(250,height/2,60,60);
fill(0,300,0);
rectMode(CENTER);
rect(width/bday,height/2,80,80);
strokeWeight(2);
stroke(200,100,0);
line(width*.66,bday+30,width*.66,bday+210);
noStroke();
fill(0,0,200);
triangle(40,210,100,90,160,210);

