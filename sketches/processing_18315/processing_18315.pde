
size(400, 400);
background(0);
noStroke();
smooth();

//white
fill(255, 255, 255);  
rect(10, 10, 40, 70);
rect(10, 90, 40, 40);

rect(60, 90, 50, 40);
rect(90, 60, 20, 20);
//rect(120, 200, 80, 15);
rect(120, 225, 80, 15);
rect(120, 250, 80, 140);
rect(210, 200, 200, 40);
//rect(210, 250, 80, 80);
rect(210, 340, 80, 50);

rect(300, 300, 140, 40);

//red
fill(180, 0, 0);
rect(10, 140, 100, 100);
rect(300-40, 250, 30, 40);
arc(260, 290, 100, 80, PI, TWO_PI-PI/2);

//blue
fill(0, 0, 180);
rect(60, 60, 20, 20);
rect(120, 10, 80, 180);
rect(300, 350, 50, 60);

fill(0, 0, 0);
beginShape();
vertex(200, 10);
bezierVertex(180, 100, 180, 80, 200, 190);
endShape();

fill(255);
beginShape();
vertex(200+10, 0);
bezierVertex(180+10, 100, 180+10, 80, 200+10, 190);
endShape();
rect(210, 0, 90, 190);

int a = 100;
fill(0, 0, 0);
beginShape();
vertex(200+a, 0);
bezierVertex(180+a, 100, 180+a, 80, 200+a, 190);
endShape();

//yellow
fill(230, 230, 0);
rect(60, 10, 50, 40);
rect(10, 250, 100, 140);
rect(300, 250, 50, 40);
arc(350, 250, 80, 80, 0, PI/2);
rect(300-90, 250+50, 40, 30);

int b = 110;
beginShape();
vertex(200+b, 0);
bezierVertex(180+b, 100, 180+b, 80, 200+b, 190);
endShape();
rect(310, 0, 100, 190);

