
size(500, 500);
background(0);
smooth();

stroke(255);
strokeWeight(10);
strokeCap(ROUND);
line(119, 96, 250, 96); //lefteyebrow
line(249, 96, 384, 96); //righteyebrow

// LEFT EYE
int i = 132;
int j = 165;
int x = 87;
int y = 87;

noStroke();
fill(255);
ellipse(i, j, x*.25, y*.25); // 1/4 - aka pupil
noFill();
strokeWeight(2);
stroke(255);
ellipse(i, j, x*.4375, y*.4375); // 7/16 - second ring
ellipse(i, j, x*.625, y*.625); // 5/8 - third ring
ellipse(i, j, x*.8125, y*.8125); // 13/16 - fourth ring
ellipse(i, j, x, y); // 1 - largest ring

//RIGHT EYE

pushMatrix();
translate(240, 0);
noFill();
strokeWeight(2.7);
ellipse(i, j, x*.25, y*.25); // 1/4 - aka pupil

strokeWeight(2);
stroke(255);
ellipse(i, j, x*.4375, y*.4375); // 7/16 - second ring
ellipse(i, j, x*.625, y*.625); // 5/8 - third ring
ellipse(i, j, x*.8125, y*.8125); // 13/16 - fourth ring
ellipse(i, j, x, y); // 1 - largest ring
popMatrix();

//MOUTH
strokeWeight(4);
strokeCap(ROUND);
quad(238, 178, 265, 178, 238, 178, 265, 178);



