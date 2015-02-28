
//ROWAN CASSIUS,CP1, mods 16-17

size(800,600);
background(225);
smooth();
//sun
fill(207,219,49);
ellipse(400,350,700,700);
//ground
fill(98,193,70);
rect(0,400,1000,400);
//feet
strokeWeight(3);
fill(237,196,237);
rect(382,500,47,70);
rect(420,490,47,100);
rect(570,500,47,70);
rect(608,490,47,100);
strokeWeight(2);
line(393,570,393,560);
line(408,570,408,560);
line(581,570,581,560);
line(595,570,595,560);

line(433,590,433,578);
line(448,590,448,578);
line(621,590,621,578);
line(639,590,639,578);
strokeWeight(3);
//tail
noFill();
bezier(710,400,720,430,755,400,750,370);
fill(237,196,237);
//body

ellipse(530,400,356,300);

//ears
triangle(300,390,278,315,335,370);
triangle(400,370,452,307,445,365);
strokeWeight(2);
fill(225);
triangle(303,380,290,335,320,367);
triangle(420,360,444,324,435,370);
fill(237,196,237);
strokeWeight(3);

//head
ellipse(380,430,210,160);
//snout
ellipse(380,455,100,70);
line(365,445,367,463);
line(390,445,390,463);
//eyes
fill(225);
ellipse(350,394,15,15);
ellipse(400,390,15,15);
fill(0);
ellipse(350,394,2,2);
ellipse(400,390,2,2);
fill(237,196,237);
//nostrils
line(365,445,367,463);
line(390,445,390,463);
