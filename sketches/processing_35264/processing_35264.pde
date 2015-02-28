
size (300,300);
float partyatmyplace = 23;

ellipseMode(RADIUS);
fill (255,0,0);
ellipse(width/2,height/2,partyatmyplace*3,partyatmyplace*3);

ellipseMode(DIAMETER);
fill(255,255,0);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,225,0);
rect(width/partyatmyplace,height/2,80,80);

strokeWeight(2);
stroke(250,120,0);
line(width*2/3,height/2+partyatmyplace*3,width*2/3,height/2-partyatmyplace*3);

fill(0,0,225);
strokeWeight(1);
stroke(1);
triangle(width/3, height/2-partyatmyplace*2, width/3-partyatmyplace*2, height/2+partyatmyplace*2, width/3+partyatmyplace*2, height/2+partyatmyplace*2);



