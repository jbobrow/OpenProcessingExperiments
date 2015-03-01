

size(300, 250);
//background(100);
smooth();

//head
fill(238, 206, 179);
ellipse(150, 125, 200, 200);

//left eye
fill(255);
ellipse(100, 125, 50, 50);

//left pupil
fill(0);
ellipse(100, 125, 5, 5);

//right eye
fill(255);
ellipse(200, 125, 50, 50);

//right pupil
fill(0);
ellipse(200, 125, 5, 5);

//mouth
fill(255);
//noStroke();
arc(150, 165, 150, 65, 0, PI);

//nose
fill(238, 206, 179);
triangle(125, 155, 150, 110, 175, 155);
rect(140, 100, 20, 60);


