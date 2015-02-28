
// size
size(600, 600);
smooth();
background(255);

//FACE
noFill();
stroke(0);
beginShape();
vertex(490,30);
vertex(215,300);
vertex(215,520);
vertex(385,520);
vertex(385,300);
vertex(110,30);
endShape();

//RIGHT EYE
beginShape();
vertex(320,250);
vertex(390,320);
vertex(495,215);
vertex(430,150);
vertex(385,200);
vertex(480,200);
endShape();
fill(0);
noStroke();
triangle(430,150,385,200,480,200);

stroke(0);
noFill();
triangle(385,210,480,210,430,260);

//LEFT EYE
noFill();
stroke(0);
beginShape();
vertex(280,250);
vertex(210,320);
vertex(105,215);
vertex(170,150);
vertex(215,200);
vertex(120,200);
endShape();
fill(0);
noStroke();
triangle(120,200,215,200,170,150);
stroke(0);
noFill();
triangle(120,210,215,210,170,260);

// NOSE
fill(0);
noStroke();
quad(300,295,322,317,300,339,279,317);
noFill();
stroke(0);
quad(300,338,266,304,300,270,334,304);
beginShape();
vertex(220,30);
vertex(315,125);
vertex(245,200);
vertex(245,320);
vertex(300,375);
vertex(355,320);
vertex(355,200);
vertex(285,125);
vertex(380,30);
endShape();

//MOUTH TOP
beginShape();
vertex(300,435);
vertex(245,380);
vertex(245,335);
vertex(300,390);
vertex(355,335);
vertex(355,380);
endShape(CLOSE);

//MOUTH BOTTOM
beginShape();
vertex(300,455);
vertex(245,510);
vertex(355,510);
endShape(CLOSE);




//MOUTH RIGHT
fill(0);
noStroke();
beginShape();
vertex(310,445);
vertex(365,390);
vertex(410,390);
vertex(355,445);
vertex(410,500);
vertex(365,500);
endShape(CLOSE);



//MOUTH LEFT
fill(0);
noStroke();
beginShape();
vertex(290,445);
vertex(235,390);
vertex(190,390);
vertex(245,445);
vertex(190,500);
vertex(235,500);
endShape(CLOSE);

//WHISKERS
noFill();
stroke(0);
strokeWeight(1);
line(365,310,400,345);
line(365,325,400,360);
line(365,340,400,375);

line(200,345,235,310);
line(200,360,235,325);
line(200,375,235,340);





