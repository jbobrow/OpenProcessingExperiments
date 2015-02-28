
size(300,300);
//November 26
float m=26;

fill(255,0,0);
ellipse(width/2,height/2,m*3,m*3);

fill(255,225,5);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,255,20);
rect(width/m,height/2,80,80);

fill(0,0,255);
triangle(width/3,height/2-m*2,width/3+m*2,height/2+m*2,width/3-m*2,height/2+m*2);

stroke(255,150,0);
strokeWeight(2);
line(width*2/3,height/2+3*m,width*2/3,height/2-3*m);


