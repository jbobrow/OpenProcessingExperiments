
size(800,500);
background(255);
//S
translate(40,150);

fill(100);
rect(0,0,40,120);
rect(80,80,40,120);
fill(0);
rect(80,0,40,40);
rect(0,160,40,40);
fill(50);
//ellipse(60,20,35,35);
//ellipse(60,180,35,35);

//punkt
fill(255,0,0);
ellipse(60,100,35,35);

//S quader
pushMatrix();
fill(50);
translate(60,0);
rotate(QUARTER_PI);
rect(2.3,2.3,25,25);
popMatrix();

pushMatrix();
translate(60,160);
rotate(QUARTER_PI);
rect(2.3,2.3,25,25);
popMatrix();

resetMatrix();
//o

translate(165,150);

fill(100);
ellipse(60,140,120,120);

fill(255);
rect(40,120,40,40);

resetMatrix();

//p
translate(290,150);
fill(0);
rect(0,80,120,120);
fill(100);
rect(0,240,40,40);


fill(255);
ellipse(60,140,45,45);

pushMatrix();
fill(50);
translate(20,200);
rotate(QUARTER_PI);
rect(2.3,1.3,25,25);
popMatrix();

resetMatrix();
//h
translate(415,150);

fill(0);
rect(0,0,40,40);

pushMatrix();
fill(50);
translate(20,40);
rotate(QUARTER_PI);
rect(2.3,1.3,25,25);
popMatrix();

fill(100);
rect(0,80,40,120);

rect(80,80,40,120);

fill(255,0,0);
ellipse(60,100,35,35);

resetMatrix();
//i

translate(540,150);

fill(255,0,0);
ellipse(60,60,120,120);

pushMatrix();
fill(50);
translate(60,120);
rotate(QUARTER_PI);
rect(2.3,1.3,25,25);
popMatrix();

fill(0);
rect(40,160,40,40);
fill(255);
ellipse(60,60,40,40);
stroke(0);
resetMatrix();
//e
translate(665,150);
fill(100);
rect(0,0,40,200);
fill(0);
rect(80,0,40,40);
rect(80,160,40,40);

pushMatrix();
fill(50);
translate(60,0);
rotate(QUARTER_PI);
rect(2.3,2.3,25,25);
popMatrix();

pushMatrix();
translate(60,160);
rotate(QUARTER_PI);
rect(2.3,2.3,25,25);
resetMatrix();
popMatrix();


fill(255,0,0);
ellipse(60,100,35,35);
