
size(600, 600);
background(66, 95, 106);

//face and ears
smooth();
noStroke();
fill(247, 220, 185);
ellipse(300, 200, 200, 250);
ellipse(200, 210, 25, 55);
ellipse(400, 210, 25, 55);

//eyes and mouth
fill(255);
ellipse(250, 200, 40, 30);
ellipse(350, 200, 40, 30);
arc(300, 275, 50, 30, 0, 3.14);

//nose
fill(173, 142, 103);
arc(300, 240, 30, 20, 0, 3.14);

//irises
fill(129, 183, 79);
ellipse(250, 198, 25, 25);
ellipse(350, 198, 25, 25);

//pupils
fill(0);
ellipse(250, 198, 10, 10);
ellipse(350, 198, 10, 10);

//eyes
fill(255);
ellipse(245, 196, 8, 8);
ellipse(345, 196, 8, 8);

//teeth
stroke(200);
line(287, 282, 313, 282);

//hair
noStroke();
fill(85, 47, 12);
beginShape();
vertex(360, 90);
vertex(338, 80);
vertex(320, 75);
vertex(300, 73);
vertex(280, 75);
vertex(260, 80);
vertex(250, 85);
vertex(240, 90);
vertex(230, 100);
vertex(220, 110);
vertex(210, 130);
vertex(200, 160);
vertex(198, 200);
vertex(200, 220);
vertex(202, 235);
vertex(208, 210);
vertex(210, 200);
vertex(220, 170);
vertex(250, 165);
vertex(280, 160);
vertex(300, 155);
vertex(320, 150);
vertex(340, 145);
vertex(360, 135);
vertex(365, 145);
vertex(370, 155);
vertex(375, 165);
vertex(380, 175);
vertex(385, 185);
vertex(390, 200);
vertex(390, 220);
vertex(392, 235);
vertex(395, 220);
vertex(400, 200);
vertex(400, 180);
vertex(395, 150);
vertex(390, 140);
vertex(385, 130);
vertex(380, 120);
vertex(375, 110);
vertex(370, 100);
endShape(CLOSE);

