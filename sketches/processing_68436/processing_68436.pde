
size(500, 500);
background(72, 74, 75);
smooth();

fill(255, 255, 0);
strokeWeight(7);
ellipse(250, 250, 400, 400);

noFill();
beginShape();
curveVertex(50,  280);
curveVertex(50,  280);
curveVertex(100, 310);
curveVertex(220, 330);
curveVertex(320, 320);
curveVertex(360, 310);
curveVertex(410, 290);
curveVertex(440, 270);
curveVertex(450, 250);
curveVertex(450, 250);
endShape();

strokeWeight(5);
fill(0, 0, 0);
quad(240, 250, 240, 275, 245, 275, 245, 250);

quad(130, 245, 130, 270, 125, 270, 125, 245);


line(195, 200, 200, 240);
noFill();
beginShape();
curveVertex(150,  220);
curveVertex(150,  220);
curveVertex(130, 170);
curveVertex(115,  150);
curveVertex(85,  190);
curveVertex(80, 210);
curveVertex(80, 210);
endShape();

noFill();
beginShape();
curveVertex(210,  230);
curveVertex(210,  230);
curveVertex(250, 180);
curveVertex(300,  150);
curveVertex(330,  170);
curveVertex(350, 200);
curveVertex(350, 200);
endShape();

fill(255, 255, 255);
beginShape();
vertex(100, 330);
vertex(140, 340);
vertex(200, 350);
vertex(240, 350);
vertex(310, 350);
vertex(340, 340);
vertex(320, 360);
vertex(300, 380);
vertex(280, 390);
vertex(250, 400);
vertex(230, 400);
vertex(190, 390);
vertex(150, 370);
vertex(120, 350);
endShape(CLOSE);

line(255, 400, 255, 370);
line(210, 390, 210, 380);
