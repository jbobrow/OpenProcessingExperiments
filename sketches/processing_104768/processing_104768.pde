
void setup() {
  size(900, 400);
}
void draw() {
  if (mouseX<height/5) {
    background(150, 227, 240);
    fill(150, 227, 240);
    //mudar cores
    noStroke();
    fill(124, 227, 143);
    rect(0, 230, 900, 270);
    stroke(0, 0, 0);
    fill(189, 239, 252, 80);
    triangle(170, 280, 450, 90, 730, 280);
    stroke(0, 0, 0, 100);
    line(450, 90, 350, 270);
    line(450, 90, 550, 270);
    line(170, 280, 350, 270);
    line(350, 270, 550, 270);
    line(550, 270, 730, 280);
    stroke(0, 0, 0, 40);
    line(450, 90, 450, 270);

    //esquerda do centro vertical
    line(435, 117, 435, 270);
    line(420, 144, 420, 270);
    line(405, 170, 405, 270);
    line(390, 197, 390, 270);
    line(375, 224, 375, 270);
    line(360, 251, 360, 270);
    //direita do centro vertical
    line(465, 117, 465, 270);
    line(480, 144, 480, 270);
    line(495, 170, 495, 270);
    line(510, 197, 510, 270);
    line(525, 224, 525, 270);
    line(540, 251, 540, 270);
    //horizontais
    line(435, 117, 465, 117);
    line(420, 144, 480, 144);
    line(405, 170, 495, 170);
    line(390, 197, 510, 197);
    line(375, 224, 525, 224);
    line(360, 251, 540, 251);
    //triangulo direita
    line(465, 117, 474, 105);
    line(480, 144, 500, 125);
    line(495, 170, 527, 144);
    line(510, 197, 555, 162);
    line(525, 224, 584, 179);
    line(540, 251, 610, 197);
    line(555, 271, 636, 214);
    line(592, 273, 662, 231);
    line(630, 274, 688, 248);
    //triang direita2
    line(450, 90, 620, 273);
    line(465, 117, 600, 272);
    line(480, 144, 580, 271);
    line(495, 170, 560, 271);
    line(474, 105, 640, 274);
    line(500, 125, 660, 275);
    line(527, 144, 680, 276);
    line(555, 162, 700, 277);
    //triang esquerda
    line(435, 117, 426, 105);
    line(420, 144, 400, 125);
    line(405, 170, 373, 144);
    line(390, 197, 345, 162);
    line(375, 224, 316, 179);
    line(360, 251, 290, 197);
    line(345, 271, 264, 214);
    line(308, 273, 238, 231);
    line(270, 274, 212, 248);
    //triang esq 2
    line(450, 90, 280, 273);
    line(435, 117, 300, 272);
    line(420, 144, 320, 271);
    line(405, 170, 340, 271);
    line(390, 197, 510, 197);
    line(426, 105, 260, 274);
    line(400, 125, 240, 275);
    line(373, 144, 220, 276);
    line(345, 162, 200, 277);
    //triangulo frente
    stroke(0, 0, 0, 180);
    line(200, 280, 459, 95);
    line(230, 280, 470, 105);
    line(260, 280, 485, 115);
    line(290, 280, 500, 125);
    line(320, 280, 515, 135);
    line(350, 280, 530, 145);
    line(380, 280, 545, 155);
    line(410, 280, 560, 165);
    line(440, 280, 575, 175);
    line(470, 280, 590, 185);
    line(500, 280, 605, 195);
    line(530, 280, 620, 205);
    line(560, 280, 635, 215);
    line(590, 280, 650, 225);
    line(620, 280, 665, 235);
    line(650, 280, 680, 245);
    line(680, 280, 695, 255);
    line(710, 280, 710, 265);
    //triang frente 2
    line(442, 95, 700, 280);
    line(427, 105, 670, 280);
    line(412, 115, 640, 280);
    line(397, 125, 610, 280);
    line(382, 135, 590, 280);
    line(368, 145, 560, 280);
    line(353, 155, 530, 280);
    line(338, 165, 500, 280);
    line(323, 175, 470, 280);
    line(308, 185, 440, 280);
    line(293, 195, 410, 280);
    line(278, 205, 390, 280);
    line(263, 215, 360, 280);
    line(249, 225, 330, 280);
    line(235, 235, 300, 280);
    line(219, 245, 270, 280);
    line(205, 255, 240, 280);
    line(190, 265, 210, 280);




    loop();
    noStroke();
    fill(250, 218, 35);
    ellipse(30, 180, 70, 70);
    fill(39, 38, 38);
    triangle(170, 281, 730, 281, 910, 300);
  }
  else {
    if (mouseX<260) {
      fill(150, 227, 240);
      ellipse(30, 180, 70, 70) ;
      fill(124, 227, 143);
      triangle(170, 281, 730, 281, 910, 300);
      fill(250, 218, 35);
      ellipse(150, 100, 70, 70);
      fill(39, 38, 38);
      triangle(170, 281, 730, 281, 900, 350);
    }
    else {
      if (mouseX<540) {
        fill(150, 227, 240);
        ellipse(150, 100, 70, 70);
        ellipse(30, 180, 70, 70);
        fill(124, 227, 143);
        triangle(170, 281, 730, 281, 910, 300);
        triangle(170, 281, 730, 281, 900, 350);
        fill(250, 218, 35);
        ellipse(450, 50, 70, 70);
        fill(39, 38, 38);
        triangle(170, 281, 730, 281, 450, 500);
      }
      else {
        if (mouseX<720) {
          fill(150, 227, 240);
          ellipse(30, 180, 70, 70);
          ellipse(150, 100, 70, 70);
          ellipse(450, 50, 70, 70);
          fill(124, 227, 143);
          triangle(170, 281, 730, 281, 910, 300);
          triangle(170, 281, 730, 281, 900, 350);
          triangle(170, 281, 730, 281, 450, 500);
          fill(250, 218, 35);
          ellipse(700, 100, 70, 70);
          fill(39, 38, 38);
          triangle(170, 281, 730, 281, 0, 350);
        }
        else {
          if (mouseX<900) {
            fill(150, 227, 240);
            ellipse(30, 180, 70, 70);
            ellipse(150, 100, 70, 70);
            ellipse(450, 50, 70, 70);
            ellipse(700, 100, 70, 70);
            fill(124, 227, 143);
            triangle(170, 281, 730, 281, 910, 300);
            triangle(170, 281, 730, 281, 900, 350);
            triangle(170, 281, 730, 281, 450, 500);
            triangle(170, 281, 730, 281, 0, 350);
            fill(250, 218, 35);
            ellipse(870, 180, 70, 70);
            fill(39, 38, 38);
            triangle(170, 281, 730, 281, 0, 300);
          }
        }
      }
    }
  }
}
