
void setup () {
  size (1000, 750);

  background(255);
}

void draw () {
  // Belletristik = a ; BLAU;   fill(0, 126, 255);
  // Erotik = b; ROT;           fill(255, 0, 0);
  // Esoterik = c; LILA;        fill(110, 0, 220);
  // Fantasy = d, GELB;          fill(247, 240, 0);
 //  Kinderbuch = e, ROSA;       fill(255,200,200);
  // Krimi = f; SCHWARZ;          fill(0);
  // Kultur = g; GRASGRUEN;       fill(157, 250, 0);
  // Lyrik = h; PINK;             fill(255, 28, 97);
 // Politik = i; ORANGE;           fill(210, 106, 0);
 // Satire = j, DUNKELBLAU;        fill(300);
 // scifi = k GRUEN;                fill(0, 255, 0);
 
 int a;
 a = 20;
 int b;
 b = 20;
 
 
   if(mousePressed) {

 fill(255);
 stroke(0);
   
    }else{
     fill(0);
      stroke(0);
    }
  


 
 if(keyPressed) {
    if (key == 'a' || key == 'A') {
      

// BELLETRISTIK a 
stroke(0, 126, 255);
noFill();
rect(0, 0, a*3, a*3);
rect(10, 10, a, a);
rect(20, 20, a*3, a*3);
ellipse(30, 30, a*2, a*2);
ellipse(40,40, a, a);
ellipse(50, 50, a, a);
ellipse(60, 60, a*2, a*2);
ellipse(70, 70, a*7, a*7);
rect(80, 80, a*3, a*3);
rect(90, 90, a*4, a*4);
rect(100, 100, a*8, a*8);
rect(110, 110, a, a);
rect(120, 120, a*21, a*21);
rect(130, 130, a*3, a*3);
ellipse(140, 140, a, a);
rect(150, 150, a, a);
ellipse(160, 160, a, a);
ellipse(170, 170, a, a);
ellipse(180, 180, a, a);
ellipse(190, 190, a*13, a*13);
ellipse(200, 200, a, a);
ellipse(210, 210, a*3, a*3);
ellipse(220, 220, a*2, a*2);
ellipse(230, 230, a*13, a*13);
ellipse(240, 240, a*2, a*2);
rect(250, 250, a*5, a*5);
rect(260, 260, a, a);
ellipse(270, 270, a, a);
ellipse(280, 280, a, a);
ellipse(290, 290, a*2, a*2);
ellipse(300, 300, a*5, a*5);
ellipse(310, 310, a, a);
rect(320, 320, a, a);
ellipse(330, 330, a*2, a*2);
ellipse(340, 340, a*8, a*8);
ellipse(350, 350, a*2, a*2);
ellipse(360, 360, a*2, a*2);
rect(370, 370, a*3, a*3);
ellipse(380, 380, a*2, a*2);
ellipse(390, 390, a*4, a*4);
ellipse(400,400, a, a);
ellipse(410, 410, a*2, a*2);
ellipse(420, 420, a, a);
ellipse(430, 430, a, a);
ellipse(440, 440, a,a);
ellipse(450, 450, a, a);
rect(460, 460, a*2, a*2);
rect(470, 470, a, a);
ellipse(480, 480, a*6, a*6);
rect(490, 490, a, a);
ellipse(500, 500, a, a);
rect(510, 510, a*2, a*2);
rect(520, 520, a*2, a*2);
rect(530, 530, a, a);
rect(540, 540, a*8, a*8);
rect(550, 550, a, a);
ellipse(560, 560, a*8, a*8);
ellipse(570, 570, a, a);
ellipse(580, 580, a*3, a*3);
rect(590, 590, a*4, a*4);
ellipse(600, 600, a, a);
rect(610, 610, a, a);
rect(620, 620, a, a);
ellipse(630, 630, a*5, a*5);
rect(640, 640, a, a);
ellipse(650, 650, a, a);
ellipse(660, 660, a*3, a*3);
ellipse(670, 670, a*4, a*4);
ellipse(680, 680, a*4, a*4);
ellipse(690, 690, a, a);
ellipse(700, 700, a*5, a*5);
ellipse(710, 710, a, a);
ellipse(720, 720, a, a);

rect(10, 0, a*2, a*2);
ellipse(20, 10, a, a);
ellipse(30, 20, a, a);
ellipse(40, 30, a*3, a*3);
ellipse(50, 40, a*5, a*5);
ellipse(60, 50, a, a);
rect(70, 60, a, a);
rect(80, 70, a, a);
rect(90, 80, a, a);
ellipse(100, 90, a,a);
ellipse(110, 100, a, a);
ellipse(120, 110, a, a);
rect(130, 120, a*3, a*3);
ellipse(140, 130, a*4, a*4);
rect(150, 140, a, a);
ellipse(160, 150, a*2, a*2);
ellipse(170, 160, a*3, a*3);
rect(180, 170, a*2, a*2);
rect(190, 180, a, a);
rect(200, 190, a, a);
rect(210, 200, a, a);
ellipse(220, 210, a*8, a*8);
ellipse(230, 220, a, a);
ellipse(240, 230, a*3, a*3);
rect(250, 240, a*3, a*3);
ellipse(260, 250, a*2, a*2);
rect(270, 260, a, a);
rect(280, 270, a*2, a*2);
rect(290, 280, a, a);
rect(300, 290, a*5, a*5);
ellipse(310, 300, a, a);
rect(320, 310, a, a);
rect(330, 320, a, a);
ellipse(340, 330, a, a);
ellipse(350, 340, a, a);
rect(360, 350, a*5, a*5);
 }
  } else {
    stroke(0); 
 rect(0, 0, a*3, a*3);
rect(10, 10, a, a);
rect(20, 20, a*3, a*3);
ellipse(30, 30, a*2, a*2);
ellipse(40,40, a, a);
ellipse(50, 50, a, a);
ellipse(60, 60, a*2, a*2);
ellipse(70, 70, a*7, a*7);
rect(80, 80, a*3, a*3);
rect(90, 90, a*4, a*4);
rect(100, 100, a*8, a*8);
rect(110, 110, a, a);
rect(120, 120, a*21, a*21);
rect(130, 130, a*3, a*3);
ellipse(140, 140, a, a);
rect(150, 150, a, a);
ellipse(160, 160, a, a);
ellipse(170, 170, a, a);
ellipse(180, 180, a, a);
ellipse(190, 190, a*13, a*13);
ellipse(200, 200, a, a);
ellipse(210, 210, a*3, a*3);
ellipse(220, 220, a*2, a*2);
ellipse(230, 230, a*13, a*13);
ellipse(240, 240, a*2, a*2);
rect(250, 250, a*5, a*5);
rect(260, 260, a, a);
ellipse(270, 270, a, a);
ellipse(280, 280, a, a);
ellipse(290, 290, a*2, a*2);
ellipse(300, 300, a*5, a*5);
ellipse(310, 310, a, a);
rect(320, 320, a, a);
ellipse(330, 330, a*2, a*2);
ellipse(340, 340, a*8, a*8);
ellipse(350, 350, a*2, a*2);
ellipse(360, 360, a*2, a*2);
rect(370, 370, a*3, a*3);
ellipse(380, 380, a*2, a*2);
ellipse(390, 390, a*4, a*4);
ellipse(400,400, a, a);
ellipse(410, 410, a*2, a*2);
ellipse(420, 420, a, a);
ellipse(430, 430, a, a);
ellipse(440, 440, a,a);
ellipse(450, 450, a, a);
rect(460, 460, a*2, a*2);
rect(470, 470, a, a);
ellipse(480, 480, a*6, a*6);
rect(490, 490, a, a);
ellipse(500, 500, a, a);
rect(510, 510, a*2, a*2);
rect(520, 520, a*2, a*2);
rect(530, 530, a, a);
rect(540, 540, a*8, a*8);
rect(550, 550, a, a);
ellipse(560, 560, a*8, a*8);
ellipse(570, 570, a, a);
ellipse(580, 580, a*3, a*3);
rect(590, 590, a*4, a*4);
ellipse(600, 600, a, a);
rect(610, 610, a, a);
rect(620, 620, a, a);
ellipse(630, 630, a*5, a*5);
rect(640, 640, a, a);
ellipse(650, 650, a, a);
ellipse(660, 660, a*3, a*3);
ellipse(670, 670, a*4, a*4);
ellipse(680, 680, a*4, a*4);
ellipse(690, 690, a, a);
ellipse(700, 700, a*5, a*5);
ellipse(710, 710, a, a);
ellipse(720, 720, a, a);

rect(10, 0, a*2, a*2);
ellipse(20, 10, a, a);
ellipse(30, 20, a, a);
ellipse(40, 30, a*3, a*3);
ellipse(50, 40, a*5, a*5);
ellipse(60, 50, a, a);
rect(70, 60, a, a);
rect(80, 70, a, a);
rect(90, 80, a, a);
ellipse(100, 90, a,a);
ellipse(110, 100, a, a);
ellipse(120, 110, a, a);
rect(130, 120, a*3, a*3);
ellipse(140, 130, a*4, a*4);
rect(150, 140, a, a);
ellipse(160, 150, a*2, a*2);
ellipse(170, 160, a*3, a*3);
rect(180, 170, a*2, a*2);
rect(190, 180, a, a);
rect(200, 190, a, a);
rect(210, 200, a, a);
ellipse(220, 210, a*8, a*8);
ellipse(230, 220, a, a);
ellipse(240, 230, a*3, a*3);
rect(250, 240, a*3, a*3);
ellipse(260, 250, a*2, a*2);
rect(270, 260, a, a);
rect(280, 270, a*2, a*2);
rect(290, 280, a, a);
rect(300, 290, a*5, a*5);
ellipse(310, 300, a, a);
rect(320, 310, a, a);
rect(330, 320, a, a);
ellipse(340, 330, a, a);
ellipse(350, 340, a, a);
rect(360, 350, a*5, a*5);   
  }
 
if(keyPressed) {
    if (key == 'b' || key == 'B') {
// Erotik = b; ROT;           
noFill();
stroke(255, 0, 0);
rect(0, 375, b, b);
ellipse(10, 375, b*3, b*3);
ellipse(20, 375, b*2, b*2);
ellipse(30, 375, b, b);
rect(40, 375, b, b);
rect(50, 375, b, b);
rect(60, 375, b, b);
ellipse(70, 375, b, b);
rect(80, 375, b, b); 
ellipse(90, 375, b, b);
ellipse(100, 375, b*2, b*2);
ellipse(110, 375, b, b);
ellipse(120, 375, b, b);
rect(130, 375, b, b);
rect(140, 375, b*4, b*4);
rect(150,  375, b*4, b*4);
rect(160, 375, b*10, b*10);
rect(170, 375, b*24, b*24);
ellipse(180, 375, b, b);
rect(190, 375, b*2, b*2);
rect(200, 375, b, b);
ellipse(210, 375, b*3, b*3);
ellipse(220, 375, b*2, b*2);
rect(230, 375, b, b);
rect(240, 375,b*6, b*6);
rect(250, 375, b*2, b*2);
ellipse(260, 375, b, b);
rect(270, 375, b, b);
rect(280, 375, b, b);
rect(290, 375, b,b);
ellipse(300, 375, b*2, b*2);
rect(310, 375, b*2, b*2);
rect(320, 375, b, b);
rect(330, 375, b*6, b*6);
rect(340, 375, b, b);
rect(350, 375, b, b);
ellipse(360, 375, b, b);
ellipse(370, 375, b, b);
ellipse(380, 375, b*2, b*2);
ellipse(390, 375, b*3, b*3);
ellipse(400, 375, b*9, b*9);
ellipse(410, 375, b, b);
ellipse(420, 375, b, b);
ellipse(430, 375, b, b);
rect(440, 375, b*2, b*2);
rect(450, 375, b*2, b*2);
ellipse(460, 375, b, b);
ellipse(470, 375, b,b);
ellipse(480, 375, b,b);
rect(490, 375, b,b);
rect(500, 375, b*3, b*3);
rect(510, 375, b*5, b*5);
rect(520, 375, b*3, b*3);
ellipse(530, 375, b, b);
ellipse(540, 375, b, b);
rect(550, 375, b, b);
rect(560, 375, b, b);
ellipse(570, 375, b, b);
rect(580, 375, b, b);
rect(590, 375, b*2, b*2);
rect(600, 375, b, b);
ellipse(610, 375, b, b);
ellipse(620, 375, b, b);
rect(630, 375, b, b);
rect(640, 375, b*3, b*3);
rect(650, 375, b*4, b*4);
rect(660, 375, b, b);
rect(670, 375, b, b);
rect(680, 375, b, b);
ellipse(690, 375, b, b);
ellipse(700, 375, b, b);
rect(710, 375, b, b);
ellipse(720, 375, b, b);
ellipse(730, 375, b*3, b*3);
ellipse(740, 375, b, b);
ellipse(750, 375, b, b);
ellipse(760, 375, b*2, b*2);
ellipse(770, 375, b*3, b*3);
ellipse(780, 375, b*2, b*2);
ellipse(790, 375, b*4, b*4);
ellipse(800, 375, b*3, b*3);
ellipse(810, 375, b*3, b*3);
ellipse(820, 375, b*6, b*6);
ellipse(830, 375, b, b);
ellipse(840, 375, b*2, b*2);
ellipse(850, 375, b, b);
ellipse(860, 375, b*3, b*3);
ellipse(870, 375, b, b);
ellipse(880, 375, b, b);
ellipse(890, 375, b, b);
rect(900, 375, b*2, b*2);
rect(910, 375, b, b);
ellipse(920, 375, b, b);
ellipse(930, 375, b, b);
ellipse(940, 375, b, b);
ellipse(950, 375, b, b);
rect(960, 375, b, b);
rect(970, 375, b, b);
rect(980, 375, b*2, b*2);
rect(990, 375, b, b);

ellipse(10, 350, b, b);
ellipse(20, 350, b, b);
ellipse(30, 350, b, b);
ellipse(40, 350, b ,b);
rect(50, 350, b, b);
ellipse(60, 350, b, b);
ellipse(70, 350, b*4, b*4);
ellipse(80, 350, b*2, b*2);
ellipse(90, 350, b*4, b*4);
ellipse(100, 350, b, b);
ellipse(110, 350, b, b);
rect(120, 350, b, b);
ellipse(130, 350, b, b);
ellipse(140, 350, b, b);
rect(150, 350, b*4, b*4);
rect(160, 350, b, b);
rect(170, 350, b, b);
rect(180, 350, b*2, b*2);
rect(190, 350, b*2, b*2);
rect(200, 350, b, b);
ellipse(210, 350, b*2, b*2);
ellipse(220, 350, b*3, b*3);
ellipse(230, 350, b, b);
ellipse(240, 350, b, b);
ellipse(250, 350, b*3, b*3);
ellipse(260, 350, b*4, b*4);
rect(270, 350, b, b);
rect(280, 350, b, b);
ellipse(290, 350, b*3, b*3);
ellipse(300, 350, b*2, b*2);
ellipse(310, 350, b*3, b*3);
ellipse(320, 350, b*8, b*8);
ellipse(330, 350, b*5, b*5);
ellipse(340, 350, b*2, b*2);
ellipse(350, 350, b, b);
ellipse(360, 350, b, b);
ellipse(370, 350, b, b);
ellipse(380, 350, b*2, b*2);
ellipse(390, 350, b, b);
rect(400, 350, b*2, b*2);
rect(410, 350, b, b);
rect(420, 350, b*2, b*2);
ellipse(430, 350, b, b);
ellipse(440, 350, b, b);
ellipse(450, 350, b, b);
ellipse(460, 350, b, b);
ellipse(470, 350, b, b);
    }
 } else {
  stroke(0);
  rect(0, 375, b, b);
ellipse(10, 375, b*3, b*3);
ellipse(20, 375, b*2, b*2);
ellipse(30, 375, b, b);
rect(40, 375, b, b);
rect(50, 375, b, b);
rect(60, 375, b, b);
ellipse(70, 375, b, b);
rect(80, 375, b, b); 
ellipse(90, 375, b, b);
ellipse(100, 375, b*2, b*2);
ellipse(110, 375, b, b);
ellipse(120, 375, b, b);
rect(130, 375, b, b);
rect(140, 375, b*4, b*4);
rect(150,  375, b*4, b*4);
rect(160, 375, b*10, b*10);
rect(170, 375, b*24, b*24);
ellipse(180, 375, b, b);
rect(190, 375, b*2, b*2);
rect(200, 375, b, b);
ellipse(210, 375, b*3, b*3);
ellipse(220, 375, b*2, b*2);
rect(230, 375, b, b);
rect(240, 375,b*6, b*6);
rect(250, 375, b*2, b*2);
ellipse(260, 375, b, b);
rect(270, 375, b, b);
rect(280, 375, b, b);
rect(290, 375, b,b);
ellipse(300, 375, b*2, b*2);
rect(310, 375, b*2, b*2);
rect(320, 375, b, b);
rect(330, 375, b*6, b*6);
rect(340, 375, b, b);
rect(350, 375, b, b);
ellipse(360, 375, b, b);
ellipse(370, 375, b, b);
ellipse(380, 375, b*2, b*2);
ellipse(390, 375, b*3, b*3);
ellipse(400, 375, b*9, b*9);
ellipse(410, 375, b, b);
ellipse(420, 375, b, b);
ellipse(430, 375, b, b);
rect(440, 375, b*2, b*2);
rect(450, 375, b*2, b*2);
ellipse(460, 375, b, b);
ellipse(470, 375, b,b);
ellipse(480, 375, b,b);
rect(490, 375, b,b);
rect(500, 375, b*3, b*3);
rect(510, 375, b*5, b*5);
rect(520, 375, b*3, b*3);
ellipse(530, 375, b, b);
ellipse(540, 375, b, b);
rect(550, 375, b, b);
rect(560, 375, b, b);
ellipse(570, 375, b, b);
rect(580, 375, b, b);
rect(590, 375, b*2, b*2);
rect(600, 375, b, b);
ellipse(610, 375, b, b);
ellipse(620, 375, b, b);
rect(630, 375, b, b);
rect(640, 375, b*3, b*3);
rect(650, 375, b*4, b*4);
rect(660, 375, b, b);
rect(670, 375, b, b);
rect(680, 375, b, b);
ellipse(690, 375, b, b);
ellipse(700, 375, b, b);
rect(710, 375, b, b);
ellipse(720, 375, b, b);
ellipse(730, 375, b*3, b*3);
ellipse(740, 375, b, b);
ellipse(750, 375, b, b);
ellipse(760, 375, b*2, b*2);
ellipse(770, 375, b*3, b*3);
ellipse(780, 375, b*2, b*2);
ellipse(790, 375, b*4, b*4);
ellipse(800, 375, b*3, b*3);
ellipse(810, 375, b*3, b*3);
ellipse(820, 375, b*6, b*6);
ellipse(830, 375, b, b);
ellipse(840, 375, b*2, b*2);
ellipse(850, 375, b, b);
ellipse(860, 375, b*3, b*3);
ellipse(870, 375, b, b);
ellipse(880, 375, b, b);
ellipse(890, 375, b, b);
rect(900, 375, b*2, b*2);
rect(910, 375, b, b);
ellipse(920, 375, b, b);
ellipse(930, 375, b, b);
ellipse(940, 375, b, b);
ellipse(950, 375, b, b);
rect(960, 375, b, b);
rect(970, 375, b, b);
rect(980, 375, b*2, b*2);
rect(990, 375, b, b);

ellipse(10, 350, b, b);
ellipse(20, 350, b, b);
ellipse(30, 350, b, b);
ellipse(40, 350, b ,b);
rect(50, 350, b, b);
ellipse(60, 350, b, b);
ellipse(70, 350, b*4, b*4);
ellipse(80, 350, b*2, b*2);
ellipse(90, 350, b*4, b*4);
ellipse(100, 350, b, b);
ellipse(110, 350, b, b);
rect(120, 350, b, b);
ellipse(130, 350, b, b);
ellipse(140, 350, b, b);
rect(150, 350, b*4, b*4);
rect(160, 350, b, b);
rect(170, 350, b, b);
rect(180, 350, b*2, b*2);
rect(190, 350, b*2, b*2);
rect(200, 350, b, b);
ellipse(210, 350, b*2, b*2);
ellipse(220, 350, b*3, b*3);
ellipse(230, 350, b, b);
ellipse(240, 350, b, b);
ellipse(250, 350, b*3, b*3);
ellipse(260, 350, b*4, b*4);
rect(270, 350, b, b);
rect(280, 350, b, b);
ellipse(290, 350, b*3, b*3);
ellipse(300, 350, b*2, b*2);
ellipse(310, 350, b*3, b*3);
ellipse(320, 350, b*8, b*8);
ellipse(330, 350, b*5, b*5);
ellipse(340, 350, b*2, b*2);
ellipse(350, 350, b, b);
ellipse(360, 350, b, b);
ellipse(370, 350, b, b);
ellipse(380, 350, b*2, b*2);
ellipse(390, 350, b, b);
rect(400, 350, b*2, b*2);
rect(410, 350, b, b);
rect(420, 350, b*2, b*2);
ellipse(430, 350, b, b);
ellipse(440, 350, b, b);
ellipse(450, 350, b, b);
ellipse(460, 350, b, b);
ellipse(470, 350, b, b);
  }
if(keyPressed) {
    if (key == 'c' || key == 'C') {
// Politik = i; Gruen;          
noFill();
stroke(0, 255, 0);
ellipse(0, 740, b, b);
rect(10, 730, b, b);
rect(20, 720, b, b);
rect(30, 710, b, b);
ellipse(40, 700, b, b);
ellipse(50, 690, b*2, b*2);
rect(60, 680, b, b);
ellipse(70, 670, b, b);
ellipse(80, 660, b, b);
rect(90, 650, b, b);
ellipse(100, 640, b*3, b*3);
ellipse(110, 630, b, b);
ellipse(120, 620, b*2, b*2);
ellipse(130, 610, b, b);
ellipse(140, 600, b, b);
rect(150, 590, b, b);
rect(160, 580, b*10, b*10);
rect(170, 570, b*13, b*13);
rect(180, 560, b*3, b*3);
rect(190, 550, b*3, b*3);
rect(200, 540, b, b);
ellipse(210, 530, b*3, b*3);
rect(220, 520, b, b);
rect(230, 510, b*2, b*2);
ellipse(240, 500, b*3, b*3);
ellipse(250, 490, b, b);
ellipse(260, 480, b, b);
rect(270, 470, b*2, b*2);
rect(280, 460, b*4, b*4);
rect(290, 450, b*2, b*2);
ellipse(300, 440, b, b);
ellipse(310, 430, b, b);
rect(320, 420, b, b);
ellipse(330, 410, b, b);
rect(340, 400, b*3, b*3);
rect(350, 390, b, b);
ellipse(360, 380, b, b);
rect(370, 370, b, b);
ellipse(380, 360, b, b);
ellipse(390, 350, b, b);
ellipse(400, 340, b, b);
rect(410, 330, b, b);
ellipse(420, 320, b, b);
ellipse(430, 310, b, b);
ellipse(440, 300, b, b);
ellipse(450, 290, b, b);
rect(460, 280, b*2, b*2);
ellipse(470, 270, b*2, b*2);
ellipse(480, 260, b, b);
ellipse(490, 250, b*2, b*2);
rect(500, 240, b, b);
ellipse(510, 230, b*3, b*3);
ellipse(520, 220, b, b);
rect(530, 210, b, b);
rect(540, 200, b, b);
rect(550, 190, b, b);
ellipse(560, 180, b, b);
ellipse(570, 170, b, b);
rect(580, 160, b, b);
rect(590, 150, b, b);
rect(600, 140, b, b);
rect(610, 130, b, b);
rect(620, 120, b, b);
ellipse(630, 110, b, b);
rect(640, 100, b, b);
ellipse(650, 90, b, b);
ellipse(660, 80, b*2, b*2);
ellipse(670, 70, b, b);
rect(680, 60, b, b);
ellipse(690, 50, b, b);
ellipse(700, 40, b, b);
ellipse(710, 30, b, b);
ellipse(720, 20, b, b);
ellipse(730, 10, b, b);

ellipse(0, 720, b, b);
ellipse(10, 710, b, b);
ellipse(20, 700, b*2, b*2);
ellipse(30, 690, b*5, b*5);
ellipse(40, 680, b, b);
rect(50, 670, b, b);
rect(60, 660, b, b);
ellipse(70, 650, b, b);
ellipse(80, 640, b, b);
ellipse(90, 630, b, b);
rect(100, 620, b, b);
rect(110, 610, b*4, b*4);
rect(120, 600, b, b);
ellipse(130, 590, b, b);
ellipse(140, 580, b*5, b*5);
rect(150, 570, b*2, b*2);
rect(160, 560, b, b);
rect(170, 550, b*2, b*2);
rect(180, 540, b*3, b*3);
ellipse(190, 530, b, b);
rect(200, 520, b*2, b*2);
rect(210, 510, b, b);
rect(220, 500, b, b);
rect(230, 490, b, b);
rect(240, 480, b*4, b*4);
rect(250, 470, b*3, b*3);
rect(260, 460, b*4, b*4);
rect(270, 450, b, b);
rect(280, 440, b, b);
ellipse(290, 430, b, b);
rect(300, 420, b, b);
rect(310, 410, b*2, b*2);
rect(320, 400, b*4, b*4);
ellipse(330, 390, b, b);
ellipse(340, 380, b, b);
rect(350, 370, b, b);
rect(360, 360, b, b);
rect(370, 350, b, b);
    }
 } else {
  stroke(0);
  ellipse(0, 740, b, b);
rect(10, 730, b, b);
rect(20, 720, b, b);
rect(30, 710, b, b);
ellipse(40, 700, b, b);
ellipse(50, 690, b*2, b*2);
rect(60, 680, b, b);
ellipse(70, 670, b, b);
ellipse(80, 660, b, b);
rect(90, 650, b, b);
ellipse(100, 640, b*3, b*3);
ellipse(110, 630, b, b);
ellipse(120, 620, b*2, b*2);
ellipse(130, 610, b, b);
ellipse(140, 600, b, b);
rect(150, 590, b, b);
rect(160, 580, b*10, b*10);
rect(170, 570, b*13, b*13);
rect(180, 560, b*3, b*3);
rect(190, 550, b*3, b*3);
rect(200, 540, b, b);
ellipse(210, 530, b*3, b*3);
rect(220, 520, b, b);
rect(230, 510, b*2, b*2);
ellipse(240, 500, b*3, b*3);
ellipse(250, 490, b, b);
ellipse(260, 480, b, b);
rect(270, 470, b*2, b*2);
rect(280, 460, b*4, b*4);
rect(290, 450, b*2, b*2);
ellipse(300, 440, b, b);
ellipse(310, 430, b, b);
rect(320, 420, b, b);
ellipse(330, 410, b, b);
rect(340, 400, b*3, b*3);
rect(350, 390, b, b);
ellipse(360, 380, b, b);
rect(370, 370, b, b);
ellipse(380, 360, b, b);
ellipse(390, 350, b, b);
ellipse(400, 340, b, b);
rect(410, 330, b, b);
ellipse(420, 320, b, b);
ellipse(430, 310, b, b);
ellipse(440, 300, b, b);
ellipse(450, 290, b, b);
rect(460, 280, b*2, b*2);
ellipse(470, 270, b*2, b*2);
ellipse(480, 260, b, b);
ellipse(490, 250, b*2, b*2);
rect(500, 240, b, b);
ellipse(510, 230, b*3, b*3);
ellipse(520, 220, b, b);
rect(530, 210, b, b);
rect(540, 200, b, b);
rect(550, 190, b, b);
ellipse(560, 180, b, b);
ellipse(570, 170, b, b);
rect(580, 160, b, b);
rect(590, 150, b, b);
rect(600, 140, b, b);
rect(610, 130, b, b);
rect(620, 120, b, b);
ellipse(630, 110, b, b);
rect(640, 100, b, b);
ellipse(650, 90, b, b);
ellipse(660, 80, b*2, b*2);
ellipse(670, 70, b, b);
rect(680, 60, b, b);
ellipse(690, 50, b, b);
ellipse(700, 40, b, b);
ellipse(710, 30, b, b);
ellipse(720, 20, b, b);
ellipse(730, 10, b, b);

ellipse(0, 720, b, b);
ellipse(10, 710, b, b);
ellipse(20, 700, b*2, b*2);
ellipse(30, 690, b*5, b*5);
ellipse(40, 680, b, b);
rect(50, 670, b, b);
rect(60, 660, b, b);
ellipse(70, 650, b, b);
ellipse(80, 640, b, b);
ellipse(90, 630, b, b);
rect(100, 620, b, b);
rect(110, 610, b*4, b*4);
rect(120, 600, b, b);
ellipse(130, 590, b, b);
ellipse(140, 580, b*5, b*5);
rect(150, 570, b*2, b*2);
rect(160, 560, b, b);
rect(170, 550, b*2, b*2);
rect(180, 540, b*3, b*3);
ellipse(190, 530, b, b);
rect(200, 520, b*2, b*2);
rect(210, 510, b, b);
rect(220, 500, b, b);
rect(230, 490, b, b);
rect(240, 480, b*4, b*4);
rect(250, 470, b*3, b*3);
rect(260, 460, b*4, b*4);
rect(270, 450, b, b);
rect(280, 440, b, b);
ellipse(290, 430, b, b);
rect(300, 420, b, b);
rect(310, 410, b*2, b*2);
rect(320, 400, b*4, b*4);
ellipse(330, 390, b, b);
ellipse(340, 380, b, b);
rect(350, 370, b, b);
rect(360, 360, b, b);
rect(370, 350, b, b);
  }
  if(keyPressed) {
    if (key == 'd' || key == 'D') {

 // Fantasy = d, GELB;          fill(247, 240, 0);
 noFill();
 stroke(247, 240, 0);
 ellipse(0, 250, b, b);
 ellipse(10, 255, b*2, b*2);
 ellipse(20, 260, b, b);
 rect(30, 265, b, b);
 rect(40, 270, b, b);
 rect(50, 275, b, b);
 rect(60, 280, b, b);
 rect(70, 285, b, b);
 ellipse(80, 290, b, b);
 ellipse(90, 295, b, b);
 rect(100, 300, b, b);
 ellipse(110, 305, b, b);
 ellipse(120, 310, b, b);
 ellipse(130, 315, b, b);
 ellipse(140, 320, b, b);
 rect(150, 325, b, b);
 rect(160, 330, b, b);
 rect(170, 335, b, b);
 ellipse(180, 340, b*3, b*3);
 ellipse(190, 345, b*6, b*6);
 ellipse(200, 350, b*4, b*4);
 rect(210, 355, b*10, b*10);
 rect(220, 360, b*21, b*21);
 rect(230, 365, b*5, b*5);
 rect(240, 370, b, b);
 rect(250, 375, b*5, b*5);
 rect(260, 380, b, b);
 ellipse(270, 385, b, b);
 rect(280, 390, b, b);
 ellipse(290, 395, b, b);
 rect(300, 400, b*2, b*2);
 rect(310, 405, b, b);
 ellipse(320, 410, b*6, b*6);
 ellipse(330, 415, b*25, b*25);
 ellipse(340, 420, b*2, b*2);
 ellipse(350, 425, b, b);
 ellipse(360, 430, b, b);
 ellipse(370, 435, b, b);
 ellipse(380, 440, b, b);
 ellipse(390, 445, b*3, b*3);
 ellipse(400, 450, b, b);
 ellipse(410, 455, b*7, b*7);
 rect(420, 460, b, b);
 rect(430, 465, b, b);
 rect(440, 470, b, b);
 ellipse(450, 475, b, b);
 rect(460, 480, b, b);
 rect(470, 485, b, b);
 rect(480, 490, b*3, b*3);
 rect(490, 495, b, b);
 rect(500, 500, b, b);
 rect(510, 505, b, b);
 ellipse(520, 510, b*2, b*2);
 ellipse(530, 515, b*3, b*3);
 ellipse(540, 520, b*2, b*2);
 ellipse(550, 525, b*4, b*4);
 ellipse(560, 530, b, b);
 ellipse(570, 535, b, b);
 ellipse(580, 540, b*2, b*2);
 ellipse(590, 545, b, b);
 rect(600, 550, b*6, b*6);
 rect(610, 555, b*6, b*6);
 ellipse(620, 560, b*3, b*3);
 rect(630, 565, b, b);
 ellipse(640, 570, b*2, b*2);
 ellipse(650, 575, b, b);
 ellipse(660, 580, b, b);
 ellipse(670, 585, b, b);
 ellipse(680, 590,b,b);
 rect(690, 595, b, b);
 rect(700, 600, b*3, b*3);
 rect(710, 605, b*2, b*2);
 rect(720, 610, b, b);
 rect(730, 615, b*2, b*2);
 rect(740, 620, b, b);
 ellipse(750, 625,b, b);
 ellipse(760, 630, b, b);
 ellipse(770, 635, b, b);
 rect(780, 640, b, b);
 ellipse(790, 645, b*2, b*2);
 rect(800, 650, b*2, b*2);
 rect(810, 655, b, b);
 ellipse(820, 660, b, b);
 ellipse(830, 665, b*2, b*2);
 ellipse(840, 670, b, b);
 rect(850, 675, b, b);
 rect(860, 680, b, b);
 rect(870, 685, b, b);
 ellipse(880, 690, b, b);
 rect(890, 695, b*2, b*2);
 rect(900, 700, b*3, b*3);
 ellipse(910, 705, b, b);
 rect(920, 710, b, b);
 ellipse(930, 715, b*4, b*4);
 rect(940, 720, b, b);
 rect(950, 725, b, b);
 ellipse(960, 730, b, b);
 ellipse(970, 735, b*6, b*6);
 ellipse(980, 740, b*3, b*3);
 ellipse(990, 745, b, b);
 
 ellipse(0, 220, b, b);
 ellipse(10, 225, b*4, b*4);
 ellipse(20, 230, b*4, b*4);
 ellipse(30, 235, b, b);
 rect(40, 240, b, b);
 ellipse(50, 245, b*2, b*2);
 ellipse(60, 250, b*3, b*3);
 rect(70, 255, b, b);
 rect(80, 260, b, b);
 rect(90, 265, b, b);
 ellipse(100, 270, b, b);
 rect(110, 275, b, b);
 rect(120, 280, b*9, b*9);
 rect(130, 285, b, b);
 ellipse(140, 290, b, b);
 rect(150, 295, b*3, b*3);
 rect(160, 300, b, b);
 rect(170, 305, b, b);
 rect(180, 310, b, b);
 ellipse(190, 315, b, b);
 ellipse(200, 320, b*4, b*4);
 rect(210, 325, b*6, b*6);
 rect(220, 330, b, b);
 rect(230, 335, b, b);
 rect(240, 340, b, b);
 rect(250, 345, b*2, b*2);
 ellipse(260, 350, b, b);
 ellipse(270, 355, b*6, b*6);
 ellipse(280, 360, b, b);
 ellipse(290, 365, b, b);
 rect(300, 370, b, b);
 rect(310, 375, b*2, b*2);
 rect(320, 380, b, b);
 rect(330, 385, b, b);
 rect(340, 390, b*2, b*2);
 rect(350, 395, b*2, b*2);
 rect(360, 400, b, b);
 rect(370, 405, b*4, b*4);
 rect(380, 410, b, b);
 ellipse(390, 415, b, b);
 ellipse(400, 420, b, b);
 ellipse(410, 425, b, b);
 ellipse(420, 430, b, b);
 rect(430, 435, b, b);
 rect(440, 440, b*2, b*2);
 rect(450, 445, b, b);
 ellipse(460, 450, b, b);
 rect(470, 455, b, b);
 rect(480, 460, b*2, b*2);
 rect(490, 465, b, b);
 ellipse(500, 470, b, b);
 ellipse(510, 475, b, b);
 ellipse(520, 480, b, b);
    }
 } else {
  stroke(0);
   ellipse(0, 250, b, b);
 ellipse(10, 255, b*2, b*2);
 ellipse(20, 260, b, b);
 rect(30, 265, b, b);
 rect(40, 270, b, b);
 rect(50, 275, b, b);
 rect(60, 280, b, b);
 rect(70, 285, b, b);
 ellipse(80, 290, b, b);
 ellipse(90, 295, b, b);
 rect(100, 300, b, b);
 ellipse(110, 305, b, b);
 ellipse(120, 310, b, b);
 ellipse(130, 315, b, b);
 ellipse(140, 320, b, b);
 rect(150, 325, b, b);
 rect(160, 330, b, b);
 rect(170, 335, b, b);
 ellipse(180, 340, b*3, b*3);
 ellipse(190, 345, b*6, b*6);
 ellipse(200, 350, b*4, b*4);
 rect(210, 355, b*10, b*10);
 rect(220, 360, b*21, b*21);
 rect(230, 365, b*5, b*5);
 rect(240, 370, b, b);
 rect(250, 375, b*5, b*5);
 rect(260, 380, b, b);
 ellipse(270, 385, b, b);
 rect(280, 390, b, b);
 ellipse(290, 395, b, b);
 rect(300, 400, b*2, b*2);
 rect(310, 405, b, b);
 ellipse(320, 410, b*6, b*6);
 ellipse(330, 415, b*25, b*25);
 ellipse(340, 420, b*2, b*2);
 ellipse(350, 425, b, b);
 ellipse(360, 430, b, b);
 ellipse(370, 435, b, b);
 ellipse(380, 440, b, b);
 ellipse(390, 445, b*3, b*3);
 ellipse(400, 450, b, b);
 ellipse(410, 455, b*7, b*7);
 rect(420, 460, b, b);
 rect(430, 465, b, b);
 rect(440, 470, b, b);
 ellipse(450, 475, b, b);
 rect(460, 480, b, b);
 rect(470, 485, b, b);
 rect(480, 490, b*3, b*3);
 rect(490, 495, b, b);
 rect(500, 500, b, b);
 rect(510, 505, b, b);
 ellipse(520, 510, b*2, b*2);
 ellipse(530, 515, b*3, b*3);
 ellipse(540, 520, b*2, b*2);
 ellipse(550, 525, b*4, b*4);
 ellipse(560, 530, b, b);
 ellipse(570, 535, b, b);
 ellipse(580, 540, b*2, b*2);
 ellipse(590, 545, b, b);
 rect(600, 550, b*6, b*6);
 rect(610, 555, b*6, b*6);
 ellipse(620, 560, b*3, b*3);
 rect(630, 565, b, b);
 ellipse(640, 570, b*2, b*2);
 ellipse(650, 575, b, b);
 ellipse(660, 580, b, b);
 ellipse(670, 585, b, b);
 ellipse(680, 590,b,b);
 rect(690, 595, b, b);
 rect(700, 600, b*3, b*3);
 rect(710, 605, b*2, b*2);
 rect(720, 610, b, b);
 rect(730, 615, b*2, b*2);
 rect(740, 620, b, b);
 ellipse(750, 625,b, b);
 ellipse(760, 630, b, b);
 ellipse(770, 635, b, b);
 rect(780, 640, b, b);
 ellipse(790, 645, b*2, b*2);
 rect(800, 650, b*2, b*2);
 rect(810, 655, b, b);
 ellipse(820, 660, b, b);
 ellipse(830, 665, b*2, b*2);
 ellipse(840, 670, b, b);
 rect(850, 675, b, b);
 rect(860, 680, b, b);
 rect(870, 685, b, b);
 ellipse(880, 690, b, b);
 rect(890, 695, b*2, b*2);
 rect(900, 700, b*3, b*3);
 ellipse(910, 705, b, b);
 rect(920, 710, b, b);
 ellipse(930, 715, b*4, b*4);
 rect(940, 720, b, b);
 rect(950, 725, b, b);
 ellipse(960, 730, b, b);
 ellipse(970, 735, b*6, b*6);
 ellipse(980, 740, b*3, b*3);
 ellipse(990, 745, b, b);
 
 ellipse(0, 220, b, b);
 ellipse(10, 225, b*4, b*4);
 ellipse(20, 230, b*4, b*4);
 ellipse(30, 235, b, b);
 rect(40, 240, b, b);
 ellipse(50, 245, b*2, b*2);
 ellipse(60, 250, b*3, b*3);
 rect(70, 255, b, b);
 rect(80, 260, b, b);
 rect(90, 265, b, b);
 ellipse(100, 270, b, b);
 rect(110, 275, b, b);
 rect(120, 280, b*9, b*9);
 rect(130, 285, b, b);
 ellipse(140, 290, b, b);
 rect(150, 295, b*3, b*3);
 rect(160, 300, b, b);
 rect(170, 305, b, b);
 rect(180, 310, b, b);
 ellipse(190, 315, b, b);
 ellipse(200, 320, b*4, b*4);
 rect(210, 325, b*6, b*6);
 rect(220, 330, b, b);
 rect(230, 335, b, b);
 rect(240, 340, b, b);
 rect(250, 345, b*2, b*2);
 ellipse(260, 350, b, b);
 ellipse(270, 355, b*6, b*6);
 ellipse(280, 360, b, b);
 ellipse(290, 365, b, b);
 rect(300, 370, b, b);
 rect(310, 375, b*2, b*2);
 rect(320, 380, b, b);
 rect(330, 385, b, b);
 rect(340, 390, b*2, b*2);
 rect(350, 395, b*2, b*2);
 rect(360, 400, b, b);
 rect(370, 405, b*4, b*4);
 rect(380, 410, b, b);
 ellipse(390, 415, b, b);
 ellipse(400, 420, b, b);
 ellipse(410, 425, b, b);
 ellipse(420, 430, b, b);
 rect(430, 435, b, b);
 rect(440, 440, b*2, b*2);
 rect(450, 445, b, b);
 ellipse(460, 450, b, b);
 rect(470, 455, b, b);
 rect(480, 460, b*2, b*2);
 rect(490, 465, b, b);
 ellipse(500, 470, b, b);
 ellipse(510, 475, b, b);
 ellipse(520, 480, b, b);
  }
 
  //  Kinderbuch = e, LILA
   if(keyPressed) {
    if (key == 'e' || key == 'E') {
 
  noFill();
  stroke(110, 0, 220);
  rect(0, 540, b, b);
  rect(10, 535, b, b);
  ellipse(20, 530, b, b);
  rect(30, 525, b, b);
  rect(40, 520, b, b);
  rect(50, 515, b*2, b*2);
  ellipse(60, 510, b, b);
  ellipse(70, 505, b*4, b*4);
  ellipse(80, 500, b*4, b*4);
  rect(90, 495, b, b);
  rect(100, 490, b, b);
  rect(110, 485, b, b);
  rect(120, 480, b, b);
  rect(130, 475, b, b);
  rect(140, 470, b, b);
  ellipse(150, 465, b, b);
  ellipse(160, 460, b, b);
  ellipse(170, 455, b, b);
  rect(180, 450, b*2, b*2);
  ellipse(190, 445, b, b);
  ellipse(200, 440, b, b);
  ellipse(210, 435, b, b);
  ellipse(220, 430, b, b);
  ellipse(230, 425, b, b);
  ellipse(240, 420, b, b);
  ellipse(250, 415, b*6, b*6);
  ellipse(260, 410, b, b);
  rect(270, 405, b, b);
  rect(280, 400, b, b);
  rect(290, 395, b,b);
  rect(300, 390, b*2, b*2);
  rect(310, 385, b*2, b*2);
  ellipse(320, 380, b, b);
  rect(330, 375, b, b);
  }
  } else {
    stroke(0);
     rect(0, 540, b, b);
  rect(10, 535, b, b);
  ellipse(20, 530, b, b);
  rect(30, 525, b, b);
  rect(40, 520, b, b);
  rect(50, 515, b*2, b*2);
  ellipse(60, 510, b, b);
  ellipse(70, 505, b*4, b*4);
  ellipse(80, 500, b*4, b*4);
  rect(90, 495, b, b);
  rect(100, 490, b, b);
  rect(110, 485, b, b);
  rect(120, 480, b, b);
  rect(130, 475, b, b);
  rect(140, 470, b, b);
  ellipse(150, 465, b, b);
  ellipse(160, 460, b, b);
  ellipse(170, 455, b, b);
  rect(180, 450, b*2, b*2);
  ellipse(190, 445, b, b);
  ellipse(200, 440, b, b);
  ellipse(210, 435, b, b);
  ellipse(220, 430, b, b);
  ellipse(230, 425, b, b);
  ellipse(240, 420, b, b);
  ellipse(250, 415, b*6, b*6);
  ellipse(260, 410, b, b);
  rect(270, 405, b, b);
  rect(280, 400, b, b);
  rect(290, 395, b,b);
  rect(300, 390, b*2, b*2);
  rect(310, 385, b*2, b*2);
  ellipse(320, 380, b, b);
  rect(330, 375, b, b);
  }
  }
 






