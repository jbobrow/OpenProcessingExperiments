
void setup(){
  //Tamany del sketch i color del fons
  size(600,600);
  background(#00BAFF);
}

void draw(){
  //La cara representa un home de mitjana edat sorprès, però en sentit negatiu
  //Color de la cara i paràmetres de la cara
  fill(#C98A98);
  stroke(#000000);
  strokeWeight(1);
  //Orelles (abans de la cara perquè quedin darrera), orella dreta
  bezier(515,205,570,180,570,350,515,335);
  curve(340,220,525,215,525,315,320,320);
  curve(550,340,525,305,540,290,600,350);
  //Orella esquerra
  bezier(85,205,30,180,30,350,85,335);
  curve(260,220,75,215,75,315,240,320);
  curve(50,340,75,305,60,290,0,350);
  //Forma de la cara
  beginShape();
    vertex(300,55);
    vertex(200,60);
    vertex(160,70);
    vertex(140,80);
    vertex(120,100);
    vertex(100,130);
    vertex(85,205);
    vertex(80,270);
    vertex(85,335);
    vertex(100,410);
    vertex(105,420);
    vertex(115,430);
    vertex(160,450);
    vertex(220,490);
    vertex(245,500);
    vertex(255,510);
    vertex(275,518);
    vertex(325,518);
    vertex(345,510);
    vertex(355,500);
    vertex(380,490);
    vertex(440,450);
    vertex(485,430);
    vertex(495,420);
    vertex(500,410);
    vertex(515,335);
    vertex(520,270);
    vertex(515,205);
    vertex(500,130);
    vertex(480,100);
    vertex(460,80);
    vertex(440,70);
    vertex(400,60);
    vertex(300,55);
  endShape();
  //Nas, envà nasal
  beginShape();
    vertex(268,210);
    vertex(275,225);
    vertex(278,240);
    vertex(278,280);
    vertex(272,295);
    vertex(265,305);
    vertex(260,315);
    vertex(260,323);
    vertex(270,330);    
  endShape();
  beginShape();
    vertex(332,210);
    vertex(325,225);
    vertex(322,240);
    vertex(322,280);
    vertex(328,295);
    vertex(335,305);
    vertex(340,315);
    vertex(340,323);
    vertex(330,330);    
  endShape();
  //Nas, fosses nasals
  fill(#000000);
  arc(280,330,20,20,PI,TWO_PI);
  arc(320,330,20,20,PI,TWO_PI);
  //Nas, punta
  noFill();
  curve(280,300,290,330,310,330,320,300);
  //Boca, contorn exterior llavi
  fill(#A4466C);
  beginShape();
    vertex(305,370);
    vertex(310,367);
    vertex(320,372);
    vertex(330,375);
    vertex(340,380);
    vertex(355,388);
    vertex(370,400);
    vertex(385,415);
    vertex(392,420);
    vertex(385,425);
    vertex(370,440);
    vertex(330,454);
    vertex(315,460);
    vertex(285,460);
    vertex(270,454);
    vertex(230,440);
    vertex(215,425);
    vertex(208,420);
    vertex(215,415);
    vertex(230,400);
    vertex(245,388);
    vertex(260,380);
    vertex(270,375);
    vertex(280,372);
    vertex(290,367);
    vertex(295,370);
    vertex(305,370);    
  endShape();
  //Boca, contorn interior llavi
  fill(#4C1720);
  beginShape();
    vertex(388,420);
    vertex(365,425);
    vertex(330,432);
    vertex(308,435);
    vertex(292,435);
    vertex(270,432);
    vertex(235,425);
    vertex(212,420);
    vertex(235,410);
    vertex(270,395);
    vertex(292,390);
    vertex(308,390);
    vertex(330,395);
    vertex(365,410);
    vertex(388,420);
  endShape();
  //Boca, llengua
  fill(#6E242C);
  curve(200,460,212,420,388,420,400,460);
  //Boca, dents, primers molars
  fill(#E2E2FF);
  triangle(365,425,340,427,340,430);
  triangle(235,425,260,427,260,430);
  //Boca, dents, ullals
  beginShape();
    vertex(339,430);
    vertex(337,427);
    vertex(334,424);
    vertex(328,425);
    vertex(323,428);
    vertex(322,432);
  endShape();
  beginShape();
    vertex(261,430);
    vertex(263,427);
    vertex(266,424);
    vertex(272,425);
    vertex(277,428);
    vertex(278,432);
  endShape();
  //Boca, dents, centrals inferiors
  quad(279,433,280,429,289,430,289,435);
  quad(321,433,320,429,311,430,311,435);
  quad(310,435,310,429,300,429,300,435);
  quad(290,435,290,429,300,429,300,435);
  //Boca, dents, paletes
  triangle(280,393,299,393,299,390);
  triangle(320,393,301,393,301,390);
  //Ulls, còrnia esquerra
  fill(#FFFFFF);
  ellipse(210,230,90,40);
  //Ulls, còrnia dreta
  ellipse(390,230,90,40);
  //Ulls, iris esquerre
  fill(#00B45B);
  ellipse(210,230,40,40);
  //Ulls, iris dreta
  ellipse(390,230,40,40);
  //Ulls, pupil·la esquerra
  fill(#000000);
  ellipse(210,230,20,20);
  //Ulls, pupil·la dreta
  ellipse(390,230,20,20);
  //Cella esquerra
  fill(#7C432B);
  beginShape();
    vertex(158,208);
    vertex(180,192);
    vertex(210,180);
    vertex(260,175);
    vertex(260,195);
    vertex(220,195);
    vertex(190,198);
    vertex(158,208);
  endShape();
  //Cella dreta
  beginShape();
    vertex(442,208);
    vertex(420,192);
    vertex(390,180);
    vertex(340,175);
    vertex(340,195);
    vertex(380,195);
    vertex(410,198);
    vertex(442,208);
  endShape();
  //Cabells, estil frare amb patilles afilades
  beginShape();
    vertex(82,180);
    vertex(80,202);
    vertex(85,205);
    vertex(90,220);
    vertex(100,350);
    vertex(108,335);
    vertex(110,280);
    vertex(120,200);
    vertex(130,180);
    vertex(135,150);
    vertex(135,125);
    vertex(120,110);
    vertex(114,102);
    vertex(100,120);
    vertex(90,145);
    vertex(82,180);
  endShape();
  beginShape();
    vertex(518,180);
    vertex(520,202);
    vertex(515,205);
    vertex(510,220);
    vertex(500,350);
    vertex(492,335);
    vertex(490,280);
    vertex(480,200);
    vertex(470,180);
    vertex(465,150);
    vertex(465,125);
    vertex(480,110);
    vertex(486,102);
    vertex(500,120);
    vertex(510,145);
    vertex(518,180);
  endShape();  
  //Marques facials, prominència del mentó
  noFill();
  stroke(#8A545F);
  strokeWeight(3);
  curve(260,550,275,500,325,500,340,550);
  //Marques facials, fatiga ocular
  strokeWeight(2);
  curve(280,180,250,250,180,265,100,260);
  curve(320,180,350,250,420,265,500,260);
  //Marques facials, sortints del llavi
  curve(330,380,308,362,304,338,300,270);
  curve(270,380,292,362,296,338,300,270);
  //Marques facials, arrugues frontals expressives
  strokeWeight(4);
  bezier(210,140,230,160,270,130,300,130);
  bezier(300,130,330,130,370,160,390,140);
  strokeWeight(2);
  bezier(190,110,220,140,260,100,300,100);
  bezier(300,100,340,100,380,140,410,110);
}


