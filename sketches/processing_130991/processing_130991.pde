
size(300,300);
background(149,143,143);
translate(150,150);
rectMode(CENTER);
fill(90, 170, 200);
noStroke();

//FACE
fill(211,171,122);
ellipse(0,0,250,250);

//EARS
triangle(-130,-130,-10,-90,-90,-10);
triangle(10,-90,90,-10,130,-130);


//EYES
fill(255,255,255);
ellipse(-40,-45,60,60);
ellipse(40,-45,60,60);
fill(135,252,251);
ellipse(-40,-45,40,40);
ellipse(40,-45,40,40);
fill(0);
ellipse(-40,-45,15,15);
ellipse(40,-45,15,15);

//MOUTH
strokeWeight(3);
stroke(0); 
line(0,0,0,65);
noFill();
arc(-25,65,50,50,0,PI);
arc(25,65,50,50,0,PI);

//NOSE
strokeWeight(3);
stroke(0); 
line(-75,0,75,0);
line(-75,15,75,15);
noStroke();
fill(245,173,220);
triangle(0,-10,-25,25,25,25);

//DOTS
fill(0);
//LEFT
ellipse(-100,-5,5,5);
ellipse(-90,-5,5,5);
ellipse(-95,5,5,5);
//RIGHT
ellipse(100,-5,5,5);
ellipse(90,-5,5,5);
ellipse(95,5,5,5);



