
/*
Robby the Robot
by Mark Mandel
*/

size(280, 460);
smooth();
strokeWeight(2);
background(204);
ellipseMode(CORNER);

// right foot
strokeWeight(10);
strokeJoin(ROUND);
fill(82,77,44,255);
rect(76, 393, 55, 50);
noStroke();
fill(82,77,44,255);
ellipse(74, 390, 60, 56);
fill(39,35,32,255);
rect(72, 400, 64, 34);
fill(115,111,108,255);
ellipse(83, 415, 40, 7);

// right leg 1st joint from foot
fill(72,67,54,255);
ellipse(76, 355, 55, 55);
fill(50,45,42,255);
ellipse(81, 355, 45, 43);
fill(255,255,255,15);
ellipse(90, 370, 7, 7);
fill(255,255,255,10);
ellipse(85, 365, 20, 20);

// right leg 2nd joint from foot
fill(72,67,54,255);
ellipse(76, 317, 55, 55);
fill(50,45,42,255);
ellipse(81, 317, 45, 43);
fill(255,255,255,15);
ellipse(90, 332, 7, 7);
fill(255,255,255,10);
ellipse(85, 327, 20, 20);

// right hip
fill(72,67,54,255);
ellipse(81, 280, 60, 50);
fill(31,26,23,255);
ellipse(85, 280, 50, 35);
fill(115,111,108,255);
ellipse(100, 285, 20, 7);

// left foot
stroke(0);
strokeWeight(10);
strokeJoin(ROUND);
fill(82,77,44,255);
rect(151, 393, 55, 50);
noStroke();
fill(82,77,44,255);
ellipse(149, 390, 60, 56);
fill(39,35,32,255);
rect(147, 400, 64, 34);
fill(115,111,108,255);
ellipse(158, 415, 40, 7); 

// left leg 1st joint from foot
fill(72,67,54,255);
ellipse(151, 355, 55, 55);
fill(50,45,42,255);
ellipse(156, 355, 45, 43);
fill(255,255,255,15);
ellipse(165, 370, 7, 7);
fill(255,255,255,10);
ellipse(160, 365, 20, 20);

// left leg 2nd joint from foot
fill(72,67,54,255);
ellipse(151, 317, 55, 55);
fill(50,45,42,255);
ellipse(156, 317, 45, 43);
fill(255,255,255,15);
ellipse(165, 332, 7, 7);
fill(255,255,255,10);
ellipse(160, 327, 20, 20);

// left hip
fill(72,67,54,255);
ellipse(141, 280, 60, 50);
fill(31,26,23,255);
ellipse(145, 280, 50, 35);
fill(115,111,108,255);
ellipse(160, 285, 20, 7);

// pelvis
fill(72,67,54,255);
rect(76, 230, 130, 55);
fill(36,28,26,255);
rect(81, 230, 120, 50);
fill(72,67,54,255);
arc(81, 190, 118, 90, 0, PI);
fill(36,28,26,255);
triangle(81, 235, 201, 235, 141, 260);

// chest
fill(72,67,54,255);
quad(65, 140, 215, 140, 195, 230, 85, 230);
stroke(0);
line(87, 230, 193, 230);
noFill();
stroke(255);
strokeWeight(5);
rect(120, 160, 40, 50);
noStroke();
fill(170,121,42,255);
ellipse(128, 175, 10, 10);
fill(198,189,252255);
ellipse(144, 175, 10, 10);
fill(115,111,108,255);
rect(123, 191, 35, 8);

// head
fill(115,111,108,255);
arc(91, 38, 20, 20,radians(90),radians(300)); //right ear
fill(115,111,108,255);
arc(168, 38, 20, 20,0,HALF_PI); // bottom of left ear
arc(168, 38, 20, 20,radians(240),TWO_PI); // top of left ear
fill(31,26,23,255);
quad(105, 35, 175, 35, 205, 140, 75, 140); //head background
noFill();
stroke(114,110,107,255);
strokeWeight(5);
arc(100, 38, 80, 198,PI,TWO_PI); //face
noStroke();
fill(241,236,255,255);
rect(115, 98, 50, 40); //mouth
noFill();
stroke(132,127,194,132);
strokeWeight(4);
line(115, 103, 165, 103); //teeth
line(115, 110, 165, 110);
line(115, 117, 165, 117);
line(115, 124, 165, 124);
line(115, 131, 165, 131);
line(115, 138, 165, 138);
strokeWeight(2);
stroke(255);
fill(11,28,240,255);
ellipse(120,75,12,12); //right eye
ellipse(147,75,12,12); //left eye
noStroke();
fill(114,38,38,132);
ellipse(128,45,25,25); //third eyes
fill(211,49,34,132);
ellipse(133,50,15,15);
fill(227,110,90,132);
ellipse(138,55,5,5);
noFill();
stroke(132,127,194,132);
strokeWeight(4);
ellipse(70,40,15,15); //right ear ring
line(85,48,90,48);
ellipse(175,15,15,15); //left ear ring
line(181,30,180,40);
noStroke();

// right arm
fill(36,28,26,255);
ellipse(40,150,50,50);
fill(72,67,54,255);
ellipse(37,155,50,50);
fill(36,28,26,255);
ellipse(41,157,50,50);
fill(72,67,54,255);
ellipse(44,160,50,50);
fill(36,28,26,255);
ellipse(46,164,50,50);
fill(72,67,54,255);
beginShape(); //hand
   vertex(60, 175);
   vertex(70, 180);
   vertex(60, 200);
   vertex(55, 195);
endShape(CLOSE);
stroke(0);
strokeWeight(2);
line(55, 183, 70, 190);
noStroke();
beginShape(); 
   vertex(75, 175);
   vertex(85, 180);
   vertex(85, 195);
   vertex(80, 200);
endShape(CLOSE); 

// left arm
fill(36,28,26,255);
ellipse(190,150,50,50);
fill(72,67,54,255);
ellipse(193,155,50,50);
fill(36,28,26,255);
ellipse(189,157,50,50);
fill(72,67,54,255);
ellipse(186,160,50,50);
fill(36,28,26,255);
ellipse(184,164,50,50);
fill(72,67,54,255);
beginShape(); //hand
   vertex(217, 175);
   vertex(207, 180);
   vertex(217, 200);
   vertex(222, 195);
endShape(CLOSE);
stroke(0);
strokeWeight(2);
line(212, 190, 222, 183);
noStroke();
beginShape(); 
   vertex(192, 185);
   vertex(202, 180);
   vertex(202, 205);
   vertex(197, 200);
endShape(CLOSE);

// brain
fill(234,238,237,132);
arc(105, 0, 70, 70,PI, TWO_PI);
noFill();
stroke(164,100,36,132);
strokeWeight(4);
ellipse(120,15,15,15);
ellipse(145,15,15,15);
stroke(230,228,229,200);
ellipse(120,20,15,5);
ellipse(145,20,15,5);

