
//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA

size(400, 400); 
smooth();
background(#360300);



noStroke();
fill(#05F5FF);
triangle(260,130,250,130,255,400);



translate(200,200);
rotate(PI/3.0);

stroke(#FFBC00);
strokeWeight(2);
noFill();
ellipse(00, 0, 260, 260);
//middle line
line(0,-130,0,130);


stroke(#FF7C00);
strokeWeight(1);
arc(0, 0, 200, 200, PI/2+.26, TWO_PI-PI/2);
arc(0, 0, 200, 200, TWO_PI-PI/2+.26, TWO_PI+PI/2);
//top line
line(-25,-96,-25,96);
//bottom line
line(25,-97,25,97);



//reset orientation to original
rotate(-PI/3.0);
translate(-200,-200);

noStroke();
fill(#05F5FF);
triangle(140,130,150,130,145,400);
//triangle(260,130,250,130,255,400);
quad(150,130,150,137,200,165,200,160);
quad(250,130,250,137,200,165,200,160);


//saveFrame("dmdong.hw1.jpg");

