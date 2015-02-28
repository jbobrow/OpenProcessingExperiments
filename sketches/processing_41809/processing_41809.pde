
int[] papers = new int[60];
int[] paperPosition = {
  10, 28, 51, 67, 87, 108, 136, 155, 174, 200, 225, 239, 251, 274, 301, 317, 330, 345, 360, 380, 
  14, 36, 58, 71, 92, 111, 130, 150, 164, 183, 207, 235, 249, 261, 276, 295, 307, 330, 348, 370, 
  20, 42, 60, 81, 105, 126, 148, 159, 177, 200, 217, 235, 253, 270, 294, 319, 331, 350, 368, 378
};
float[] paperVertical = {
  330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 
  355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 355, 
  380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380
};
int[] paperSize = {
  7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
  13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13
};       

int[] neatPapers = new int[12];
int neatPapersPosition[] = {
  0, 4, -4, 0, 5, 6, 4, 1, -3, -5, -1, 5
};
int neatPapersVertical[] = {
  145, 135, 125, 115, 105, 95, 85, 75, 65, 55, 45, 35
};
int peak[] = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
};

float YEEE = 0.0;
float UHHH = 0.0;

void setup() {
  size(400, 400);
  for (int i = 0; i < 24; i++) {
    if (peak[i] > 12) peak[i] = 24 - peak[i];
  }
}

void draw() {
  int H = hour();
  int M = minute();
  int S = second();

  colorMode(HSB, 100);
  background(63, 78 - (5*peak[H]), 26 + (5*peak[H]));
  fill(#A07B7B);  
  noStroke();
  rect(0, 290, 400, 400);
  stroke(0);
  colorMode(RGB, 255);



  line(0, 290, 400, 290);
  // edges

  fill(#6A4229);
  beginShape();
  vertex(30, 155);
  vertex(30, 300);
  vertex(35, 300);
  vertex(35, 155);
  endShape(CLOSE);

  beginShape();
  vertex(325, 155);
  vertex(325, 300);
  vertex(330, 300);
  vertex(330, 155);
  endShape(CLOSE);

  // slanted sides
  fill(#402717);
  beginShape();
  vertex(50, 155);
  vertex(325, 300);
  vertex(325, 155);
  endShape(CLOSE);

  beginShape();
  vertex(35, 155);
  vertex(35, 300);
  vertex(320, 155);
  endShape(CLOSE);
  line(30, 150, 50, 160);

  // top bar
  fill(#6A4229);
  beginShape();
  vertex(30, 150);
  vertex(330, 150);
  vertex(330, 155);
  vertex(30, 155);
  endShape(CLOSE);

  //back
  fill(#2C1C13);
  beginShape();
  vertex(50, 160);
  vertex(310, 160);
  vertex(310, 292);
  vertex(50, 292);
  endShape(CLOSE);

  //lamp
  fill(140);
  beginShape();
  vertex(89, 62);
  vertex(85, 69);
  vertex(90, 73);
  vertex(110, 60);
  vertex(105, 55);
  vertex(97, 57);
  vertex(90, 50);
  vertex(75, 50);
  vertex(50, 70);
  vertex(34, 110);
  vertex(50, 145);
  vertex(37, 145);
  vertex(37, 150);
  vertex(73, 150);
  vertex(73, 145);
  vertex(60, 145);
  vertex(44, 110);
  vertex(60, 70);
  vertex(80, 55);
  vertex(84, 55);
  endShape(CLOSE);
  if (H>5 && H<18) {
  }
  else {
    fill(250, 199, 28, 122);
    beginShape();
    vertex(90, 73);
    vertex(110, 60);
    vertex(270, 150);
    vertex(120, 150);
    endShape(CLOSE);
  }

  //pencil
  fill(#E37405);
  if ((S%2) == 0) {
    beginShape();
    vertex(260, 130);
    vertex(263, 131);
    vertex(255, 150);
    vertex(250, 150);
    endShape(CLOSE);
  }
  else {
    beginShape();
    vertex(250, 130);
    vertex(253, 129);
    vertex(255, 150);
    vertex(250, 150);
    endShape(CLOSE);
  }

  //throw up
  if (S == 39) YEEE = millis();
  if (S > 40 && S < 50) {
    drawPaper(150, (int)(170 - 2*(millis() - YEEE) / 100), 6);
  }

  //head
  fill(#3E2312);
  ellipse(173, 135 - (3 * peak[H]), 50, 50);
  fill(50);
  rect(173 - 25 - 10, 125 - (3 * peak[H]), 10, 20);
  rect(173 + 25, 125 - (3 * peak[H]), 10, 20);
  beginShape();
  vertex(173 - 25 - 5, 125 - (3 * peak[H]));
  vertex(173 - 15, 125 - (3 * peak[H]) - 20);
  vertex(173 + 15, 125 - (3 * peak[H]) - 20);
  vertex(173 + 25 + 5, 125 - (3 * peak[H]));
  vertex(173 + 25, 125 - (3 * peak[H]));
  vertex(173 + 15, 125 - (3 * peak[H]) - 15);
  vertex(173 - 15, 125 - (3 * peak[H]) - 15);
  vertex(173 - 25, 125 - (3 * peak[H]));
  endShape(CLOSE);

  // me!
  fill(#F2C99F);
  beginShape();
  vertex(250, 155);
  vertex(258, 148);
  vertex(258, 144);
  vertex(254, 140);
  vertex(240, 140);
  endShape(CLOSE);

  smooth();
  fill(#4A7F81);
  beginShape();
  vertex(127, 172);
  vertex(120, 170);
  vertex(115, 165);
  vertex(135, 133);
  vertex(140, 130);
  vertex(220, 115);
  vertex(230, 120);
  vertex(245, 140);
  vertex(250, 155);
  vertex(245, 160);
  vertex(236, 163);
  vertex(228, 160);
  endShape(CLOSE);

  // front legs
  fill(#7C4523);
  rect(155, 235, 7, 58);
  rect(206, 235, 7, 58);

  //feet
  fill(0);
  beginShape();
  vertex(215, 210);
  vertex(240, 230);
  vertex(241, 250);
  vertex(215, 300);
  vertex(205, 305);
  vertex(195, 300);
  vertex(195, 270);
  vertex(220, 235);
  endShape();

  beginShape();
  vertex(170, 205);
  vertex(115, 220);
  vertex(95, 240);
  vertex(100, 295);
  vertex(120, 295);
  vertex(115, 260);
  vertex(130,240);
  vertex(170, 235);
  endShape(CLOSE);
  
  if(S%6 == 0){
    beginShape();
    vertex(120, 285);
    vertex(120, 300);
    vertex(85, 290);
    vertex(84, 285);
    endShape(CLOSE);

  }
  else{
    beginShape();
    vertex(120, 285);
    vertex(120, 300);
    vertex(85, 300);
    vertex(82, 295);
    endShape(CLOSE);
  }

  fill(#E04D4D);
  beginShape();
  vertex(200, 270);
  vertex(210, 270);
  vertex(210, 300);
  vertex(200, 300);
  endShape(CLOSE);

  fill(#4A7F81);
  beginShape();
  vertex(145, 175);
  vertex(220, 170);
  vertex(220, 230);
  vertex(150, 230);
  vertex(150, 200);
  endShape(CLOSE);

  //chair
  fill(#194017);
  rect(140, 135, 90, 45);
  fill(#0C290C);
  rect(140, 180, 90, 3);

  fill(#194017);
  rect(144, 228, 85, 7);
  fill(#0C290C);
  beginShape();
  vertex(144, 235);
  vertex(229, 235);
  vertex(211, 238);
  vertex(155, 238);
  endShape(CLOSE);

  // back legs
  fill(#7C4523);
  rect(140, 135, 7, 164);
  rect(223, 135, 7, 164);


  float r = 0.0;
  int next = 0;
  int checker = (H%12);
  if (checker == 0) checker = 12;
  for (int j = 0; j < checker; j++) {
    drawNeatPaper(neatPapersPosition[j], neatPapersVertical[j]);
  }
  if (S == 49) YEEE = millis();
  for (int i = 0; i < M; i++) {
    int q = 0;
    if (M == 59) {
      if (S > 52) q = S - 53;
    }
    if (S > 49) {
      r = (millis() - YEEE) / 100;
      next = i + 1;
      if (next == 60) next = 0;
      if (next == M && M != 59) drawPaper(paperPosition[next], (int)(r * (paperVertical[next] / 100)), paperSize[next]);
    }
    drawPaper(paperPosition[i], (int)paperVertical[i], paperSize[i] - q);
  }
  if (S == 49) YEEE = millis();
  if (M == 0) {
    if (S > 49) {
      r = (millis() - YEEE) / 100;
      drawPaper(paperPosition[0], (int)(r * (paperVertical[0] / 100)), paperSize[0]);
    }
  }
}

void drawPaper(int where1, int where2, int paperSize) {
  fill(255);
  beginShape();
  vertex(where1 - paperSize / 2, where2 - paperSize / 2);
  vertex(where1, where2 - paperSize /4);
  vertex(where1 + paperSize / 2, where2 - paperSize/4);
  vertex(where1 + paperSize/2, where2);
  vertex(where1, where2+paperSize/4);
  vertex(where1+paperSize/2, where2+paperSize/2);
  vertex(where1, where2 + paperSize);
  vertex(where1 - paperSize/2, where2 + paperSize/2);
  vertex(where1 - paperSize, where2 +paperSize);
  vertex(where1 - paperSize, where2);
  vertex(where1 - 3*paperSize/4, where2);
  endShape(CLOSE);
}

void drawNeatPaper(int where1, int where2) {
  fill(230);
  beginShape();
  vertex(310 + where1 - 20, where2 + 5);
  vertex(310 + where1 + 15, where2 + 5);
  vertex(310 + where1 + 15, where2 - 5);
  vertex(310 + where1 - 20, where2 - 5);
  endShape(CLOSE);
}
