
size(300, 300);
float birth = 13;

fill(255, 0, 0);
ellipse(width/2, height/2, 3 * birth, 3 * birth);

fill(255, 255, 0);
ellipse(width/2 +100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/birth, height/2, 80, 80);

stroke(242, 120, 20);
strokeWeight(2);
float orange = 3*birth;
line(2*width/3, height/2 - orange, 2*width/3, height/2 + orange);


fill(0, 0, 255);
stroke(0, 0, 0);
strokeWeight(1);
float tri = 2*birth;
triangle(width/3, height/2 - tri, width/3 - tri, height/2 + tri, width/3 + tri, height/2 + tri);



