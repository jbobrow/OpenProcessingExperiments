
smooth();
size(500,500);

//claws
fill(255, 0, 183);
ellipse(112, 342, 10, 5);
ellipse(110, 350, 10, 5);
ellipse(112, 358, 10, 5);

ellipse(388, 342, 10, 5);
ellipse(390, 350, 10, 5);
ellipse(388, 358, 10, 5);

ellipse(124, 472, 10, 5);
ellipse(124, 478, 10, 5);

ellipse(376, 472, 10, 5);
ellipse(376, 478, 10, 5);


//hands
fill(99, 18, 180);
for (int i=135; i<500; i+=230){
  ellipse(i, 350, 50, 25);
}

//ears
fill(99, 18, 180);
triangle(15, 215, 70, 175, 70, 225);
triangle(485, 215, 430, 175, 430, 225);

//head and body/*
fill(99, 18, 180);
ellipse(250, 350, 200, 250);
ellipse(250, 200, 375, 200);

//feet/*
fill(99, 18, 180);
for (int e=175; e<400; e+=150){
  ellipse(e, 475, 100, 25);
}

//eye
fill(255, 255, 255);
ellipse(77, 125, 50, 50);
ellipse(125, 100, 50, 50);
ellipse(173, 83, 50, 50);
ellipse(225, 75, 50, 50);
ellipse(275, 75, 50, 50);
ellipse(325, 83, 50, 50);
ellipse(375, 99, 50, 50);
ellipse(420, 125, 50, 50);

//eyeBall(BLACK)
fill(0, 0, 0);
ellipse(81, 136, 25, 25);
ellipse(130, 111, 25, 25);
ellipse(177, 95, 25, 25);
ellipse(228, 87, 25, 25);
ellipse(275, 88, 25, 25);
ellipse(320, 94, 25, 25);
ellipse(370, 110, 25, 25);
ellipse(415, 137, 25, 25);

//eyeLashes(FACING_LEFT)
noFill();
arc(52, 100, 40, 40, PI/2, PI);
arc(58, 90, 40, 40, PI/2, PI);

arc(100, 75, 40, 40, PI/2, PI);
arc(107, 65, 40, 40, PI/2, PI);

arc(150, 50, 40, 40, PI/2, PI);
arc(160, 40, 40, 40, PI/2, PI);

arc(206, 40, 40, 40, PI/2, PI);
arc(220, 30, 40, 40, PI/2, PI);

//eyeLashes(FACING_RIGHT)
noFill();
arc(273, 30, 40, 40, 0, PI/2);
arc(289, 35, 40, 40, 0, PI/2);

arc(327, 38, 40, 40, 0, PI/2);
arc(340, 42, 40, 40, 0, PI/2);

arc(379, 53, 40, 40, 0, PI/2);
arc(390, 58, 40, 40, 0, PI/2);

arc(430, 81, 40, 40, 0, PI/2);
arc(440, 90, 40, 40, 0, PI/2);

//giantEye
fill(140, 227, 252);
ellipse(250, 200, 250, 150);
fill(255, 255, 255);
ellipse(250, 200, 150, 150);

//giantEyeBall
fill(0, 0, 0);
ellipse(250, 237, 75, 75);



//tail
triangle(465, 254, 475, 315, 420, 280);
noFill();
bezier(450, 300, 350, 350, 430, 450, 341, 400);



int score = 0;
println(score);


