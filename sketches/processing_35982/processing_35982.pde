
size(500, 500);
background(247, 79, 17);

//main face 
noStroke();
smooth();
fill(252, 224, 186);
ellipse(250, 250, 200, 300);

//hat
fill(8, 33, 250);
rect(200, 40, 100, 60);
fill(0, 0, 0);
rect(200, 80, 100, 20);

//hat tassels
stroke(3);
strokeWeight(4);
line(152, 110, 152, 170);
ellipse(152, 170, 10, 10);
line(170, 110, 170, 180);
ellipse(170, 180, 10, 10);
line(200, 110, 200, 170);
ellipse(200, 170, 10, 10);
line(230, 110, 230, 190);
ellipse(230, 190, 10, 10);
line(260, 110, 260, 170);
ellipse(260, 170, 10, 10);
line(300, 110, 300, 190);
ellipse(300, 190, 10, 10);
line(320, 110, 320, 165);
ellipse(320, 165, 10, 10);
line(347, 110, 347, 175);
ellipse(347, 175, 10, 10);

//hat brim
noStroke();
fill(8, 33, 250);
rect(150, 100, 200, 20);

//eyes
noStroke();
//white
fill(255, 255, 255);
ellipse(219, 250, 40, 50);
ellipse(281, 250, 40, 50);
//pupils
fill(0,0,0);
ellipse(230, 250, 25, 40);
ellipse(270, 250, 25, 40);
//lids
fill(245, 94, 182);
arc(220, 240, 45, 45, PI, TWO_PI);
arc(280, 240, 45, 45, PI, TWO_PI);

//nose
stroke(4);
fill(147, 145, 145, 70);
arc(250, 300, 30, 40, 0, PI);

//mouth
fill(252, 8, 28);
noStroke();
arc(250, 350, 69, 20, PI, TWO_PI);
fill(90, 5, 12);
arc(250, 350, 60, 20, 0, PI);

//freckles
stroke(6);
stroke(149, 89, 11);
point(210, 300);
point(200, 310);
point(184, 323);
point(183, 302);
point(300, 300);
point(323, 297);
point(315, 320);
point(280, 318);



