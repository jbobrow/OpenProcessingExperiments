
size(500, 500);
background(0);
smooth();

pushMatrix();
stroke(255);
strokeWeight(10);
strokeCap(ROUND);
pushMatrix();
translate(0, -25);
rotate(radians(8)); //NEW
line(119, 16, 147, 16); 
popMatrix();
pushMatrix();
rotate(radians(-8)); //NEW
line(356, 66, 384, 66);

popMatrix();

// LEFT EYE
pushMatrix();
int i = 132;
int j = 165;
int x = 87;
int y = 87;

scale(2); // NEW
translate(-66, -115); // NEW
noStroke();
fill(255);
ellipse(i, j, x*.25, y*.25); // 1/4 - aka pupil
noFill();
strokeWeight(2/2); // NEW: /2
stroke(255);
ellipse(i, j, x*.4375, y*.4375); // 7/16 - second ring
ellipse(i, j, x*.625, y*.625); // 5/8 - third ring
ellipse(i, j, x*.8125, y*.8125); // 13/16 - fourth ring
ellipse(i, j, x, y); // 1 - largest ring
popMatrix();

//mid
//pushMatrix();
//scale(1.5); // NEW
//translate(-x*.5,-y); // NEW
//noStroke();
//fill(255);
//ellipse(i, j, x*.25, y*.25); // 1/4 - aka pupil
//noFill();
//strokeWeight(2/1.5); // NEW: /1.5
//stroke(255);
//ellipse(i, j, x*.4375, y*.4375); // 7/16 - second ring
//ellipse(i, j, x*.625, y*.625); // 5/8 - third ring
//ellipse(i, j, x*.8125, y*.8125); // 13/16 - fourth ring
//ellipse(i, j, x, y); // 1 - largest ring
//popMatrix();

//RIGHT EYE

pushMatrix();
translate(310, 20); //NEW - old: translate(240, 0)
scale(.5); // NEW

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
translate(15, 0); // NEW
strokeWeight(4);
strokeCap(ROUND);
quad(238, 178, 314, 178, 314, 480, 238, 480); //old: (238, 178, 295, 178, 295, 310, 238, 310);



