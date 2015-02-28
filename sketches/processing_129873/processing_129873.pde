


fill(0,255,50);
quad(108, 61, 36, 60, 89, 30, 50, 200);
fill(50,150,200);
quad(208, 300, 163, 200, 146, 160, 100, 200);

beginShape();
vertex(208,179);
vertex(130,179);
vertex(130, 75);
vertex(208, 50);
vertex(300,100);
endShape();

 
size(500, 450);
background(208, 160, 109);
noStroke();
 
 
fill(240, 227, 174);
triangle(225, 350, 235, 355, 230, 345);
triangle(229, 345, 239, 350, 234, 340);
triangle(232, 340, 242, 345, 237, 335);
triangle(235, 335, 245, 340, 240, 330);
triangle(238, 330, 248, 335, 243, 325);

triangle(275, 350, 265, 355, 270, 345);
triangle(271, 345, 261, 350, 266, 340);
triangle(268, 340, 258, 345, 263, 335);
triangle(265, 335, 255, 340, 260, 330);
triangle(262, 330, 252, 335, 257, 325);
 

fill(255, 108, 65);
beginShape();
curveVertex(100, 200);
curveVertex(150, 100);
curveVertex(175, 125);
curveVertex(250, 100); 
curveVertex(325, 125);
curveVertex(350, 100);
curveVertex(400, 200);

curveVertex(300, 300);
curveVertex(275, 350);
curveVertex(250, 325); 
curveVertex(225, 350);
curveVertex(200, 300);
curveVertex(100, 200);
curveVertex(150, 100);
curveVertex(175, 125);
endShape();
 
fill(61, 135, 69);
beginShape();
curveVertex(250, 125);
curveVertex(275, 140);
curveVertex(340, 175);
curveVertex(250, 225);
curveVertex(160, 175);
curveVertex(225, 140);
curveVertex(250, 125);
curveVertex(275, 140);
curveVertex(340, 175);
endShape();
 

fill(50, 255, 69);
beginShape();
curveVertex(250, 240);
curveVertex(275, 245);
curveVertex(285, 250);
curveVertex(250, 270);
curveVertex(215, 250);
curveVertex(225, 245);
curveVertex(250, 240);
endShape();


fill(35, 90, 60);
triangle(215, 250, 225, 280, 235, 270);
triangle(285, 250, 275, 280, 265, 270);
 

fill(150, 50, 250);
triangle(150, 110, 130, 130, 160, 125);
triangle(350, 110, 370, 130, 340, 125);

fill(30);
textFont(createFont("Times New Roman", 47));
textAlign(CENTER);
text("I Love You....Not!", 250, 65);
