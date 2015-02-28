
size(650, 350);
background(133, 25, 25);

fill(200);
rect(0, 250, 650, 350);

strokeWeight(4);
line(0, 250, 650, 250);

smooth( );
strokeWeight(2);
strokeJoin(ROUND);
fill(223, 186, 122);

//head and body
beginShape( );
curveVertex(500, 130); // the first control point
curveVertex(500, 130); // is also the start point of curve
curveVertex(450, 125);
curveVertex(300, 130);
curveVertex(280, 100);
curveVertex(260, 110);
curveVertex(190, 110);
curveVertex(170, 100);
curveVertex(150, 200);
curveVertex(270, 200); // the last point of curve
curveVertex(270, 200); // is also the last control point
vertex(270, 200);
vertex(270, 280);
vertex(290, 280);
vertex(290, 215);
vertex(300, 215);
vertex(300, 280);
vertex(320, 280);
vertex(320, 210);
curveVertex(320, 210); 
curveVertex(320, 210);
curveVertex(380, 205);
curveVertex(450, 210);
curveVertex(450, 210);
vertex(450, 280);
vertex(470, 280);
vertex(470, 210);
vertex(480, 210);
vertex(480, 280);
vertex(500, 280);
curveVertex(500, 280);
curveVertex(500, 280);
curveVertex(505, 200);
curveVertex(510, 160);
curveVertex(530, 100);
curveVertex(510, 80);
curveVertex(550, 50);
curveVertex(545, 30);
curveVertex(490, 85);
curveVertex(520, 100);
curveVertex(500, 130);
curveVertex(500, 130);
endShape( );

//eyes
fill(0);
ellipse(160, 150, 6, 6);
ellipse(250, 150, 6, 6);

//nose
strokeWeight(1);
fill(255, 197, 217);
ellipse(200, 170, 4, 2);

//mouth
noFill();
beginShape();
curveVertex(170, 190); 
curveVertex(170, 190); 
curveVertex(190, 195);
curveVertex(205, 190);
curveVertex(230, 195);
curveVertex(245, 190); 
curveVertex(245, 190); 
endShape();

//whiskers
line(250, 180, 260, 185);
line(250, 175, 260, 173);
line(250, 170, 260, 165);

line(155, 185, 165, 180);
line(155, 173, 165, 175);
line(155, 165, 165, 170);
