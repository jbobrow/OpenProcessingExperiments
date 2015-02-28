
size(500,500);
background(94,144,226);

translate(250,250);
noStroke();
fill(225,206,169);
ellipse(0,0,250,300);

//right eye
fill(255,255,255);
ellipse(40,-20,50,50);

//left eye
fill(255,255,255);
ellipse(-40,-20,50,50);

//nose
pushMatrix();
translate(0,30);
fill(193,183,154);
triangle(0,-30,-30,20,30,20);
popMatrix();

//eyepupil right
fill(0,0,0);
ellipse(40,-20,30,30);

// eye pupil left
fill(0,0,0);
ellipse(-40,-20,30,30);

//mouth
translate(0,30);
fill(218,21,63);
rect(60,38,-120,30);

//eyebrow left
rectMode(CENTER);
fill(0,0,0);
rect(-40,-85,50,10);

//eyebrow right
rectMode(CENTER);
fill(0,0,0);
rect(40,-85,50,10);

//hat brim
rectMode(CENTER);
rect(0,-120,260,20);

//hat top
rectMode(CENTER);
rect(0,-190,210,140);

//collar left
pushMatrix();
translate(-40,100);
fill(0,0,0);
triangle(-60,-30,-40,20,30,20);
popMatrix();

//collor right
pushMatrix();
translate(40,100);
fill(0,0,0);
triangle(60,-30,30,20,-40,20);
popMatrix();

//ear left
fill(225,206,169);
ellipse(-120,-40,50,80);

//ear right
fill(225,206,169);
ellipse(120,-40,50,80);






