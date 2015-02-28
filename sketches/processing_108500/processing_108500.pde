
background(1, 116, 15);
size(600, 600);

//neck//
fill(255, 193, 37);
rect(175, 350, 150, 300);

//base//
fill(55, 37, 139, 190);
strokeWeight(3);
quad(75, 450, 90, 550, 425, 520, 480, 425);

//head//
fill(255, 246, 143);
strokeWeight(0);
ellipse(250, 200, 400, 350);

//eyes//
fill(255, 255, 255);
strokeWeight(1);
ellipse(185, 150, 75, 20);
ellipse(300, 165, 75, 20);

//nose//
strokeWeight(1.7);
line(230, 180, 230, 300);
line(255, 240, 245, 300);
line(230, 300, 245, 300);

//mouth//
fill(255, 165, 79);
strokeWeight(1);
triangle(150, 320, 300, 330, 330, 310);

//pupils//
fill(0, 0, 0);
ellipse(185, 150, 15, 15);
ellipse(300, 165, 15, 15);

//weird eyebrow//
noFill();
strokeWeight(5);
arc(320, 160, 140, 110, PI, 2+PI);

//nostrills//
strokeWeight(3);
point(235, 295);
point(240, 295);

//goatee//
fill(0, 0, 0);
triangle(210, 350, 280, 350, 250, 420);

//beret//
fill(139, 0, 19);
strokeWeight(2);
triangle(270, 15, 50, 145, 100, 45);

//cheeks//
noStroke();
fill(240, 116, 155, 80);
ellipse(150, 240, 80, 100);
ellipse(350, 260, 80, 100);

//ears//
fill(255, 246, 143);
ellipse(50, 140, 60, 80);
ellipse(450, 140, 60, 80);
