
//General
size (850,850);
background(0, 0,0);
noStroke();
//Cara
fill (255,203,5);
ellipse (450,450,300,300);
//Ojo1
fill (255,255,255);
arc(495, 425, 35, 70, 0,PI+TWO_PI);
//Relleno Ojo1
fill (0,0,0);
arc(495, 425, 15, 15, 0,PI+TWO_PI);
//Ojo2
fill (255,255,255);
arc(405, 425, 35, 70, 0,PI+TWO_PI);
//Relleno Ojo2
fill (0,0,0);
arc(405, 425, 15, 15, 0,PI+TWO_PI);
//Boca
fill (200,14,14);
arc(450, 520, 120, 100, 0,PI);
//Sonrisa
fill (255,203,5);
arc(450, 500, 150, 60, 0,PI);
//Fosa Nasal1
fill(0,0,0);
arc(440,480,10,15,0,PI+PI);
//Fosa Nasal2
fill(0,0,0);
arc(460,480,10,15,0,PI+PI);
//Dientes Arriba
fill(255,255,255);
arc(480,527,10,15,0,PI);
arc(470,528,10,15,0,PI);
arc(460,529,10,15,0,PI);
arc(450,529,10,15,0,PI);
arc(440,529,10,15,0,PI);
arc(430,528,10,15,0,PI);
arc(420,527,10,15,0,PI);
//Dientes Abajo
arc(450,570,10,15,PI,TWO_PI);
arc(440,570,10,15,PI,TWO_PI);
arc(460,570,10,15,PI,TWO_PI);
//Ceja1
fill(102,100,100);
rect(380,370,50,10);
//Ceja2
fill(102,100,100);
rect(470,370,50,10);
//Bigote
fill(102,100,100);
rect(480,505,1,10);
rect(475,505,1,10);
rect(470,505,1,10);
rect(465,505,1,10);
rect(460,505,1,10);
rect(455,505,1,10);
rect(450,505,1,10);
rect(445,505,1,10);
rect(440,505,1,10); 
rect(435,505,1,10);
rect(430,505,1,10);
rect(425,505,1,10);
rect(420,505,1,10);
//Pie1
fill(191,100,30);
arc(395,641,110,100,PI,TWO_PI);
//Pie2
fill(191,100,30);
arc(507,641,110,100,PI,TWO_PI);
//Brazo1 Comienzo
strokeWeight(1);
stroke(0,0,0);
noFill();
arc(303, 455, 10, 30, 0,PI+TWO_PI);
//Brazo1 Continuación
fill(255,203,5);
rect(239,447,60,15);
//Mano1
ellipse(255, 455, 55, 55);
//Brazo2 Comienzo
stroke(0,0,0);
noFill();
arc(596, 455, 10, 30, 0,PI+TWO_PI);
//Brazo2 Continuación
fill(255,203,5);
rect(600,448,60,15);
//Mano2
ellipse(647, 455, 55, 55);
//Oreja1
strokeWeight(9);
stroke(255,203,5);
fill(0,145,0);
ellipse(375, 300, 55, 55);
//Oreja2
stroke(255,203,5);
fill(0,145,0);
ellipse(525, 300, 55, 55);
//Final!


