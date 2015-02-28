
size(250, 250);
background(10);
smooth();

//background rectangles
noStroke();
fill(30);
rect(10, 10, 230, 230);
fill(60);
rect(20, 20, 210, 210);
fill(90);
rect(30, 30, 190, 190);
fill(120);
rect(40, 40, 170, 170);
fill(150);
rect(50, 50, 150, 150);
fill(180);
rect(60, 60, 130, 130);
fill(210);
rect(70, 70, 110, 110);
fill(240);
rect(80, 80, 90, 90);
fill(255);
rect(90, 90, 70, 70);

//middle  circles
noStroke();
fill(255);
ellipse(125, 125, 80, 80);
fill(220);
ellipse(125, 125, 70, 70);
fill(200);
ellipse(125, 125, 60, 60);
fill(160);
ellipse(125, 125, 50, 50);
fill(120);
ellipse(125, 125, 40, 40);
fill(70);
ellipse(125, 125, 30, 30);
fill(30);
ellipse(125, 125, 20, 20);

//curves
noFill();
//vertical curves
stroke(0, 100);
strokeWeight(10);
bezier(90, 0, 190, 90, 70, 170, 130, 250);

stroke(0, 170);
strokeWeight(5);
bezier(90, 0, 190, 90, 70, 170, 130, 250);

//horizontal curves
stroke(0, 100);
strokeWeight(10);
bezier(0, 150, 100, 80, 150, 170, 250, 110);

stroke(0, 170);
strokeWeight(5);
bezier(0, 150, 100, 80, 150, 170, 250, 110);

//corner squares
noStroke();
//top left corner
fill(20);
rect(115, 115, 10, 10);
fill(50);
rect(100, 100, 20, 20);
fill(80);
rect(85, 85, 25, 25);
fill(110);
rect(70, 70, 30, 30);
fill(140);
rect(55, 55, 35, 35);
fill(170);
rect(40, 40, 40, 40);
fill(200);
rect(25, 25, 45, 45);
fill(230);
rect(10, 10, 50, 50);
fill(245);
rect(-10, -10, 60, 60);

//bottom left corner 
fill(20);
rect(115, 125, 10, 10);
fill(50);
rect(100, 130, 20, 20);
fill(80);
rect(85, 140, 25, 25);
fill(110);
rect(70, 150, 30, 30);
fill(140);
rect(55, 160, 35, 35);
fill(170);
rect(40, 170, 40, 40);
fill(200);
rect(25, 180, 45, 45);
fill(230);
rect(10, 190, 50, 50);
fill(245);
rect(-10, 200, 60, 60);

//top right corner
fill(20);
rect(125, 115, 10, 10);
fill(50);
rect(130, 100, 20, 20);
fill(80);
rect(140, 85, 25, 25);
fill(110);
rect(150, 70, 30, 30);
fill(140);
rect(160, 55, 35, 35);
fill(170);
rect(170, 40, 40, 40);
fill(200);
rect(180, 25, 45, 45);
fill(230);
rect(190, 10, 50, 50);
fill(245);
rect(200, -10, 60, 60);

//bottom right corner 
fill(20);
rect(125, 125, 10, 10);
fill(50);
rect(130, 130, 20, 20);
fill(80);
rect(140, 140, 25, 25);
fill(110);
rect(150, 150, 30, 30);
fill(140);
rect(160, 160, 35, 35);
fill(170);
rect(170, 170, 40, 40);
fill(200);
rect(180, 180, 45, 45);
fill(230);
rect(190, 190, 50, 50);
fill(245);
rect(200, 200, 60, 60);

//tiny circle in the middle
fill(0);
ellipse(125, 125, 10, 10);



