
//Alessandra Carolina Bornancin//
//Ariane Lao Baldykowski//
//25-06-2013//
background(98, 98, 94);
size(800, 600);
//biarticulado visão de cima//
//primeiro vagão//
fill(255, 0, 0);
rect(100, 100, 140, 110, 7);
//primeira sanfona//
fill(152, 137, 137);
rect(240, 100, 5, 110, 7);
rect(245, 100, 5, 110, 7);
rect(250, 100, 5, 110, 7);
rect(255, 100, 5, 110, 7);
rect(260, 100, 5, 110, 7);
//segundo vagão//
fill(255, 0, 0);
rect(265, 100, 140, 110, 7);
//segunda sanfona)//
fill(152, 137, 137);
rect(405, 100, 5, 110, 7);
rect(410, 100, 5, 110, 7);
rect(415, 100, 5, 110, 7);
rect(420, 100, 5, 110, 7);
rect(425, 100, 5, 110, 7);
//terceiro vagão)//
fill(255, 0, 0);
rect(430, 100, 140, 110, 7);
//saídas de emergência//
fill(152, 137, 137);
rectMode(CENTER);
rect(170, 155, 40, 40, 7);
rect(335, 155, 40, 40, 7);
//faróis//
stroke(245, 226, 12);
line(575, 128, 600, 110);
line(575, 128, 600, 128);
line(575, 128, 600, 146);
line(575, 182, 600, 164);
line(575, 182, 600, 182);
line(575, 182, 600, 200);
//tubo//
stroke(0, 0, 0);
line(90, 230, 590, 230);
line(90, 320, 590, 320);
fill(98, 98, 94);
ellipseMode(CORNER);
ellipse(85, 230, 10, 90);
strokeWeight(4);
line(185, 230, 185, 320);
line(285, 230, 285, 320);
line(385, 230, 385, 320);
line(485, 230, 485, 320);
strokeWeight(1);
ellipse(585, 230, 10, 90);
fill(0,0,0);
//escada//
rectMode(CENTER);
rect(80, 275, 10, 60);
rect(70, 275, 10, 40);
rect(60, 275, 10, 20);
rect(600, 275, 10, 60);
rect(610, 275, 10, 40);
rect(620, 275, 10, 20);
strokeWeight(2);
stroke(137,134,134);
line(0,220,800,220);
//plataformas//
stroke(0,0,0);
rectMode(CORNERS);
rect(120,214,150,230);
rect(190,214,220,230);
rect(320,214,350,230);
rect(450,214,480,230);
rect(520,214,550,230);
//calçadas//
strokeWeight(5);
stroke(137,134,134);
line(0,80,800,80);
line(0,340,800,340);
line(0,480,800,480);
fill(4,134,20);
rect(0,0,800,75);
rect(0,485,800,600);
//carro-preto//
strokeWeight(1);
stroke(0,0,0);
fill(0,0,0);
rectMode(CORNERS);
rect(100,380,200,440,6);
fill(31,29,29);
rectMode(CENTER);
rect(150,410,40,50);
stroke(245, 226, 12);
line(205,395,215,390);
line(205,395,215,395);
line(205,395,215,400);
line(205,425,215,420);
line(205,425,215,425);
line(205,425,215,430);
stroke(31,29,29);
rectMode(CORNERS);
rect(95,420,100,425);
fill(196,190,190);
ellipseMode(CENTER);
ellipse(87,423,7,7);
ellipse(77,423,5,5);
//carro-vermelho//
strokeWeight(1);
stroke(252,18,210);
fill(252,18,210);
rectMode(CORNERS);
rect(300,380,400,440,6);
fill(206,12,171);
rectMode(CENTER);
rect(350,410,40,50);
stroke(245, 226, 12);
line(405,395,415,390);
line(405,395,415,395);
line(405,395,415,400);
line(405,425,415,420);
line(405,425,415,425);
line(405,425,415,430);
stroke(31,29,29);
fill(31,29,29);
rectMode(CORNERS);
rect(295,420,300,425);
fill(196,190,190);
ellipseMode(CENTER);
ellipse(287,423,7,7);
ellipse(277,423,5,5);
//carro-azul//
strokeWeight(1);
stroke(7,81,175);
fill(7,81,175);
rectMode(CORNERS);
rect(500,380,600,440,6);
fill(4,61,134);
rectMode(CENTER);
rect(550,410,40,50);
stroke(245, 226, 12);
line(605,395,615,390);
line(605,395,615,395);
line(605,395,615,400);
line(605,425,615,420);
line(605,425,615,425);
line(605,425,615,430);
stroke(31,29,29);
fill(31,29,29);
rectMode(CORNERS);
rect(495,420,500,425);
fill(196,190,190);
ellipseMode(CENTER);
ellipse(487,423,7,7);
ellipse(477,423,5,5);
