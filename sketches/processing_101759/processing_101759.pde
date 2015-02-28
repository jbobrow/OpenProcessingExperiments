
//CLEUSA E WINDSON
//CIRCUITO DE CAMINHADA
//24/06/20013

size(1200,800);

stroke(255);
strokeWeight(20);
line(100,200,200,400);
line(100,200,400,50);
noFill();
arc(477, 116, 200, 200, PI+QUARTER_PI, TWO_PI);
line(600,400,577,120);
line(577,120,1150,120);
line(800,400,865,120);
line(1150,120,1000,400);

//LINHA CENTRAL
line(200,400,1000,400);

line(150,550,200,400);
line(150,550,150,700);
line(150,700,1100,700);
line(1000,400,1100,700);

//FEZ UM CIRCULO
//arc(500, 150, 200, 200, 0, TWO_PI);

stroke(0);
strokeWeight(1);

//line(100,200,400,50);
ellipseMode(CENTER);
ellipse(100,200,20,20);
ellipseMode(CENTER);
ellipse(400,50,20,20);

//line(577,120,1150,120);
ellipseMode(CENTER);
ellipse(577,120,20,20);
ellipseMode(CENTER);
ellipse(865,120,20,20);
ellipseMode(CENTER);
ellipse(1150,120,20,20);

//line(200,400,1000,400);
ellipseMode(CENTER);
ellipse(200,400,20,20);
ellipseMode(CENTER);
ellipse(400,400,20,20);
ellipseMode(CENTER);
ellipse(600,400,20,20);
ellipseMode(CENTER);
ellipse(800,400,20,20);
ellipseMode(CENTER);
ellipse(1000,400,20,20);

//line(150,700,1100,700);
ellipseMode(CENTER);
ellipse(150,550,20,20);

//line(1000,400,1100,700);
ellipseMode(CENTER);
ellipse(150,700,20,20);
ellipseMode(CENTER);
ellipse(387,700,20,20);
ellipseMode(CENTER);
ellipse(625,700,20,20);
ellipseMode(CENTER);
ellipse(862,700,20,20);
ellipseMode(CENTER);
ellipse(1100,700,20,20);

//PRAÇA
fill(0,255,0);
rect(300,200,150,100,7);
fill(0,0,0);
text("PRAÇA",355,255);

//PISCINA
fill(159,234,242);
rect(300,450,650,200);
fill(0,0,0);
text("P I S C I N A",560,560);
