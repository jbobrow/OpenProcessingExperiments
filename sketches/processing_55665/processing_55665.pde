
size(320, 200);
smooth();
background(50);

//head
fill(250, 0, 0);
ellipse(160, 80, 120, 120);
strokeWeight(8);
fill(255);
ellipse(140, 80, 40, 40);
strokeWeight(2);
fill(255);
ellipse(185, 90, 20, 20);
point(185, 90);
noStroke();
strokeJoin(ROUND);
fill(250);
rect(155, 115, 14, 5);

//hat
beginShape();
strokeJoin(ROUND);
strokeWeight(1);
fill(250);
vertex(110, 5);
vertex(210, 5);
vertex(210, 30);
vertex(240, 30);
vertex(240, 52);
vertex(80, 52);
vertex(80, 30);
vertex(110, 30);
endShape(CLOSE);


//body 
fill(250, 0, 0);
ellipse(160, 160, 40, 40);
rect(135, 150, 5, 20);
rect(180, 150, 5, 20);

//T SHIRT
beginShape();
noStroke();
fill(250);
int x = 150;
int y = 145;
vertex(x, 145);
vertex(x, x);
vertex(170, x);
vertex(170, y);
vertex(175, y);
vertex(175, 160);
vertex(180, 160);
vertex(180, 170);
vertex(140, 170);
vertex(140, 160);
vertex(y, 160);
vertex(y, y);
endShape(CLOSE);


//feet
stroke(1);
fill(130);
rect(y, 175, 15, 15);
rect(160, 175, 15, 15);
rect(140, 180, 5, 10);
rect(175, 180, 5, 10);
rect(135, 185, 5, 5);
rect(180, 185, 5, 5);













