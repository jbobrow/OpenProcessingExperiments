
//meagan holloman
//my great sketch
size(300,300);
background(254,254,254);
translate(150,150);
//hair2
pushMatrix();
translate(-60,-50);
fill(0,0,0);
rect(0,0,125,150);
popMatrix();
//face
noStroke();
fill(201,185,152);
ellipse(0,0,100,150);
//left eye
fill(255,255,255);
ellipse(25,-25,15,15);
//left pupil
fill(0,0,0);
ellipse(25,-25,6,6);
//nose
pushMatrix();
fill(255,255,255);
translate(0,0);
triangle(0,-5,-5,7,7,7);
popMatrix();
//right eye
fill(255,255,255);
ellipse(-25,-25,15,15);
//right pupil
fill(0,0,0);
ellipse(-25,-25,6,6);
//mouth
pushMatrix();
rotate(PI/-6.0);
translate(-15,20);
fill(255,255,255);
arc(10,10,40,40,0,PI+QUARTER_PI,OPEN); 
popMatrix();
//hair
translate(-60,-95);
fill(0,0,0);
rect(0,0,126,50);




