
void setup() {
size(600, 600);
background (255, 230, 210);



noStroke();
fill(125, 125, 120);
rect(0, 300, 600, 400);

fill(193, 191, 190);
beginShape();
vertex(0, 275);
vertex(220, 275);
vertex(220, 475);
vertex(0, 475);
endShape(CLOSE);

fill(190, 188, 190);
beginShape();
vertex(220, 275);
vertex(220, 475);
vertex(320, 375);
vertex(320, 275);
endShape(CLOSE);

fill(255, 255, 255);
beginShape();
vertex(0, 0);
vertex(220, 0);
vertex(220, 100);
vertex(0, 100);
endShape(CLOSE);

fill(250, 251, 255);
beginShape();
vertex(220, 0);
vertex(320, 40);
vertex(320, 100);
vertex(220, 100);
endShape(CLOSE);

fill(30, 110, 30);
beginShape();
vertex(0, 30);
vertex(220, 30);
vertex(220, 40);
vertex(0, 40);
endShape(CLOSE);

fill(255, 30, 30);
beginShape();
vertex(0, 70);
vertex(220, 70);
vertex(220, 80);
vertex(0, 80);
endShape(CLOSE);

noStroke();
fill(255, 255, 255);
rect(456, 60, 90, 160);

ellipse(465, 70, 65, 55);
ellipse(497, 70, 65, 55);
ellipse(530, 70, 65, 55);

noStroke();
fill(255, 255, 255);
ellipse(500, 415, 124, 300);

noStroke();
fill(255, 200, 180);
ellipse(500, 224, 115, 125);

fill(255, 255, 255);
ellipse(370, 180, 125, 80);

triangle(365, 185, 430, 235, 395, 144);

fill(0, 0, 0)
stroke(0, 0, 0);
textSize(15);
text("put the pepperoni", 313, 176);
textSize(20);
text("on the pizza", 316, 195);
noStroke();


fill(0, 0, 0);
ellipse(542, 576, 90, 40);
ellipse(458, 576, 90, 40);

noStroke();
fill(255, 255, 255);
beginShape();
vertex(442, 400);
vertex(500, 400);
vertex(500, 566);
vertex(445, 556);
endShape(CLOSE);


noStroke();
fill(255, 255, 255);
beginShape();
vertex(562, 408);
vertex(500, 408);
vertex(500, 566);
vertex(554, 556);
endShape(CLOSE);



fill(0, 0, 0);
ellipse(501, 253, 7, 13);

noStroke();
fill(255, 100, 80);
ellipse(500, 220, 25, 17);

fill(255, 255, 255);
ellipse(490, 200, 22, 22);
ellipse(510, 200, 22, 22);

fill(0, 0, 0);
ellipse(490, 200, 6, 6);
ellipse(510, 200, 6, 6);

stroke(0, 0, 0);
line(485, 187, 500, 193);
line(515, 187, 500, 193);

noStroke();
fill(225, 150, 0);
triangle(10, 185, 170, 585, 230, 185);

fill(175, 125, 0);
ellipse(45, 185, 80, 40);
ellipse(100, 185, 75, 40);
ellipse(150, 185, 75, 40);
ellipse(197, 185, 78, 37);

fill(0, 0, 0);
ellipse(480, 395, 5, 5);
ellipse(480, 360, 5, 5);
ellipse(480, 325, 5, 5);
ellipse(520, 395, 5, 5);
ellipse(520, 360, 5, 5);
ellipse(520, 325, 5, 5);

fill(125, 125, 120);
rect(400, 580, 200, 40);

}

void draw() {
stroke(240, 10, 50);
fill(250, 70, 0);
ellipse(mouseY, mouseX, 50, 50);}
