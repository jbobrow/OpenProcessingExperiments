
// Here we go
// step 1
size(600, 600);
// Originally size(300, 300); changed during step 3 to test the scaling.
background(135, 206, 250);
// step 2
float x = 30;
float y = 35;
float diameter = 30;

fill(#ADD8E6);
ellipse(x, y, diameter, diameter);

x = x + 100;
y = y + 100;
diameter = diameter + 100;

fill(#1E90FF);
ellipse(x, y, diameter, diameter);

x = x / 2;
y = y / 2;
diameter = diameter / 2;

fill(#00BFFF);
ellipse(x, y, diameter, diameter);

// step 3
fill(#8B4513);
rect(width / 2 - 212, height / 2, width / 3, height / 3);

fill(#FFD700);
triangle( width / 100, height / 1, width / 5, height / 1, width / 200, height / 1.5);

fill(#DC143C);
ellipse(width - x, height - y, width / 5, height / 5);

//step 4
strokeWeight(5);

stroke(#FF0000);
line(480, 25, 300, 50);

stroke(#FF4500);
line(480, 50* 2, 300, 25 * 3);

stroke(#FFFF00);
line(480, 25 * 6, 300, 50 * 3.5);

stroke(#7FFF00);
line(480, 25 * 12, 300, 50 * 5.3);

stroke(#191970);
line(480, 25 * 18, 300, 50 * 10);
// annnnnnd we're done!!!


