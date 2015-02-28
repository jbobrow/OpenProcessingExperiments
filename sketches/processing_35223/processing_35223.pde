
size (300,300);

float birth = 29;

fill(250,0,0);
ellipse(width/2,height/2,3*birth,3*birth);

fill(250,250,0);
ellipse(100+width/2,height/2,60,60);

rectMode(CENTER);
fill(0,250,0);
rect(width/birth,height/2,80,80);

strokeWeight(2);
stroke(250,120,0);
line(width*2/3,height/2-6*birth,width*2/3,height/2+6*birth);

strokeWeight(1);
stroke(0);
fill(0,0,250);
triangle(width/3,height/2-2*birth,width/3-2*birth,height/2+2*birth,width/3+2*birth,height/2+2*birth);



