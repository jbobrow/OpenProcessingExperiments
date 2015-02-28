
size(300, 300);
float josh=18;

fill (255, 0, 0);
ellipse(width/2, height/2, josh*3, josh*3);

fill(255, 255, 0);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/josh, height/2, 80, 80);

stroke(252, 125, 5);
strokeWeight(2);
line(200, height/2+josh*3, 200, height/2-josh*3);

fill(0, 0, 255);
stroke(0, 0, 0);
strokeWeight(1);
triangle(width/3, height/2-josh*2, width/3-josh*2, height/2+josh*2, width/3+josh*2, height/2+josh*2); 


