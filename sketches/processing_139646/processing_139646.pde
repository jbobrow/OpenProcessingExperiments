
// sam groves
// sketch yo

size(300,300);
background(74, 138, 231);

translate(150,150);
noStroke();

//hair
fill(198,30,8);
ellipse(-70,0,40,200);
ellipse(70,0,40,200);

//face
fill(229,199,156);
ellipse(0,0,150,200);

//bangs
fill(198,30,8);
ellipse(0,-90,160,60);
fill(229,199,156);
triangle(0,-60,10,-60,-10,-80);

//left ear
fill(229,199,156);
ellipse(-70,10,50,50);
//left earring

//right ear
fill(229,199,156);
ellipse(70,10,50,50);

//right eye
fill(255,255,255);
ellipse(30,-25,30,25);
fill(0,0,0);
ellipse(25,-19,15,15);

pushMatrix();
translate(0,15);
fill(200,167,119);
triangle(0,-25,-10,10,10,10);
popMatrix();

//left eye
fill(255,255,255);
ellipse(-30,-25,30,25);
fill(0,0,0);
ellipse(-25,-20,15,15);

//lips
fill(180,33,13);
ellipse(0,50,50,30);

//left eyebrow
fill(100,19,9);
triangle(10,-50,50,-45,20,-60);

//right eyebrow
fill(100,19,9);
triangle(-50,-50,-10,-50,-20,-60);





