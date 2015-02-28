
size(300,300);

float x=8;

fill(255,0,0);
ellipse(width/2,height/2,6*x,6*x);

fill(255,255,0);
ellipse((width*5)/6,height/2,60,60);

fill(0,255,0);
rectMode(CENTER);
rect(width/x,height/2,80,80);

strokeWeight(2);
stroke(255,127,0);
line((width*2)/3,126,(width*2)/3,174);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,255);
triangle((width/3)-16,(height/2)+9.2,width/3,(height/2)-18.5,(width/3)+16,(height/2)+9.2);



