
/* Nome: Lilian Caroline Cava
Data: 13/11/2013
Local: Lages, Santa Catarina, Brasil.
Parque Jonas Ramos
*/

int cent, x, y;
x = 500;
y = 350;
cent = 250;
  
  size(x,y);
  background(151, 170, 237);

// Retangulo que dará origem a rua
  fill(200);
  noStroke();
    rect(0, 150, 500, 350);

// Área verde do parque
  rectMode(CENTER);
  stroke(0);
  strokeWeight(1);
  fill(121, 234, 152);
    rect(cent, cent, 400, 140, 90);
  fill(22, 183, 66, 200);
    ellipse(75, 200, 10, 10);
    ellipse(85, 200, 10, 10);
    ellipse(75, 195, 10, 10);
    ellipse(85, 195, 10, 10);
    ellipse(75, 205, 10, 10);
    ellipse(85, 205, 10, 10);
    ellipse(80, 200, 10, 10);

    ellipse(415, 200, 10, 10);
    ellipse(425, 200, 10, 10);
    ellipse(415, 195, 10, 10);
    ellipse(425, 195, 10, 10);
    ellipse(415, 205, 10, 10);
    ellipse(425, 205, 10, 10);
    ellipse(420, 200, 10, 10);
    
    ellipse(75, 300, 10, 10);
    ellipse(85, 300, 10, 10);
    ellipse(75, 295, 10, 10);
    ellipse(85, 295, 10, 10);
    ellipse(75, 305, 10, 10);
    ellipse(85, 305, 10, 10);
    ellipse(80, 300, 10, 10);

    ellipse(415, 300, 10, 10);
    ellipse(425, 300, 10, 10);
    ellipse(415, 295, 10, 10);
    ellipse(425, 295, 10, 10);
    ellipse(415, 305, 10, 10);
    ellipse(425, 305, 10, 10);
    ellipse(420, 300, 10, 10);
   
// Lago
  fill(42, 168, 229);
  stroke(44, 56,160);
    ellipse(cent, cent, 300, 100);

// Fonte
  fill(220);
  stroke(160, 158, 160);
    ellipse(cent, cent, 30, 30);

// Água do chafariz
  strokeWeight(2);
  stroke(193, 187, 193);
    ellipse(cent,cent, 2, 2);
  strokeWeight(2.5);
  stroke(255);
    line(cent, 245, cent, 230);
    line(255, cent, 270, cent);
    line(250, 255, cent, 270);  
    line(245, cent, 230, cent);
  noFill();
    arc(270, 245, 30, 20, PI, PI+HALF_PI);
    arc(255, 265, 30, 20, PI+HALF_PI, TWO_PI);
    arc(230, 255, 30, 20, 0, HALF_PI);
    arc(245, 235, 30, 20, HALF_PI, PI); 

// Prédio  
  fill(157, 157, 157);
  stroke(0);
  strokeWeight(1);
  rectMode(CORNERS);  
    rect(0, 150, 50, 60);
  fill(0);
    line(0, 150, 500, 150);
  fill(255);
    rect(15, 150, 35, 130, 90, 90, 0, 0);
  line(25, 130, 25, 150);
    ellipse(22, 143, 2, 2);
    ellipse(28, 143, 2, 2);  
    rect(10, 120, 20, 110);
    rect(30, 120, 40, 110);
    rect(10, 100, 20, 90);
    rect(30, 100, 40, 90);
    rect(10, 80, 20, 70);
    rect(30, 80, 40, 70);
    line(25, 60, 25, 50);
    arc(35, 40, 30, 30, HALF_PI, PI+QUARTER_PI, CHORD);
    
    line(13, 120, 13, 110);
    line(17, 120, 17, 110);
    line(10, 115, 13, 115);
    line(17, 115, 20, 115);
    
    line(33, 120, 33, 110);
    line(37, 120, 37, 110);
    line(30, 115, 33, 115);
    line(37, 115, 40, 115);
    
    line(13, 100, 13, 90);
    line(17, 100, 17, 90);
    line(10, 95, 13, 95);
    line(17, 95, 20, 95);
    
    line(33, 100, 33, 90);
    line(37, 100, 37, 90);
    line(30, 95, 33, 95);
    line(37, 95, 40, 95);

    line(13, 80, 13, 70);
    line(17, 80, 17, 70);
    line(10, 75, 13, 75);
    line(17, 75, 20, 75);
    
    line(33, 80, 33, 70);
    line(37, 80, 37, 70);
    line(30, 75, 33, 75);
    line(37, 75, 40, 75);

// Árvore 1
  fill(142, 94, 49);
    rect(70, 150, 80, 130);
  fill(22, 183, 66, 200);
    ellipse(70, 130, 10, 10);
    ellipse(80, 130, 10, 10);
    ellipse(70, 125, 10, 10);
    ellipse(80, 125, 10, 10);
    ellipse(70, 135, 10, 10);
    ellipse(80, 135, 10, 10);
    ellipse(75, 130, 10, 10);
    
// Casa
  fill(224, 170, 81);
    rect(105, 110, 112, 95);
  fill(151, 152, 150, 200);
    ellipse(109, 88, 5, 5);
    ellipse(115, 80, 5, 5);
    ellipse(121, 72, 5, 5);
  fill(250, 248, 177);
    rect(100, 150, 140, 115);
    triangle(120, 95, 100, 115, 140, 115);
    fill(255);
    rect(105, 135, 115, 125);
    line(108, 135, 108, 125);
    line(112, 135, 112, 125);
    line(105, 130, 108, 130);
    line(112, 130, 115, 130);
    rect(125, 150, 135, 125);
    ellipse(132, 140, 2, 2);
  strokeWeight(2);
  stroke(250, 126, 48);  
    line(100, 115, 120, 95);
    line(120, 95, 140, 115);
    
// Angeloni
  fill(80, 88, 131);
  stroke(0);
  strokeWeight(1);
    rect(160, 150, 350, 70, 10, 10, 0, 0);
  textSize(20);
  fill(250, 110, 23);
    text("ANGELONI", 200, 90); 
  fill(173, 211, 234);
    rect(230, 150, 280, 120);
  fill(255);
    rect(230, 136, 280, 134);
    line(255, 150, 255, 120);
    
// Árvore 2  
  fill(142, 94, 49);
    rect(370, 150, 380, 130);
  fill(22, 183, 66, 200);
    ellipse(370, 130, 10, 10);
    ellipse(380, 130, 10, 10);
    ellipse(370, 125, 10, 10);
    ellipse(380, 125, 10, 10);
    ellipse(370, 135, 10, 10);
    ellipse(380, 135, 10, 10);
    ellipse(375, 130, 10, 10);
    
// Igreja 
  fill(197, 201, 203);
    rect(400, 150, 480, 90);
    rect(420, 90, 460, 50);
    rect(438, 42, 442, 20);
    rect(430, 28, 450, 25);
    triangle(440, 70, 400, 90, 480, 90);
    triangle(440, 40, 420, 50, 460, 50);
  stroke(197, 201, 203);   
    line(401, 90, 479, 90);  
    line(421, 50, 459, 50);
  fill(255);
  stroke(0);
    ellipse(440, 55, 10, 10);
    line(440, 50, 440, 60);
    line(435, 55, 445, 55);
    ellipse(440, 95, 16, 16);
    line(440, 87, 440, 103);
    line(433, 95, 448, 95);
    rect(430, 150, 450, 120, 30, 30, 0, 0);
    line(440, 150, 440, 120);
    line(430, 140, 450, 140);
   
// Nuvens
  stroke(255);
  fill(245, 245, 245, 210);
    ellipse(40, 10, 50, 15);
    ellipse(100, 20, 50, 15);
    ellipse(130, 20, 40, 20);
    ellipse(115, 30, 45, 15);
    ellipse(200, 30, 45, 15);
    ellipse(250, 10, 45, 10);
    ellipse(275, 20, 50, 15);
    ellipse(360, 20, 40, 18);
    
// Sol
  fill(255, 226, 59);
  stroke(252, 152, 28);
    ellipse(500, 0, 50, 50);
  
// Faixa de pedestres da esquerda
  fill(255);
  stroke(0);
    rect(100, 176, 105, 155);
    rect(110, 158, 125, 155);
    rect(110, 164, 125, 161);
    rect(110, 170, 125, 167);
    rect(110, 176, 125, 173);
  
// Carro amarelo
  fill(255, 249, 75);
    rect(135, 175, 160, 160, 5);
  fill(179, 222, 242);
    quad(143, 175, 148, 172, 148, 163, 143, 160);
    rect(148, 175, 151, 172);
    rect(148, 163, 151, 160);
    quad(155, 172, 158, 175, 158, 160, 155, 163);
    line(135, 172, 143, 172);
    line(135, 163, 143, 163);
    line(148, 163, 155, 163);
    line(148, 172, 155, 172);
    
// Rótula direita
  fill(130);
    ellipse(0, 250, 60, 140);
  fill(180);
    ellipse(0, 250, 54, 134);
  fill(43, 193, 44);
    ellipse(0, 250, 30, 120);
    
// Rótula esquerda
  fill(130);
    ellipse(500, 250, 60, 140);
  fill(180);
    ellipse(500, 250, 54, 134);
  fill(43, 193, 44);
    ellipse(500, 250, 30, 120);
    
// Faixa de pedestres da direita
  fill(255);
  stroke(0);
    rect(395, 346, 400, 325);
    rect(375, 346, 390, 343);
    rect(375, 340, 390, 337);
    rect(375, 334, 390, 331);
    rect(375, 328, 390, 325);
    
// Carro vermeho
  fill(252, 18, 34);
    rect(340, 345, 365, 330, 5);
  fill(179, 222, 242);
    quad(357, 345, 357, 330, 352, 333, 352, 342);
    rect(349, 345, 352, 342);
    rect(349, 333, 352, 330);
    quad(342, 345, 345, 342, 345, 333, 342, 330);
    line(357, 333, 365, 333);
    line(357, 342, 365, 342);
    line(345, 333, 352, 333);
    line(345, 342, 352, 342);
