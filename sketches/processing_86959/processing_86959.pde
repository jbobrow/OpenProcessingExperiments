
size(500, 500);
background(106, 203, 212);
smooth();

//blob
fill(0);
noStroke();
beginShape();
vertex(248.0, 14.0);
bezierVertex(240.0, 76.0, 162.01819, 123.92284, 71.0, 120.0);
bezierVertex(-20.018227, 116.07713, 171.0, 396.0, 229.0, 458.0);
bezierVertex(287.0, 520.0, 525.0, 104.0, 425.0, 113.0);
bezierVertex(325.0, 122.0, 250.0, 75.0, 249.0, 14.0);
endShape();

stroke(255);
strokeWeight(5);
beginShape();
vertex(128, 145);
bezierVertex(128, 145, 153, 137, 153, 89); //left eyebrow
bezierVertex(153, 41, 153, 145, 179, 146);
endShape();

fill(106, 203, 212); //teardrop
noStroke();
beginShape();
vertex(337, 190);
bezierVertex(337, 190, 321, 206, 331, 211);
bezierVertex(341, 216, 343, 202, 337, 190);
endShape();

//beginShape(); //teardrop 2
//vertex(337.7249, 190.0);
//bezierVertex(337.7249, 190.0, 283.76288, 242.15004, 318.10226, 257.04993);
//bezierVertex(352.44177, 271.9498, 357.34753, 227.24982, 337.7249, 190.0);
//endShape();

stroke(255); //left eye
strokeWeight(2);
noFill();
ellipse(153, 175, 17, 17);

stroke(255); //right eye
strokeWeight(2);
noFill();
ellipse(335, 175, 17, 17);

strokeWeight(5); //right eyebrow
line (315.0, 145, 356.0, 145);

noFill();
strokeWeight(2);
quad(223, 210, 242, 210, 242, 214, 223, 214);


