
size (300, 300);
float June30th = 30;

fill(255, 0, 0);
ellipse(width/2, height/2, 3*June30th, 3*June30th);

fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/June30th, height/2, 80, 80);

strokeWeight(2);
stroke(255, 150, 10);
line(2*width/3, height/2-6*June30th, 2*width/3, height/2+6*June30th);

fill (0, 0, 255);
strokeWeight(1);
stroke(1);
triangle(width/3, height/2-June30th*2, width/3-June30th*2, height/2+June30th*2, width/3+June30th*2, height/2+June30th*2);


