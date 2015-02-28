
size(300, 300);
float m=20;

ellipseMode(RADIUS);
fill(255,0,0);
ellipse(width/2, height/2, m*3, m*3);

fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0,255,0);
rectMode(CENTER);
rect(width/m, height/2, 80,80);

stroke(250,180,0);
strokeWeight(2);
line(width*2/3, height/2+m*3, width*2/3, height/2-m*3);

fill(0,0,255);
triangle(width/3,height/2-m*2,width/3-m*2,height/2+m*2,width/3+m*2,height/2+m*2);




