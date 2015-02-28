
size(580,710);
background(225,226,220);

fill(210,210,180);//rahmen
rect(573,0,7,900);//rechts
rect(0,0,900,7);//oben
rect(0,0,7,900);//linke
rect(0,703,900,7);//unten
noStroke();
//4pixel zwischen KÃ¤stchen
//20 x 55 px
fill(150,165,180);
//Buchstabe D
//rect (mouseX, mouseY, 19,52);
rect(55,46,55,20); //linksoben
rect(114,46,20,55);//rechtsoben
rect(55,70,20,55); //links
rect(79,105,55,20); //unten
//Buchstabe E
rect(140,46,70,20); //oben
rect(140,70,20,55);//links
rect(164,105,45,20); //unten
fill(24,37,53); //dunkel
rect(165,75,20,20);//mittelstrich
fill(150,165,180); //hell
//Buchstabe S
rect(240,46,20,50);//links
rect(264,46,50,20);//oben
rect(240,107,48,20);//unten
fill(25,40,50); //dunkel
rect(266,78,20,20);//mitte
fill(150,165,180); //hellb
rect(292,80,20,47);//rechts
//Buchstabe T
rect(320,46,51,20);//oben
rect(335,70,20,57);//unten
//Buchstabe Y
rect(382,46,20,50);//links
fill(150,165,180); //hellb
rect(380,107,45,20);//unten
rect(429,45,20,82);//rechts
fill(25,40,50); //dunkelblau
rect(405,76,20,20);//mitte
//Buchstabe L
fill(150,165,180); //hellb
rect(459,46,20,56);//links
rect(459,107,60,20);//unten
rect(498,46,20,20);//punkt

//Eckenobenvonlinks
fill(24,37,53); //dunkel
rect(55,160,54,262);//links
fill(150,165,180); //hell
rect(114,160,100,110);//rechts erstes
rect(219,160,90,80);//rechtszweites
fill(25,40,55); //dunkel
rect(314,160,205,40);
fill(235,185,35); //yellowteil
rect(235,246,69,20);

fill(153,165,177); //hell
rect(447,205,13,100);//linksnachrechts
rect(466,205,13,100);
rect(486,205,13,100);
rect(506,205,13,100);//rechts
fill(150,165,180); //hell links unter erster reihe
rect(114,275,65,110);
fill(235,185,35); //Gelb
rect(235,246,69,20);//oben
rect(239,467,69,20);//vonuntenhierherwegen farbe

fill(50,110,170); //freaky blue
rect(200,333,23,52);//links
rect(350,343,25,55);//rechts
fill(157,16,6); //rotMITTE
rect(266,342,40,35);
fill(25,40,55); //dunkel
rect(55,427,75,110);
//Strichgitterunten
fill(153,165,177); //hell
rect(55,550,118,15);
rect(55,573,118,15);
rect(55,596,118,15);
rect(55,619,118,15);

fill(25,40,55); //dunkel
rect(460,311,60,255);//rechtslanges
rect(189,573,330,61);//untenlanges

fill(153,165,177); //hell
rect(225,498,99,68);//1links
rect(331,477,118,89);//2mitte
rect(385,343,64,127);//3oben
textSize(7);
text("COMRIGIG V.HUSZAR", 500, 650);
fill(30,30,50);
