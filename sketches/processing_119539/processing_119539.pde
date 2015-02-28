
//Aquest sketch mostra l'augment de l'agonia de l'home anteriorment representat
//en el primer sketch a mesura que se li apropa un ganivet. Podem escollir entre
//dos tipus de visions: normal o macabra. Amb el boolean "fonsMacabre" iniciarem
//la versió macabra, ja que per defecte ens trobem en la normal. Les altres variables
//són només per definir els moviments de la sang del fons macabre i les llàgrimes.

boolean fonsMacabre = false;
int creixement1 = 75;
int creixement2 = 150;
int creixementLlagrima = 230;

void setup(){
  //Tamany del sketch i color del fons
  size(600,600);
}

void draw(){
  //Ajustem un frameRate més baix que el normal perquè els moviments siguin més naturals
  frameRate(25);
  //Posem la versió del fons macabre
  if (fonsMacabre) {
    //Important posar el background aquí i no a "void setup()" per evitar que el ganivet
    //s'imprimeixi infinitament a la pantalla
    background(#FF0000);
    //12 Barres cilíndriques de sang cauran pel fons a dos alçades i velocitats diferents
    noStroke();
    fill(#880000);
    rect(0,0,50,creixement1);
    arc(25,creixement1,50,50,0,TWO_PI);
    rect(50,0,50,creixement2);
    arc(75,creixement2,50,50,0,TWO_PI);
    rect(100,0,50,creixement1);
    arc(125,creixement1,50,50,0,TWO_PI);
    rect(150,0,50,creixement2);
    arc(175,creixement2,50,50,0,TWO_PI);
    rect(200,0,50,creixement1);
    arc(225,creixement1,50,50,0,TWO_PI);
    rect(250,0,50,creixement2);
    arc(275,creixement2,50,50,0,TWO_PI);
    rect(300,0,50,creixement1);
    arc(325,creixement1,50,50,0,TWO_PI);
    rect(350,0,50,creixement2);
    arc(375,creixement2,50,50,0,TWO_PI);
    rect(400,0,50,creixement1);
    arc(425,creixement1,50,50,0,TWO_PI);
    rect(450,0,50,creixement2);
    arc(475,creixement2,50,50,0,TWO_PI);
    rect(500,0,50,creixement1);
    arc(525,creixement1,50,50,0,TWO_PI);
    rect(550,0,50,creixement2);
    arc(575,creixement2,50,50,0,TWO_PI);
    creixement1 = creixement1 + 3;
    creixement2 = creixement2 + 2;
    //Ajustem dos bucles de caiguda de la sang, un per a cada velocitat
    if (creixement1 == 510) {
      creixement1 = 75;
    }
    if (creixement2 == 440) {
      creixement2 = 150;
    }
  }
  //Posem la versió normal del fons en blau cel
  else {
    background(#00A3F7);
  }
  //Aquí venen totes les parts de la cara fixes, és a dir, no dinàmiques
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
  //Cabells, estil frare amb patilles afilades
  fill(#7C432B);
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
  //Cella esquerra
  stroke(#000000);
  strokeWeight(1);
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
    
  //AQUÍ COMENÇA LA PART DINÀMICA DEL SKETCH
  //L'home reaccionarà a l'aproximació del ganivet, el qual podem moure
  //a plaer, i la seva cara empitjorà quan més centrat en funció de "x"
  // el posicionem.
  
  //Parpelles. Se les he hagut d'afegir per augmentar l'expressivitat del
  //rostre. El disseny és massa angular, però resulta molt més efectiu que
  //mitjançant formes corbes.
  
  //Establint opertura i tancament de les parpelles segons la posició
  //del ganivet mitjançant la funció:
  //variacio_pixels = (-|mouseX|-300)/16
  //Parpella esquerra superior
  strokeWeight(1);
  stroke(#000000);
  fill(#C98A98);
  //Per establir simetria, hem de separar els moviments en dues parts,
  //dividides per la meitat del sketch (x = 300).
  if (mouseX <= 300) {
      //Parpella esquerra superior
      beginShape();
        vertex(185,205);
        vertex(235,205);
        //El valor absolut negat de "x" és la funció matemàtica que defineix
        //a la perfecció el moviment que desitjava per a les expressions:
        //dinamisme constant i lineal.
        vertex(270 - (-(abs(mouseX)-300)/16),229 - (-(abs(mouseX)-300)/16));
        vertex(150 + (-(abs(mouseX)-300)/16),229 - (-(abs(mouseX)-300)/16));
        vertex(185,205);    
      endShape();
      //Parpella esquerra inferior
      beginShape();
        vertex(150 + (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
        vertex(270 - (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
        vertex(235,255);
        vertex(185,255);
        vertex(150 + (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
      endShape();
      //Parpella dreta superior
      beginShape();
        vertex(415,205);
        vertex(365,205);
        vertex(330 + (-(abs(mouseX)-300)/16),229 - (-(abs(mouseX)-300)/16));
        vertex(450 - (-(abs(mouseX)-300)/16),229 - (-(abs(mouseX)-300)/16));
        vertex(415,205);
      endShape();
      //Parpella dreta inferior
      beginShape();
        vertex(450 - (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
        vertex(330 + (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
        vertex(365,255);
        vertex(415,255);
        vertex(450 - (-(abs(mouseX)-300)/16),231 + (-(abs(mouseX)-300)/16));
      endShape();
      //He traslladat la boca a l'apartat dinàmic per animar-la també. Tot ha de
      //tenir la mateixa funció aplicada perquè els moviments de totes les parts
      //siguin els mateixos.
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
        vertex(392,420 + (abs(mouseX)/16));
        vertex(385,425 + (abs(mouseX)/16));
        vertex(370,440 + (abs(mouseX)/16));
        vertex(330,454 + (abs(mouseX)/16));
        vertex(315,460 + (abs(mouseX)/16));
        vertex(285,460 + (abs(mouseX)/16));
        vertex(270,454 + (abs(mouseX)/16));
        vertex(230,440 + (abs(mouseX)/16));
        vertex(215,425 + (abs(mouseX)/16));
        vertex(208,420 + (abs(mouseX)/16));
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
        vertex(388,420 + (abs(mouseX)/16));
        vertex(365,425 + (abs(mouseX)/16));
        vertex(330,432 + (abs(mouseX)/16));
        vertex(308,435 + (abs(mouseX)/16));
        vertex(292,435 + (abs(mouseX)/16));
        vertex(270,432 + (abs(mouseX)/16));
        vertex(235,425 + (abs(mouseX)/16));
        vertex(212,420 + (abs(mouseX)/16));
        vertex(235,410);
        vertex(270,395);
        vertex(292,390);
        vertex(308,390);
        vertex(330,395);
        vertex(365,410);
        vertex(388,420 + (abs(mouseX)/16));
      endShape();
      //Boca, llengua
      fill(#6E242C);
      curve(200,460 + (abs(mouseX)/16),212,420 + (abs(mouseX)/16),388,420 + (abs(mouseX)/16),400,460 + (abs(mouseX)/16));
      //Boca, dents, primers molars
      fill(#E2E2FF);
      triangle(365,425 + (abs(mouseX)/16),340,427 + (abs(mouseX)/16),340,430 + (abs(mouseX)/16));
      triangle(235,425 + (abs(mouseX)/16),260,427 + (abs(mouseX)/16),260,430 + (abs(mouseX)/16));
      //Boca, dents, ullals
      beginShape();
        vertex(339,430 + (abs(mouseX)/16));
        vertex(337,427 + (abs(mouseX)/16));
        vertex(334,424 + (abs(mouseX)/16));
        vertex(328,425 + (abs(mouseX)/16));
        vertex(323,428 + (abs(mouseX)/16));
        vertex(322,432 + (abs(mouseX)/16));
      endShape();
      beginShape();
        vertex(261,430 + (abs(mouseX)/16));
        vertex(263,427 + (abs(mouseX)/16));
        vertex(266,424 + (abs(mouseX)/16));
        vertex(272,425 + (abs(mouseX)/16));
        vertex(277,428 + (abs(mouseX)/16));
        vertex(278,432 + (abs(mouseX)/16));
      endShape();
      //Boca, dents, centrals inferiors
      quad(279,433 + (abs(mouseX)/16),280,429 + (abs(mouseX)/16),289,430 + (abs(mouseX)/16),289,435 + (abs(mouseX)/16));
      quad(321,433 + (abs(mouseX)/16),320,429 + (abs(mouseX)/16),311,430 + (abs(mouseX)/16),311,435 + (abs(mouseX)/16));
      quad(310,435 + (abs(mouseX)/16),310,429 + (abs(mouseX)/16),300,429 + (abs(mouseX)/16),300,435 + (abs(mouseX)/16));
      quad(290,435 + (abs(mouseX)/16),290,429 + (abs(mouseX)/16),300,429 + (abs(mouseX)/16),300,435 + (abs(mouseX)/16));
      //Boca, dents, paletes
      triangle(280,393,299,393,299,390);
      triangle(320,393,301,393,301,390);
      //Llàgrimes, les quals surten, augmenten de mida i cauen entre x = 150 i x = 450 en funció de
      //la variable "creixementLlagrima".
      if (mouseX >= 150) {
        fill(#BFC5FA);
        //Les llàgrimes augmenten de mida i de rang de caiguda quan més centrat estigui el ganivet
        ellipse(265,creixementLlagrima,creixementLlagrima / 30,creixementLlagrima / 15);
        ellipse(335,creixementLlagrima,creixementLlagrima / 30,creixementLlagrima / 15);
        creixementLlagrima = creixementLlagrima + 1;
        if (creixementLlagrima == 280) {
          creixementLlagrima = 230;
        }
      }
  }
  //L'altre cas de la simetria
  else {
      beginShape();
        vertex(185,205);
        vertex(235,205);
        vertex(270 + (-(abs(mouseX)-300)/16),229 + (-(abs(mouseX)-300)/16));
        vertex(150 - (-(abs(mouseX)-300)/16),229 + (-(abs(mouseX)-300)/16));
        vertex(185,205);    
      endShape();
      //Parpella esquerra inferior
      beginShape();
        vertex(150 - (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
        vertex(270 + (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
        vertex(235,255);
        vertex(185,255);
        vertex(150 - (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
      endShape();
      //Parpella dreta superior
      beginShape();
        vertex(415,205);
        vertex(365,205);
        vertex(330 - (-(abs(mouseX)-300)/16),229 + (-(abs(mouseX)-300)/16));
        vertex(450 + (-(abs(mouseX)-300)/16),229 + (-(abs(mouseX)-300)/16));
        vertex(415,205);
      endShape();
      //Parpella dreta inferior
      beginShape();
        vertex(450 + (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
        vertex(330 - (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
        vertex(365,255);
        vertex(415,255);
        vertex(450 + (-(abs(mouseX)-300)/16),231 - (-(abs(mouseX)-300)/16));
      endShape();
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
        //El 36 és el creixement total acumulat fins al pixel 300 de "x"
        //L'hem de sumar per evitar que la boca parteixi de la posició inicial,
        //i ho faci desde la que havia adquirit a x = 300
        vertex(392,420 + 36 - (abs(mouseX)/16));
        vertex(385,425 + 36 - (abs(mouseX)/16));
        vertex(370,440 + 36- (abs(mouseX)/16));
        vertex(330,454 + 36 - (abs(mouseX)/16));
        vertex(315,460 + 36 - (abs(mouseX)/16));
        vertex(285,460 + 36 - (abs(mouseX)/16));
        vertex(270,454 + 36 - (abs(mouseX)/16));
        vertex(230,440 + 36 - (abs(mouseX)/16));
        vertex(215,425 + 36 - (abs(mouseX)/16));
        vertex(208,420 + 36 - (abs(mouseX)/16));
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
        vertex(388,420 + 36 - (abs(mouseX)/16));
        vertex(365,425 + 36 - (abs(mouseX)/16));
        vertex(330,432 + 36 - (abs(mouseX)/16));
        vertex(308,435 + 36 - (abs(mouseX)/16));
        vertex(292,435 + 36 - (abs(mouseX)/16));
        vertex(270,432 + 36 - (abs(mouseX)/16));
        vertex(235,425 + 36 - (abs(mouseX)/16));
        vertex(212,420 + 36 - (abs(mouseX)/16));
        vertex(235,410);
        vertex(270,395);
        vertex(292,390);
        vertex(308,390);
        vertex(330,395);
        vertex(365,410);
        vertex(388,420 + 36 - (abs(mouseX)/16));
      endShape();
      //Boca, llengua
      fill(#6E242C);
      curve(200,460 + 36 - (abs(mouseX)/16),212,420 + 36 - (abs(mouseX)/16),388,420 + 36 - (abs(mouseX)/16),400,460 + 36 - (abs(mouseX)/16));
      //Boca, dents, primers molars
      fill(#E2E2FF);
      triangle(365,425 + 36 - (abs(mouseX)/16),340,427 + 36 - (abs(mouseX)/16),340,430 + 36 - (abs(mouseX)/16));
      triangle(235,425 + 36 - (abs(mouseX)/16),260,427 + 36 - (abs(mouseX)/16),260,430 + 36 - (abs(mouseX)/16));
      //Boca, dents, ullals
      beginShape();
        vertex(339,430 + 36 - (abs(mouseX)/16));
        vertex(337,427 + 36 - (abs(mouseX)/16));
        vertex(334,424 + 36 - (abs(mouseX)/16));
        vertex(328,425 + 36 - (abs(mouseX)/16));
        vertex(323,428 + 36 - (abs(mouseX)/16));
        vertex(322,432 + 36 - (abs(mouseX)/16));
      endShape();
      beginShape();
        vertex(261,430 + 36 - (abs(mouseX)/16));
        vertex(263,427 + 36 - (abs(mouseX)/16));
        vertex(266,424 + 36 - (abs(mouseX)/16));
        vertex(272,425 + 36 - (abs(mouseX)/16));
        vertex(277,428 + 36 - (abs(mouseX)/16));
        vertex(278,432 + 36 - (abs(mouseX)/16));
      endShape();
      //Boca, dents, centrals inferiors
      quad(279,433 + 36 - (abs(mouseX)/16),280,429 + 36 - (abs(mouseX)/16),289,430 + 36 - (abs(mouseX)/16),289,435 + 36 - (abs(mouseX)/16));
      quad(321,433 + 36 - (abs(mouseX)/16),320,429 + 36 - (abs(mouseX)/16),311,430 + 36 - (abs(mouseX)/16),311,435 + 36 - (abs(mouseX)/16));
      quad(310,435 + 36 - (abs(mouseX)/16),310,429 + 36 - (abs(mouseX)/16),300,429 + 36 - (abs(mouseX)/16),300,435 + 36 - (abs(mouseX)/16));
      quad(290,435 + 36 - (abs(mouseX)/16),290,429 + 36 - (abs(mouseX)/16),300,429 + 36 - (abs(mouseX)/16),300,435 + 36 - (abs(mouseX)/16));
      //Boca, dents, paletes
      triangle(280,393,299,393,299,390);
      triangle(320,393,301,393,301,390);
      //Per les llàgrimes, fem el mateix que al bloc simètric anterior
      if (mouseX <= 450) {
        fill(#BFC5FA);
        ellipse(265,creixementLlagrima,(creixementLlagrima / 30),creixementLlagrima / 15);
        ellipse(335,creixementLlagrima,(creixementLlagrima / 30),creixementLlagrima / 15);
        creixementLlagrima = creixementLlagrima + 1;
        if (creixementLlagrima == 280) {
          creixementLlagrima = 230;
        }
      }
  }
  //El ganivet segueix el recorregut del ratolí  
  //Ganivet, mànec part ombrejada
  fill(#311C12);
  beginShape();
    vertex(mouseX + 8, mouseY + 84);
    vertex(mouseX + 15, mouseY + 72);
    vertex(mouseX + 4, mouseY - 50);
    vertex(mouseX, mouseY - 50);
    vertex(mouseX + 8, mouseY + 84);
  endShape();
  //Ganivet, mànec part clara
  fill(#54301F);
  beginShape();
    vertex(mouseX - 16, mouseY - 40);
    vertex(mouseX - 4, mouseY + 80);
    vertex(mouseX, mouseY + 88);
    vertex(mouseX + 8, mouseY + 84);
    vertex(mouseX + 12, mouseY + 72);
    vertex(mouseX, mouseY - 50);
    vertex(mouseX - 16, mouseY - 40);
  endShape();
  //Ganivet, fulla part ombrejada
  fill(#555555);
  beginShape();
    vertex(mouseX + 4, mouseY - 50);
    vertex(mouseX - 14, mouseY - 230);
    vertex(mouseX - 15, mouseY - 230);
    vertex(mouseX, mouseY - 50);
  endShape();
  //Ganivet, fulla part clara
  fill(#CCCCCC);
  beginShape();
    vertex(mouseX - 16, mouseY - 40);
    vertex(mouseX + 2, mouseY - 50);
    vertex(mouseX - 15, mouseY - 230);
    vertex(mouseX - 20, mouseY - 200);
    vertex(mouseX - 23, mouseY - 165);
    vertex(mouseX - 25, mouseY - 120);
    vertex(mouseX - 24, mouseY - 60);
    vertex(mouseX - 22, mouseY - 36);
    vertex(mouseX - 16, mouseY - 40);
  endShape();
  //Detall de sang al ganivet per augmentar l'exageració del fons macabre  
  if (fonsMacabre) {
    noStroke();
    fill(#880000);
    beginShape();
      vertex(mouseX - 20, mouseY - 200);
      vertex(mouseX - 21, mouseY - 165);
      vertex(mouseX - 20, mouseY - 120);
      vertex(mouseX - 18, mouseY - 60);
      vertex(mouseX - 16, mouseY - 40);
      vertex(mouseX - 22, mouseY - 36);
      vertex(mouseX - 24, mouseY - 60);
      vertex(mouseX - 25, mouseY - 120);
      vertex(mouseX - 23, mouseY - 165);
      vertex(mouseX - 20, mouseY - 200);
    endShape();
  }
}

//Si es clica, s'inicia el fons macabre.
void mousePressed(){
  fonsMacabre = true;
  creixement1 = 75;
}

//Si es deixa de clicar, torna el fons blau pacífic.
void mouseReleased(){
  fonsMacabre = false;
  creixement2 = 150;
}



