
size(512, 512);
smooth(); 
background(255, 255, 255);

// Facial Structure!
curve(0, 240, 80, 160, 80, 240, 0, 120);
curve(140, 380, 80, 240, 180, 380, 180, 100);
line(180, 380, 310, 280);
line(310, 280, 320, 210);
line(325, 230, 300, 400);
line(200, 365, 197, 400);

// Nose!
beginShape();
curveVertex(140, 230);
curveVertex(140, 230);
curveVertex(125, 300);
curveVertex(139, 303);
curveVertex(139, 303);
endShape();

// Hair!
fill(124, 26, 11);
beginShape();
vertex(80, 160);
vertex(40, 170);
vertex(80, 150);
vertex(45, 140);
vertex(90, 130);
vertex(50, 115);
vertex(100, 117);
vertex(80, 95);
vertex(120, 95);
vertex(100, 75);
vertex(300, 115);
vertex(304, 105);
vertex(308, 115);
vertex(318, 111);
vertex(312, 119);
vertex(340, 160);
vertex(327, 158);
vertex(363, 230);
vertex(320, 210);
vertex(315, 230);
vertex(300, 180);
vertex(270, 220);
vertex(255, 170);
endShape(CLOSE);

// Ear!
fill(255, 255, 255);
bezier(320, 210, 320, 170, 390, 210, 314, 262);

// Eyes!
fill(222, 110, 25);
ellipse(215, 190, 20, 20);
ellipse(101, 190, 18, 22);

// Mouth
noFill();
bezier(133, 330, 143, 360, 220, 335, 220, 330);        
