
//wolken declare
Wolk mijnWolk;
Wolk mijnWolk2;
Wolk mijnWolk3;
Wolk mijnWolk4;
Wolk mijnWolk5;
Wolk mijnWolk6;
Wolk mijnWolk7;
Wolk mijnWolk8;
Wolk mijnWolk9;
Wolk mijnWolk10;
Wolk mijnWolk11;
Wolk mijnWolk12;

//declare primitive variables
int score;
int verlies;
float heldY;
float groen;

void setup() {
  size(550, 700);
  smooth();
  //wolken initialize
  mijnWolk = new Wolk(20, 100, 30, 9);
  mijnWolk2 = new Wolk(80, 40, 30, 5);
  mijnWolk3 = new Wolk(300, 60, 30, 2);
  mijnWolk4 = new Wolk(150, 600, 40, 6);
  mijnWolk5 = new Wolk(400, 200, 30, 4);
  mijnWolk6 = new Wolk(230, 0, 40, 3);
  mijnWolk7 = new Wolk(330, 500, 40, 4);
  mijnWolk8 = new Wolk(450, 470, 30, 5);
  mijnWolk9 = new Wolk(500, 600, 30, 8);
  mijnWolk10 = new Wolk(145, 300, 40, 7);
  mijnWolk11 = new Wolk(40, 250, 40, 7);
  mijnWolk12 = new Wolk(170, 70, 35, 6);

  //initialize primitive variables
  score = 3;
  verlies = 1;
  heldY = 700;
  groen = 23;
}

void draw() {
  //achtergrond van spel
  background(128, 209, 255); 

  kleurWissel();
  tekenWereld();

  //functies wolken
  mijnWolk.update();
  mijnWolk.testRand();
  mijnWolk.drawWolk();
  mijnWolk.testRaken();
  mijnWolk.opnieuwBeginnen();

  mijnWolk2.update();
  mijnWolk2.testRand();
  mijnWolk2.drawWolk();
  mijnWolk2.testRaken();
  mijnWolk2.opnieuwBeginnen();

  mijnWolk3.update();
  mijnWolk3.testRand();
  mijnWolk3.drawWolk();
  mijnWolk3.testRaken();
  mijnWolk3.opnieuwBeginnen();

  mijnWolk4.update();
  mijnWolk4.testRand();
  mijnWolk4.drawWolk();
  mijnWolk4.testRaken();
  mijnWolk4.opnieuwBeginnen();

  mijnWolk5.update();
  mijnWolk5.testRand();
  mijnWolk5.drawWolk();
  mijnWolk5.testRaken();
  mijnWolk5.opnieuwBeginnen();

  mijnWolk6.update();
  mijnWolk6.testRand();
  mijnWolk6.drawWolk();
  mijnWolk6.testRaken();
  mijnWolk6.opnieuwBeginnen();

  mijnWolk7.update();
  mijnWolk7.testRand();
  mijnWolk7.drawWolk();
  mijnWolk7.testRaken();
  mijnWolk7.opnieuwBeginnen();

  mijnWolk8.update();
  mijnWolk8.testRand();
  mijnWolk8.drawWolk();
  mijnWolk8.testRaken();
  mijnWolk8.opnieuwBeginnen();

  mijnWolk9.update();
  mijnWolk9.testRand();
  mijnWolk9.drawWolk();
  mijnWolk9.testRaken();
  mijnWolk9.opnieuwBeginnen();

  mijnWolk10.update();
  mijnWolk10.testRand();
  mijnWolk10.drawWolk();
  mijnWolk10.testRaken();
  mijnWolk10.opnieuwBeginnen();

  mijnWolk11.update();
  mijnWolk11.testRand();
  mijnWolk11.drawWolk();
  mijnWolk11.testRaken();
  mijnWolk11.opnieuwBeginnen();

  mijnWolk12.update();
  mijnWolk12.testRand();
  mijnWolk12.drawWolk();
  mijnWolk12.testRaken();
  mijnWolk12.opnieuwBeginnen();

  //functies held
  bewegingHeld();
  tekenSuperheld();


  //uitleg spel
  fill(0);
  textSize(25);
  text("Lives =" + score, 420, 40);
  textSize(18);
  text("Avoid the clouds and save the world!", 20, 20);

  //game einde  
  showWinScreen();
  showGameOverScreen();
}

void tekenWereld() {
  //noord-west amerika
  //getallen staan voor aantal landen vanaf boven (eerste getal), aantal landen vanaf links (tweede getal)
  stroke(0);
  //fill(252, 231, 190);
  fill(0, groen, 80);
  triangle(20, 30, 37, 45, 60, 30);//land linksboven
  triangle(37, 45, 60, 30, 45, 60);//land 2
  triangle(60, 30, 45, 60, 100, 50);
  triangle(45, 60, 100, 50, 103, 120);//4,2
  triangle(45, 60, 103, 120, 46, 123); //5,2
  triangle(45, 60, 46, 123, 18, 90);
  triangle(46, 123, 75, 122, 58, 138);//6,2
  triangle(46, 123, 58, 138, 45, 139);
  triangle(45, 139, 58, 138, 82, 170); //mexico

  //noord-oost amerika
  triangle(100, 50, 103, 120, 140, 65); //2,2
  triangle(140, 65, 132, 62, 133, 74); //klein in 2,2
  triangle(133, 75, 140, 65, 147, 72);
  triangle(140, 65, 147, 72, 157, 60);

  triangle(147, 72, 157, 60, 161, 80);

  triangle(100, 50, 132, 62, 133, 47);//boven 2.2
  triangle(132, 62, 133, 48, 135, 57);
  triangle(133, 47, 135, 57, 143, 57);

  //losse delen bij noord amerika
  triangle(157, 50, 148, 50, 150, 44);
  triangle(165, 47, 165, 54, 169, 47);

  triangle(172, 55, 176, 56, 177, 46);
  triangle(176, 56, 177, 46, 186, 58);
  triangle(186, 58, 177, 46, 190, 43);
  triangle(186, 58, 190, 43, 205, 52);
  triangle(186, 58, 176, 56, 183, 70);


  //zuid amerika
  triangle(82, 170, 38, 195, 45, 220);

  beginShape();
  vertex(82, 170);
  vertex(45, 220);
  vertex(90, 210);
  vertex(90, 171);
  endShape(CLOSE);

  triangle(90, 210, 90, 171, 103, 205);


  triangle(90, 210, 103, 205, 120, 225);//buitenste boven
  triangle(103, 205, 120, 225, 112, 205);

  triangle(90, 210, 120, 225, 95, 250);

  beginShape();
  vertex(45, 220);
  vertex(85, 265);
  vertex(95, 250);
  vertex(90, 210);
  endShape(CLOSE);

  triangle(85, 265, 45, 220, 70, 275);
  triangle(47, 225, 70, 275, 46, 260);
  triangle(70, 275, 46, 260, 48, 285);
  triangle(70, 275, 48, 285, 73, 295);

  //europa
  triangle(250, 85, 243, 100, 254, 105);
  triangle(250, 85, 265, 85, 254, 105);
  triangle(265, 85, 254, 105, 266, 101);

  //eilanden bij europa
  triangle(252, 76, 265, 78, 256, 71);
  triangle(265, 78, 256, 71, 264, 65);

  //afrika
  triangle(260, 115, 245, 125, 275, 128);

  beginShape();
  vertex(245, 125);
  vertex(275, 128);
  vertex(275, 155);
  vertex(225, 135);
  endShape(CLOSE);

  triangle(275, 128, 275, 155, 297, 142);
  triangle(275, 155, 297, 142, 305, 165);

  triangle(275, 155, 225, 135, 255, 190);//driehoek aan vierhoek
  triangle(225, 135, 255, 190, 215, 150);

  beginShape();
  vertex(215, 150);
  vertex(255, 190);
  vertex(250, 192);
  vertex(218, 180);
  endShape(CLOSE);

  triangle(255, 190, 275, 155, 265, 197);
  triangle(275, 155, 265, 197, 305, 165);
  triangle(265, 197, 305, 165, 295, 235);//drie van onder
  triangle(265, 197, 295, 235, 265, 225);
  triangle(295, 235, 265, 225, 260, 255);
  triangle(302, 185, 295, 235, 325, 190);

  line(302, 185, 265, 197);

  triangle(310, 240, 320, 220, 325, 230);//madagascar

  beginShape();
  vertex(265, 85);
  vertex(266, 101);
  vertex(272, 105);
  vertex(286, 106);
  vertex(293, 80);
  endShape(CLOSE);


  //noorwegen,zweden,finland
  beginShape();
  vertex(265, 85);
  vertex(330, 75);
  vertex(310, 55);
  vertex(300, 57);
  endShape(CLOSE);

  beginShape();
  vertex(293, 80);
  vertex(286, 106);
  vertex(286, 115);
  vertex(300, 115);
  vertex(308, 106);
  endShape(CLOSE);


  beginShape();
  vertex(293, 82);
  vertex(315, 115);
  vertex(380, 130);
  vertex(330, 75);
  endShape(CLOSE);


  beginShape();
  vertex(315, 115);
  vertex(300, 120);
  vertex(312, 135);
  vertex(309, 148);
  vertex(319, 180);
  endShape(CLOSE);

  //driehoek als vierhoek
  beginShape();
  vertex(315, 116);
  vertex(319, 180);
  vertex(335, 145);
  vertex(380, 130);
  endShape(CLOSE);


  beginShape();
  vertex(335, 145);
  vertex(319, 180);
  vertex(332, 180);
  vertex(345, 160);
  endShape(CLOSE);

  triangle(335, 145, 380, 130, 360, 162);

  beginShape();
  vertex(360, 162);
  vertex(445, 130);
  vertex(440, 100);
  vertex(405, 80);
  endShape(CLOSE);


  beginShape();
  vertex(406, 81);
  vertex(379, 129);
  vertex(331, 75);
  vertex(342, 75);
  vertex(349, 71);
  endShape(CLOSE);

  //boven
  triangle (349, 71, 406, 81, 430, 68);
  triangle(406, 81, 430, 68, 440, 100);
  triangle(430, 68, 440, 100, 458, 102);//4e van rechtboven
  triangle(430, 68, 465, 110, 463, 78);
  triangle(430, 68, 463, 78, 460, 64);//2e van rechtsboven
  triangle(463, 78, 460, 64, 485, 75);
  triangle(440, 100, 458, 102, 453, 115);
  triangle(453, 115, 440, 100, 443, 120);
  triangle(465, 110, 458, 102, 453, 115);
  triangle(465, 110, 453, 115, 464, 130);
  triangle(445, 130, 360, 162, 390, 175);
  triangle(360, 162, 390, 175, 373, 192);//onder driehoek
  triangle(445, 130, 419, 152, 433, 152);
  triangle(445, 130, 433, 152, 445, 160);

  beginShape();
  vertex(419, 152);
  vertex(433, 152);
  vertex(428, 174);
  vertex(390, 175);  
  endShape(CLOSE);

  beginShape();
  vertex(428, 174);
  vertex(390, 175);
  vertex(400, 200);
  vertex(420, 207);
  vertex(427, 202);
  endShape(CLOSE);

  beginShape();
  vertex(432, 152);
  vertex(428, 174);
  vertex(427, 195);
  vertex(433, 193);
  vertex(443, 172);
  endShape(CLOSE);

  //australie
  beginShape();
  vertex(460, 280);
  vertex(463, 310);
  vertex(510, 285);
  vertex(500, 270);
  vertex(485, 270);
  endShape(CLOSE);

  beginShape();
  vertex(460, 280);
  vertex(463, 310);
  vertex(450, 318);
  vertex(440, 300);
  endShape(CLOSE);

  triangle(450, 318, 463, 310, 468, 327);
  triangle(463, 310, 468, 327, 495, 320);

  beginShape();
  vertex(510, 285);
  vertex(463, 310);
  vertex(495, 320);
  vertex(515, 350);
  endShape(CLOSE);

  triangle(515, 350, 510, 285, 530, 305);

  beginShape();
  vertex(530, 305);
  vertex(510, 285);
  vertex(515, 270);
  vertex(516, 283);
  endShape(CLOSE);

  //eilanden bij australie
  triangle(505, 255, 490, 250, 498, 238);
  triangle(498, 238, 490, 250, 484, 235);

  beginShape();
  vertex(490, 250);
  vertex(484, 235);
  vertex(475, 240);
  vertex(480, 245);
  vertex(479, 250);
  endShape(CLOSE);

  triangle(460, 238, 452, 238, 460, 228);
  triangle(460, 238, 452, 238, 452, 248);
  beginShape();
  vertex(452, 248);
  vertex(460, 238);
  vertex(461, 247);
  vertex(456, 255);
  endShape(CLOSE);

  triangle(430, 230, 420, 227, 428, 220);
  beginShape();
  vertex(430, 230);
  vertex(420, 227);
  vertex(420, 240);
  vertex(432, 235);
  endShape(CLOSE);

  beginShape();
  vertex(410, 233);
  vertex(400, 230);
  vertex(400, 220);
  vertex(403, 217);
  endShape(CLOSE);

  beginShape();
  vertex(435, 220);
  vertex(438, 223);
  vertex(443, 206);
  vertex(438, 208);
  endShape(CLOSE);
}

//wereld verandert van kleur
void kleurWissel() {
  groen = groen + 0.28;
  groen = constrain(groen, 0, 255);
}
class Wolk { // class voor de wolken
  float wolkX;
  float wolkY;
  float breedte;
  float richting;
  float teller; 

  Wolk (float tempX, float tempY, float tempBreedte, float tempRichting) {
    wolkX = tempX;
    wolkY = tempY;
    richting = tempRichting;
    breedte = tempBreedte;
  }

  void update() { 
    wolkY = wolkY + richting;
  }

  void testRand() {
    if (wolkY > height) {
      wolkY = 0;
      wolkX = random(0, 550);
    }
  }

  void drawWolk() {
    stroke(255);
    fill(255);
    ellipse(wolkX, wolkY, breedte, breedte);
    ellipse(wolkX+15, wolkY-15, breedte-5, breedte-5);
    ellipse(wolkX+25, wolkY, breedte, breedte);
    ellipse(wolkX+43, wolkY-25, breedte+10, breedte+10);
    ellipse(wolkX+45, wolkY, breedte-10, breedte-10);
    ellipse(wolkX+60, wolkY-10, breedte+10, breedte+10);
  }

  void testRaken() {
    if (wolkY-50 < heldY && heldY < wolkY+50 && wolkX > mouseX-10 && wolkX < mouseX+10) {
      score = score - verlies;
      wolkY = 0;
      wolkX = random(0, 550);
    }
  }

  void opnieuwBeginnen() {
    if (wolkY > 820) {
      wolkY = 0;
      wolkX = random(0, 600);
    }
  }
}
// einde class

//superheld
void tekenSuperheld() {
  stroke(0);
  fill(246, 180, 159);
  rect(mouseX, heldY, 5, 6);
  fill(5, 96, 204);
  rect(mouseX, heldY+6, 5, 40);
  fill(0);
  rect(mouseX-10, heldY+20, 10, 10);

  fill(203, 5, 10);
  beginShape();
  vertex(mouseX-10, heldY+30);
  vertex(mouseX, heldY+30);
  vertex(mouseX+20, heldY+80);
  vertex(mouseX-30, heldY+80);
  endShape(CLOSE);

  fill(5, 96, 204);
  rect(mouseX-15, heldY+80, 5, 20);
  rect(mouseX, heldY+80, 5, 20);
  fill(203, 5, 10);
  rect(mouseX-15, heldY+95, 5, 15);
  rect(mouseX, heldY+95, 5, 15);
}

//held beweegt omhoog
void bewegingHeld() {
  heldY = heldY - 0.8;
}

//winnen
void showWinScreen() {
  if (heldY < 50) {
    background(128, 209, 255);
    fill(0);
    textSize(36);
    text("YOU WON!", 190, 300);
    text("YOU SAVED THE WORLD :)", 60, 350);

    noLoop();
  }
} 

//game over
void showGameOverScreen() {
  if (score == 0) {
    background(128, 209, 255);
    fill(0);
    textSize(36);
    text("GAME OVER", 175, 200);
    text("You did not manage to save ", 30, 250);
    text("the world.. :(", 185, 300);

    noLoop();
  }
}

/*
Mijn extra aanvullingen op een rij
 - Held beweegt omhoog tijdens ontwijken
 - Levens die aftellen zodra een wolk wordt geraakt
 - Wanneer de held de wereld bereik > YOU WIN
 - Wanneer de held 5 wolkjes raakt > GAME OVER
 - De wereld verandert van kleur gedurende de game (gezond groen als de held wint) en wordt binnen de uiterste maten gehouden met constrain
 - Wereld op de achtergrond is zelf gecodeert
 (size is gebaseerd op grootte laptop 17.3 inch)
 */


