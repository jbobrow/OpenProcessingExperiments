
size(350,350);
background(120,70,195);






//~~~HEAD~~~
translate(175,175);
noStroke();

//SHIRT
fill(84,84,84);
ellipse(0,130,220,30);
rect(-110,130, 220, 50, 5);
triangle(-105,175,-109,127,-125,175);
triangle(105,175,109,127,125,175);

//NECK
fill(234,181,255);
rect(-30,70, 60, 50,5);
ellipse(0,118,60,20);
fill(194,132,219);
rect(-30,70, 60, 23,5);

//ACTUAL HEAD


fill(234,181,255);
rect(-70,-50,140,130,5,5,50,50);

//SIDEBURNS
fill(159,255,133);
rect(62,-30,8,20);
rect(-70,-30,8,20);
triangle(62,-10,60,-5,70,-13);

//HAIR
fill(159,255,133);
rect(-75, -100, 150, 70, 100, 100, 2, 2);
fill(129,209,107);
ellipse(0,-102,60,40);
fill(159,255,133);
ellipse(0,-110,60,55);

//CHIN
fill(194,132,219);
ellipse(0,90,55,20);
fill(234,181,255);
ellipse(0,70, 80, 40);

//HAIR PART
fill(234,181,255);
triangle(20,-29,36,-57,42,-29);



//~~~EYES~~~

fill(255,255,255);
ellipse(30,-15,30,35);
ellipse(-30,-15,30,35);
fill(0,0,0);
ellipse(30,-15,23,28);
ellipse(-30,-15,23,28);
fill(255,255,255);
ellipse(34,-20,7,7);
ellipse(-26,-20,7,7);

//EYELASHES
fill(0,0,0);
stroke(2);
strokeWeight(2);
line(45,-23,50,-25);
line(46,-17,50,-19);
line(-45,-23,-50,-25);
line(-46,-17,-50,-19);

//EYEBROWS
noFill();
curve(5,-50, 15,-35, 45,-35, 105,25);
curve(-5,-50, -15,-35, -45,-35, -105,25);

noStroke();


//MOUTH
fill(0,0,0);
rect(-30,48,60,3,5);
fill(255,255,255);
triangle(-25,51,-19,51,-22,60);
triangle(25,51,19,51,22,60);



//NOSE
fill(196,80,242);

pushMatrix();
translate(0, 20);

triangle(0,-40,-10,10,10,10);

fill(158,68,194);
ellipse(0,5,25,20);

fill(255,255,255);
ellipse(-8,0,4,3);
popMatrix();



//RIGHT EAR
noStroke();
fill(234,181,255);
pushMatrix();
translate(10, -30);
quad(38, 31, 86, 0, 69, 63, 10, 76);
fill(193,124,217);
triangle(59, 31, 71, 20, 59, 58);



//EARRING RIGHT
fill(105,255,220);
ellipse(63,58,7,7);
ellipse(68,52,5,5);


popMatrix();

fill(159,255,133);
triangle(62,-10,62,10,70,-13);

//LEFT EAR
fill(234,181,255);
pushMatrix();
translate(-10, -30);
quad(-38, 31, -86, 0, -69, 63, -10, 76);
fill(193,124,217);
triangle(-59, 31, -71, 20, -59, 58);

//EARRING LEFT
fill(105,255,220);
ellipse(-63,58,7,7);
ellipse(-68,52,5,5);
popMatrix();

fill(159,255,133);
triangle(-62,-10,-62,10,-70,-13);

//FRECKLES
fill(170,109,194);
ellipse(-20,20,2.5,2.5);
ellipse(-25,25,2.5,2.5);
ellipse(-30,22,2.5,2.5);
ellipse(-35,27,2.5,2.5);
ellipse(-40,20,2.5,2.5);
ellipse(-34,16,2.5,2.5);
ellipse(-26,17,2.5,2.5);
ellipse(-20,14,2.5,2.5);
ellipse(-13,13,2.5,2.5);
ellipse(-15,18,2.5,2.5);
ellipse(-6,7,2.5,2.5);
ellipse(-8,13,2.5,2.5);
ellipse(-3,10,2.5,2.5);
ellipse(0,7,2.5,2.5);
ellipse(20,20,2.5,2.5);
ellipse(25,25,2.5,2.5);
ellipse(30,22,2.5,2.5);
ellipse(35,27,2.5,2.5);
ellipse(40,20,2.5,2.5);
ellipse(34,16,2.5,2.5);
ellipse(26,17,2.5,2.5);
ellipse(20,14,2.5,2.5);
ellipse(13,13,2.5,2.5);
ellipse(15,18,2.5,2.5);
ellipse(6,7,2.5,2.5);
ellipse(8,13,2.5,2.5);
ellipse(3,10,2.5,2.5);
ellipse(-13,8,2.5,2.5);
ellipse(-27,12,2.5,2.5);
ellipse(-20,8,2.5,2.5);
ellipse(-37,10,2.5,2.5);
ellipse(-43,15,2.5,2.5);
ellipse(13,8,2.5,2.5);
ellipse(27,12,2.5,2.5);
ellipse(20,8,2.5,2.5);
ellipse(37,10,2.5,2.5);
ellipse(43,15,2.5,2.5);
ellipse(44,27,2.5,2.5);
ellipse(-44,27,2.5,2.5);


