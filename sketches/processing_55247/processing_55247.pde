
size(480, 480);
fill(102); //Set fill to grey
fill(0);

line(50, 200, 450, 200);
line(400, 400, 120, 50);
line(245, 400, 245, 50);
line(50, 400, 400, 50);
beginShape(); //back leg left
vertex (215, 205);
vertex (130, 95);
vertex (40, 260);
vertex (130, 125);
vertex (208, 212);
endShape(CLOSE);


beginShape(); //back leg right skinny
vertex(270, 205);
vertex(330, 95);
vertex (460, 260);
vertex (330, 125);
vertex (275, 212);
endShape (CLOSE);

fill(100);
ellipse(240, 220, 70, 70); // top body
ellipse(240, 267, 40, 40); //second body

fill(0);
beginShape(); //right arm
vertex(255, 255);
vertex(390, 220);
vertex(450, 310);
vertex(390, 200);
vertex(250, 240);
endShape(CLOSE);

beginShape (); //left arm
vertex(225, 255);
vertex(110, 220);
vertex(50, 310);
vertex(110, 200);
vertex(235, 240);
endShape(CLOSE);

fill(0, 255, 0);
rect(210, 210, 10, 10); //buttons
fill(0, 0, 255);
ellipse(230, 215, 10, 10);
line (238, 210, 250, 220);
line (238, 220, 250, 210);


fill(255, 0, 0);
triangle (260, 208, 255, 220, 265, 220);

fill(255, 0, 0); //Set fill to red
ellipse(235, 260, 5, 10); //left eye

fill(255, 0, 0); //Set fill to red
ellipse(245, 260, 5, 10); //right eye
fill(255);
triangle(235, 280, 234, 270, 237, 270); //left tooth
triangle(245, 280, 244, 270, 247, 270); //right tooth
line(234, 271, 247, 271); //mouth






