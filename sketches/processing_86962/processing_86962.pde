
size(500, 500);
background(106, 203, 212);
smooth();

//body
pushMatrix();
fill(0);
noStroke();
beginShape();
translate(-width, -height);
scale(4);
vertex(248, 14);
bezierVertex(240, 76, 162, 124, 71, 120);
bezierVertex(-20, 116, 171, 396, 229, 458);
bezierVertex(287, 520, 525, 104, 425, 113);
bezierVertex(325, 122, 250, 75, 249, 14);
endShape();
popMatrix();

pushMatrix();
stroke(255);
noFill();
strokeWeight(5);
translate(0, -140);
beginShape();
vertex(128, 145);
bezierVertex(128, 145, 153, 137, 153, 89); //left eyebrow
bezierVertex(153, 41, 153, 145, 179, 146); 
endShape();
popMatrix();

fill(255);
ellipse(153, 145, 315, 315); //left eye
ellipse(335, 145, 315, 315); //right eye

pushMatrix();
translate(0, -100);
strokeWeight(5); 
line (315.0, 145, 356.0, 145); //right eyebrow
popMatrix();

noFill();
strokeWeight(4);
quad(223, 330, 262, 330, 262, 570, 223, 570); //mouth

pushMatrix();
fill(106, 203, 212);
noStroke();
translate(-300, -100);
scale(2);
beginShape(); //teardrop 2
vertex(338, 190);
bezierVertex(338, 190.0, 284, 242, 318, 257);
bezierVertex(352, 272, 357, 227, 338, 190);
endShape();
popMatrix();



