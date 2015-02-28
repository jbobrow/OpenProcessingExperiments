
size(300, 300);
smooth();

float x_birthday = 19;

//red circle
fill(255, 0, 0);
ellipse(height/2, width/2, 3*x_birthday, 3*x_birthday);

//yellow circle
fill(255, 255, 0);
ellipse(250, 150, 60, 60);

//green cube
fill(0, 255, 50);
rectMode(CENTER);
rect(width/x_birthday, height/2, 80, 80);

//orange line
stroke(255, 125, 0);
strokeWeight(2);
line(width*2/3, height/2+x_birthday*3, width*2/3, height/2-x_birthday*3);

//blue triangle
fill(0, 0, 255);
strokeWeight(1);
stroke(0, 0, 0);
triangle(width/3, height/2-x_birthday*2, width/3-x_birthday*2, height/2+x_birthday*2, width/3+x_birthday*2, height/2+x_birthday*2);


