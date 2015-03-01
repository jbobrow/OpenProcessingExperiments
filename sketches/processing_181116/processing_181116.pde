
size(210,260);
noStroke();

//background
color from = color(255);
color to = color(90);
color interA = lerpColor(from, to, .10);
color interB = lerpColor(from, to, .20);
color interC = lerpColor(from, to, .30);
color interD = lerpColor(from, to, .40);
color interE = lerpColor(from, to, .50);
color interF = lerpColor(from, to, .60);
color interG = lerpColor(from, to, .70);
color interH = lerpColor(from, to, .80);
color interI = lerpColor(from, to, .90);
fill(from);
rect(0, 0, width, 20);
fill(interA);
rect(0, 20, width, 40);
fill(interB);
rect(0, 40, width, 60);
fill(interC);
rect(0, 60, width, 80);
fill(interD);
rect(0, 80, width, 100);
fill(interE);
rect(0, 100, width, 120);
fill(interF);
rect(0, 120, width, 140);
fill(interG);
rect(0, 140, width, 160);
fill(interH);
rect(0, 160, width, 180);
fill(interI);
rect(0, 180, width, 200);
fill(to);
rect(0, 200, width, 260);

//Penguin
fill(255);
rect(70,30,70,180);

fill(0);
//........................................................Cap centre
rect(80,10,50,10);
rect(70,20,70,10);
//......................................................Ala esquerra
rect(60,30,10,120);
rect(60,210,10,20);
rect(50,90,10,120);
rect(40,110,10,70);
rect(30,130,10,60);
rect(20,150,10,40);
//.........................................................Ala dreta
rect(140,30,10,120);
rect(140,210,10,20);
rect(150,90,10,120);
rect(160,110,10,70);
rect(170,130,10,60);
rect(180,150,10,40);
//..............................................................Peus
rect(80,220,10,10);
rect(90,210,10,10);
rect(110,210,10,10);
rect(120,220,10,10);
//..............................................................Cara
rect(90,30,40,10);
rect(80,40,10,10);
rect(100,40,10,10);
rect(120,40,10,10);
rect(90,50,10,10);
rect(110,50,10,10);
rect(80,60,10,10);
rect(120,60,10,10);
rect(90,70,30,10);

//.......................................................Bec i potes
fill(255,113,3);
rect(100,50,10,10);
rect(90,60,30,10);
rect(50,230,30,10);
rect(130,230,30,10);

//......................................................Grisos clars
fill(150);
//..........................Cara
rect(70,30,20,10);
rect(120,30,20,10);
rect(70,70,10,10);
rect(130,70,10,10);
rect(90,90,10,10);
rect(110,90,10,10);
//..........................Cos
rect(70,110,10,50);
rect(60,150,10,40);
rect(70,190,10,20);
rect(80,200,10,20);
rect(100,200,10,10);
rect(120,200,10,20);
rect(130,190,10,20);
rect(140,150,10,40);
rect(130,110,10,50);
//..........................Punts
rect(130,170,10,10);
rect(120,120,10,10);
rect(120,140,10,10);
rect(120,160,10,10);
rect(120,180,10,10);
rect(70,170,10,10);
rect(80,120,10,10);
rect(80,140,10,10);
rect(80,160,10,10);
rect(80,180,10,10);


//.....................................................Grisos foscos
fill(70);
rect(70,80,10,30);
rect(80,90,10,10);
rect(60,190,10,20);
rect(70,210,10,20);
rect(100,210,10,10);
rect(130,80,10,30);
rect(120,90,10,10);
rect(140,190,10,20);
rect(130,210,10,20);
