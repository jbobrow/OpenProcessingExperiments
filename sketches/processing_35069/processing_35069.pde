
size(300, 300);
float brad=6;

fill(255, 0, 0);
ellipse(width/2, height/2, brad*3, brad*3);

fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/brad, height/2, 80, 80);

stroke(255, 104, 3);
strokeWeight(2);
line(200, height/2+brad*3, 200, height/2-brad*3);

fill(0, 0, 255);
strokeWeight(1);
stroke(0);
triangle(width/3, height/2-brad*2, width/3-brad*2, height/2+brad*2, width/3+brad*2, height/2+brad*2);


