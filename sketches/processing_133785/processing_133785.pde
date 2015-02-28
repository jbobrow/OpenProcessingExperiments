
//setup
size(800, 400);
background(#398CC1);

//land.rectanlge
fill(#FFC3B2);
rect(0,320, 800, 40);
fill(#ED8D73);
rect(0,340, 800, 60);
fill(#CB684C);
rect(0,380, 800, 80);
fill(#E3B6A9);
rect(0,310, 800, 10);
fill(#FCE0D9);
rect(0,305, 800, 5);
fill(#BFBCBB);
rect(0,300, 800, 5);

//sun_arc
fill(#BFBCBB);
arc(300, 300, 180, 180, 3.14, 6.28);
fill(#EA8807);
arc(300, 300, 170, 170, 3.14, 6.28);
fill(#F0813C);
arc(300, 300, 160, 160, 3.14, 6.28);
fill(#F0AB3C);
arc(300, 300, 150, 150, 3.14, 6.28);
fill(#FFE57C);
arc(300, 300, 120, 120, 3.14, 6.28);
fill(#FFE02C);
arc(300, 300, 80, 80, 3.14, 6.28);
fill(#FAD43D);
arc(300, 300, 50, 50, 3.14, 6.28);

//ringClouds
noStroke();
fill(#90CBFA);
ellipse(100, 60, 190, 20);
fill(#5C9ACB);
ellipse(200, 50, 160, 20);
fill(#356AED);
ellipse(150, 60, 190, 30);
fill(#95B9D6);
ellipse(200, 65, 180, 20);

noStroke();
fill(#E5F2FC);
ellipse(500, 20, 190, 40);
fill(#CBE8FF);
ellipse(500, 10, 160, 40);
fill(#90CBFA);
ellipse(550, 5, 190, 20);


//moon
stroke(#000000);
strokeWeight(1);
fill(#0F97FC);
ellipse(700, 70, 100, 100);
fill(#398CC1);
ellipse(700, 70, 70, 70);
fill(#C3D2DE);
ellipse(700, 70, 90, 90);
fill(#A2D4FA);
ellipse(700, 70, 80, 80);

//arc for halfmoon
fill(#4780AD);
arc(700, 70, 70, 70, HALF_PI, 4.85);
fill(#4780AD);
arc(700, 70, 60, 70, HALF_PI, 4.85);
fill(#4780AD);
arc(700, 70, 40, 70, HALF_PI, 4.85);
fill(#4780AD);
arc(700, 70, 20, 70, HALF_PI, 4.85);


