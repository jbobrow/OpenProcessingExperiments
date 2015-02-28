
size(500, 500);
background(0);
smooth();

noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //middle hair piece

pushMatrix();
translate(60, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 1 hair piece
popMatrix();

pushMatrix();
translate(120, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 2 hair piece
popMatrix();

pushMatrix();
translate(180, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 3 hair piece
popMatrix();

pushMatrix();
translate(240, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 4 hair piece
popMatrix();

pushMatrix();
translate(300, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //right 5 hair piece
popMatrix();

pushMatrix();
translate(-60, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 1 hair piece
popMatrix();

pushMatrix();
translate(-120, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 2 hair piece
popMatrix();

pushMatrix();
translate(-180, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 3 hair piece
popMatrix();

pushMatrix();
translate(-240, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 4 hair piece
popMatrix();

pushMatrix();
translate(-300, 0);
noFill();
stroke(255);
strokeWeight(.7);
rect(244, 18, 12, 132); //left 5 hair piece
popMatrix();

noFill();
stroke(255);
strokeWeight(3);
ellipse(251, 527, 379, 231); //mouth

stroke(170, 207, 55);
strokeWeight(8);
line(274, 381, 274, 458); //line of snot

noStroke();
fill(170, 207, 55);
ellipse(274, 474, 32, 32); //ball of snot


fill(255);
noStroke();
ellipse(221, 188, 6, 6); //left eye
ellipse(276, 188, 6, 6); //right eye


triangle(249, 164, 302, 382, 196, 382); //nose



