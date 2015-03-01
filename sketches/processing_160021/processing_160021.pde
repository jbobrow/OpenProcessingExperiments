
color [] c1 = {#FF740D, #FFFFFF, #000000, #260062};
color[] p1 = c1;

//background
size(300,400);
background(p1[3]);

//base shape
stroke(255);
ellipse(150, 100, 80, 80);
ellipse(150, 180, 100, 100);
ellipse(150, 280, 130, 130);

//eyes
stroke(0);
strokeWeight(5);
point(135, 90);
point(165, 90);

//nose
stroke(p1[0]);
triangle(149, 103, 158, 103, 149, 100);

//mouth
stroke(p1[2]);
strokeWeight(2);
line(135, 115, 150, 125);
line(165, 115, 150, 125);

//buttons
strokeWeight(15);
point(150, 160);
point(150, 190);
point(150, 220);

//arms
strokeWeight(5);
line(100, 180, 50, 140);
line(200, 180, 250, 140);

//snow
strokeWeight(10);
stroke(p1[1]);
point(30, 30);
point(100, 60);
point(200, 70);
point(30, 200);
point(40, 170);
point(50, 200);
point(290, 180);
point(280, 300);
point(270, 50);
point(50, 350);
point(50, 300);
point(75, 140);
point(250, 100);
point(245, 280);
point(150, 10);
point(250, 200);
rect(0, 350, 300, 50);

//hat
stroke(p1[2]);
line(100, 70, 200, 70);
strokeWeight(1);
fill(0);
rect(120, 30, 60, 40);


