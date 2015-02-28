
size(420,420);
background(75,54,51);

//colores
color marronDark = color(39,23,24);
color marron = color(43,34,29);
color beigeRed = color(123,74,70);
color brightRed = color(232,45,28);
color beigeWhite = color(159,125,113);
color purpleMid = color(30,25,36);
color purpleDark = color(27,24,31);
color beige = color(88,62,37);
color gray = color(95,84,82);
color grayBlue = color(40);
color greenDark = color(37,43,23);
color redDark = color(61,32,28);
color blueDark = color(45,39,41);
color blueMid = color(49,51,64);
color orange = color (136,72,45);
color orangeDark = color (177,75,35);
color orangeLight = color (219,120,53);
color blueLight = color (67,85,135);
color pink = color (181,120,138,92);
color nulo = color (23,22,18);
color verde = color (154,164,112);
color azulado = color (109,127,137);
color crema = color (245,218,129);
color violeta = color (164,113,154);
color naranjito = color (246,93,37);


/********** degradado *************/

for(int x=0;x<430;x+=20){
  for(int y=0;y<430;y+=20){
    fill(75,54,(x+y)*0.12);
    noStroke();
    smooth();
    rect(x,y,20,20);
  }
}

/********** fin degradado *************/


/********** rectangulos esquina superior izquierda ********/

fill(nulo);
rect(45,45,80,78);
strokeWeight(3);
line(45,10,45,150);
line(20,150,70,150);
strokeWeight(4);
line(28,154,35,154);

noStroke();
//primera linea
fill(marronDark);
rect(45,45,14,10);
rect(60,45,5,30);

fill(beigeRed);
rect(66,45,20,10);

fill(beige);
rect(110,45,8,10);

fill(gray);
rect(119,45,5,10);

fill(brightRed);
rect(87,45,4,10);

fill(purpleMid);
rect(105,45,4,10);

fill(purpleDark);
rect(92,45,12,10);


//segunda linea

fill(beige);
rect(92,56,12,19);

fill(gray);
rect(66,56,20,19);

fill(purpleMid);
rect(110,56,8,19);


//tercera linea

fill(beigeRed);
rect(45,76,14,10);
rect(87,76,4,10);

fill(brightRed);
rect(60,76,5,10);

fill(grayBlue);
rect(66,76,20,10);

fill(purpleDark);
rect(92,76,12,10);

fill(greenDark);
rect(105,76,4,10);

fill(brightRed);
rect(110,76,8,10);

fill(beige);
rect(119,76,5,10);


//cuarta linea

fill(purpleMid);
rect(45,88,14,13);

fill(marron);
rect(60,88,5,13);

fill(redDark);
rect(66,88,20,13);
rect(119,88,5,13);

fill(beige);
rect(87,88,4,13);

fill(beigeRed);
rect(92,88,12,13);

fill(greenDark);
rect(110,88,8,13);

//quinta linea

fill(beigeWhite);
rect(45,101,14,10);

fill(purpleMid);
rect(66,101,20,10);

fill(blueDark);
rect(92,101,12,10);

fill(greenDark);
rect(105,101,4,10);

fill(blueMid);
rect(110,101,8,10);

fill(beigeRed);
rect(119,101,5,10);


//sexta linea

fill(redDark);
rect(60,112,5,10);

fill(beigeWhite);
rect(66,112,20,10);

fill(beigeRed);
rect(87,112,4,10);

fill(brightRed);
rect(92,112,12,10);

fill(greenDark);
rect(105,112,4,10);

fill(gray);
rect(110,112,8,10);


//septima linea

fill(purpleMid);
rect(87,123,4,30);


noStroke();
fill(nulo,120);
ellipse(160, 40, 30, 30);


/********** fin rectangulos esquina superior izquierda ********/



/********** curvas central **************/

noFill();
stroke(brightRed);
strokeWeight(6);
arc(180,80,160,160,0,PI/2);

stroke(beigeWhite);
strokeWeight(3);
arc(185,80,100,100,0,PI/2);

noStroke();

/********** fin curvas central **************/




/********** forma lateral **************/

fill(purpleMid,210);
beginShape();
vertex(349, 45);
vertex(349, 270);
vertex(371, 270);
vertex(371, 130);
vertex(349, 45);
endShape(CLOSE);

/********** fin forma lateral **************/



/********** circulo central **************/

fill(marronDark);
rect(145,210,260,5);

noStroke();
fill(pink);
ellipse(186, 276, 170, 170);

noStroke();
fill(blueLight);
ellipse(186, 276, 95, 95);

fill(nulo);
ellipse(186, 276, 90, 90);

/********** fin circulo central **************/



/********** circulo colorines **************/

noStroke();
fill(brightRed,200);
arc(105,215,80,80,0,PI/2);

fill(orangeLight);
arc(100,215,80,80,PI/2,PI);

fill(orangeDark);
arc(100,210,80,80,PI,TWO_PI-PI/2);

fill(blueLight);
arc(105,210,80,80,TWO_PI-PI/2,TWO_PI);

noStroke();

fill(brightRed);
rect(101,155,5,15);
rect(101,255,5,50);

fill(beige);
rect(101,211,4,4);

fill(marronDark);
rect(30,210,30,5);
rect(30,300,8,80);


fill(crema);
rect(349,225,22,35);

fill(verde);
arc(355,210,80,80,PI,PI*2);

fill(azulado);
arc(355,210,80,80,0,PI);


fill(marronDark,130);
rect(145,210,260,5);
rect(203,123,8,288);

fill(orange,120);
rect(203,235,8,83);

/********** fin circulo colorines **************/


/********** curvas *************/

noFill();
stroke(0);
strokeWeight(6);
arc(160,170,160,160,TWO_PI-PI/2.8,TWO_PI);

strokeWeight(2);
arc(195,160,150,150,TWO_PI-PI/3,TWO_PI);

/********** fin curvas *********/



/********** cuadros esquina inferior derecha ***********/

noStroke();
fill(marronDark);
rect(275,260,8,140);


fill(brightRed,200);
rect(260,260,15,25);

fill(crema);
rect(250,260,10,25);

fill(violeta);
rect(230,260,20,25);

fill(blueLight);
rect(283,260,22,25);

fill(marronDark,210);
rect(305,260,22,25);

fill(brightRed);
rect(327,260,22,25);

fill(marronDark,250);
rect(349,260,22,25);

fill(naranjito);
rect(250,225,10,35);

fill(brightRed,130);
rect(260,285,15,25);

fill(marronDark);
rect(250,285,10,25);

fill(crema);
rect(305,285,22,25);

fill(blueLight,120);
rect(327,285,22,25);

fill(beigeWhite);
rect(349,285,22,25);

fill(beige);
rect(283,310,22,28);

fill(brightRed,160);
rect(305,310,22,28);

fill(marronDark,210);
rect(327,310,22,28);

fill(beigeRed);
rect(349,310,22,28);

fill(naranjito);
rect(235,285,15,25);

fill(naranjito,210);
rect(225,338,50,25);

fill(orangeLight);
rect(283,338,22,25);

fill(marronDark,160);
rect(305,338,22,25);

fill(blueLight);
rect(327,338,22,25);

fill(orangeDark);
rect(349,338,22,25);
/********** fin cuadros esquina inferior derecha ***********/



/********** forma lateral **************/

fill(purpleMid,90);
beginShape();
vertex(349, 45);
vertex(349, 270);
vertex(371, 270);
vertex(371, 130);
vertex(349, 45);
endShape(CLOSE);

/********** fin forma lateral **************/

