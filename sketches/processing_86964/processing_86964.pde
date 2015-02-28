
size(500, 500);
background(0);
smooth();

noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //middle hair piece

pushMatrix();
translate(30, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 1 hair piece
popMatrix();

pushMatrix();
translate(60, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 2 hair piece
popMatrix();

pushMatrix();
translate(90, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 3 hair piece
popMatrix();

pushMatrix();
translate(120, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 4 hair piece
popMatrix();

pushMatrix();
translate(150, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 5 hair piece
popMatrix();

pushMatrix();
translate(-30, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 1 hair piece
popMatrix();

pushMatrix();
translate(-60, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 2 hair piece
popMatrix();

pushMatrix();
translate(-90, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 3 hair piece
popMatrix();

pushMatrix();
translate(-120, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 4 hair piece
popMatrix();

pushMatrix();
translate(-150, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 5 hair piece
popMatrix();

noFill();
stroke(255);
strokeWeight(3);
ellipse(259, 407, 111, 64); //mouth

stroke(170, 207, 55);
strokeWeight(6.5);
line(272, 317, 272, 368); //line of snot

noStroke();
fill(170, 207, 55);
ellipse(272, 371, 18, 18); //ball of snot


fill(255);
noStroke();
ellipse(170, 188, 12, 12); //left eye
ellipse(343, 188, 12, 12); //right eye

triangle(256, 178, 290, 317, 222, 317); //nose




