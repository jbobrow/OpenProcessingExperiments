
size(500,500);

//first ellipse
fill(#D14354);
beginShape();
noStroke();
pushMatrix();
translate(175,250);
rotate(radians(45));
ellipse(0,0,300,220);
popMatrix();
//angle += 0.5;


//second ellipse
beginShape();
noStroke();
pushMatrix();
translate(275,250);
rotate(radians(-47));
ellipse(0,0,300,200);
popMatrix();

//left eye
stroke(1);
strokeWeight(3);
ellipse(170,220,35,75);
//left pupil
fill(0,0,0);
ellipse(170,239,32,32);

//right eye
noFill();
stroke(1);
strokeWeight(3);
ellipse(280,220,35,75);
//right pupil
fill(0,0,0);
ellipse(280,239,32,32);
