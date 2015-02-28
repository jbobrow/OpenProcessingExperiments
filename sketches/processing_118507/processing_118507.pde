
size(800,500);
background(255);

//L
pushMatrix();

fill(0);
rect(20,220,20,70);

fill(255);
rect(20,300,20,20);
rect(20,330,20,20);

fill(#f39a1b);
ellipse(30,370,20,20);

fill(#cbc9c9);
rect(50,360,20,20);
rect(80,360,20,20);

//O linke seite
fill(0);
pushMatrix();
translate(160,220);
rotate(radians(45));
rect(0,0,20,40);
popMatrix();

fill(255);
rect(120,270,20,60);

fill(#f39a1b);
pushMatrix();
translate(130,350);
rotate(radians(-45));
rect(0,0,20,40);
popMatrix();

//O rechte seite
fill(0);
pushMatrix();
translate(180,235);
rotate(radians(-45));
rect(0,0,20,40);
popMatrix();

fill(255);
rect(210,270,20,60);

fill(#cbc9c9);
pushMatrix();
translate(210,335);
rotate(radians(45));
rect(0,0,20,40);
popMatrix();

//R
fill(0);
ellipse(270,230,20,20);

fill(255);
rect(260,250,20,70);

fill(#f39a1b);
rect(260,330,20,20);
rect(260,360,20,20);

fill(0);
ellipse(320,270,60,100);

fill(#cbc9c9);
pushMatrix();
translate(310,340);
rotate(radians(-30));
rect(0,0,20,45);
popMatrix();

//E
fill(0);
rect(370,220,20,80);

fill(#f39a1b);
rect(370,310,20,70);

fill(0);
rect(395,220,40,20);

fill(265);
rect(395,295,40,20);

fill(#cbc9c9);
rect(395,360,40,20);

//N
pushMatrix();

fill(0);
rect(460,220,20,70);

fill(265);
rect(460,300,20,20);
rect(460,330,20,20);

fill(#f39a1b);
ellipse(470,370,20,20);

fill(#f39a1b);
pushMatrix();
translate(485,225);
rotate(radians(-15));
rect(0,0,20,160);
popMatrix();

fill(0);
ellipse(560,230,20,20);

fill(255);
rect(550,250,20,70);

fill(#cbc9c9);
rect(550,330,20,20);
rect(550,360,20,20);

//Z
fill(0);
rect(590,220,65,20);

fill(265);
ellipse(670,230,20,20);

fill(#f39a1b);
pushMatrix();
translate(660,245);
rotate(radians(30));
rect(0,0,20,115);
popMatrix();

fill(#cbc9c9);
ellipse(600,370,20,20);

fill(#cbc9c9);
rect(615,360,65,20);



