
void setup () {
  size(500, 400);
  background(132, 210, 247);
}

void draw () {
  //pálpebra da frente fechada
  noStroke ();
  fill (255);
  arc (250, 250, 448, 350, radians(197), radians (343));
  arc (250, 150, 448, 350, radians(17), radians (163));

  //pálpebra de trás fechada
  noStroke ();
  fill (170);
  arc (250, 250, 450, 330, radians(197), radians (343));
  arc (250, 150, 450, 330, radians(17), radians (163));

  //globo
  fill (132, 220, 247, 150);
  noStroke();
  arc (250, 250, 475, 230, radians(205), radians (335));
  arc (250, 150, 475, 230, radians(25), radians (155));

  //pálpebra de trás vazada
  stroke (170);
  strokeWeight (4);
  noFill ();
  arc (250, 260, 410, 200, radians(217), radians (323));
  arc (250, 140, 410, 200, radians(37), radians (143));
  //esquerda em cima
  int a=250;
  int b=160;
  line (a, b, a, b-30);
  line (a-20, b, a-25, b-30);
  line (a-40, b, a-50, b-30);
  line (a-60, b+2, a-75, b-30);
  line (a-80, b+5, a-100, b-30);
  line (a-100, b+9, a-130, b-30);
  line (a-120, b+15, a-155, b-20);
  line (a-140, b+24, a-175, b);
  line (a-160, b+35, a-200, b+17);
  //direita em cima
  line (a+20, b, a+25, b-30);
  line (a+40, b, a+50, b-30);
  line (a+60, b+2, a+75, b-30);
  line (a+80, b+5, a+100, b-30);
  line (a+100, b+9, a+130, b-30);
  line (a+120, b+15, a+155, b-20);
  line (a+140, b+24, a+175, b);
  line (a+160, b+35, a+200, b+17);
  //esquerda embaixo
  int c=240;
  line (a, c, a, c+30);
  line (a-20, c, a-25, c+30);
  line (a-40, c, a-50, c+30);
  line (a-60, c-2, a-75, c+30);
  line (a-80, c-5, a-100, c+30);
  line (a-100, c-9, a-130, c+30);
  line (a-120, c-15, a-155, c+20);
  line (a-140, c-24, a-175, c);
  line (a-160, c-35, a-200, c-17);
  //direita embaixo
  line (a+20, c, a+25, c+30);
  line (a+40, c, a+50, c+30);
  line (a+60, c-2, a+75, c+30);
  line (a+80, c-5, a+100, c+30);
  line (a+100, c-9, a+130, c+30);
  line (a+120, c-15, a+155, c+20);
  line (a+140, c-24, a+175, c);
  line (a+160, c-35, a+200, c-17);

  //pupila
  noStroke ();
  fill (255);
  ellipse (250, 200, 145, 145);

  //canto e meio
  stroke (255);
  strokeWeight (6);
  line (35, 200, 465, 200);
  strokeWeight (2);
  triangle(35, 200, 20, 200, 49, 170);
  triangle(35, 200, 20, 200, 49, 230);
  triangle(465, 200, 480, 200, 451, 170);
  triangle(465, 200, 480, 200, 451, 230);

  //pálpebra da frente vazada e móvel
  strokeWeight (4);
  fill (195, 245, 243, 100);
  beginShape ();
  vertex (35, 200);
  bezierVertex (160, 105, 340, 105, 465, 200);
  float k = map (mouseY, 0, height, 125, 200);
  bezierVertex (245, k, 255, k, 35, 200);
  endShape ();
  beginShape ();
  vertex (35, 200);
  bezierVertex (160, 295, 340, 295, 465, 200);
  float m = map (height - mouseY, 0, height, 200, 275);
  bezierVertex (245, m, 255, m, 35, 200);
  endShape ();
  //esquerda em cima
  strokeWeight(5);
  int d=130;
  line (a, d, a, d-50);
  line (a-25, d, a-20, d-50);
  line (a-50, d, a-40, d-50);
  line (a-75, d+4, a-60, d-46);
  line (a-100, d+12, a-80, d-42);
  line (a-127, d+21, a-100, d-35);
  line (a-150, d+30, a-120, d-25);
  line (a-175, d+43, a-145, d-9);
  line (a-198, d+57, a-168, d+6);
  //direita em cima
  line (a+25, d, a+20, d-50);
  line (a+50, d, a+40, d-50);
  line (a+75, d+4, a+60, d-46);
  line (a+100, d+12, a+80, d-42);
  line (a+127, d+21, a+100, d-35);
  line (a+150, d+30, a+120, d-25);
  line (a+175, d+43, a+145, d-9);
  line (a+198, d+57, a+168, d+6);
  //esquerda embaixo
  float e=269.5;
  line (a, e, a, e+50);
  line (a-25, e, a-20, e+50);
  line (a-50, e, a-40, e+50);
  line (a-75, e-4, a-60, e+46);
  line (a-100, e-12, a-80, e+42);
  line (a-127, e-21, a-100, e+35);
  line (a-150, e-30, a-120, e+25);
  line (a-175, e-43, a-145, e+9);
  line (a-198, e-57, a-168, e-6);
  //direita embaixo
  line (a, e, a, e+50);
  line (a+25, e, a+20, e+50);
  line (a+50, e, a+40, e+50);
  line (a+75, e-4, a+60, e+46);
  line (a+100, e-12, a+80, e+42);
  line (a+127, e-21, a+100, e+35);
  line (a+150, e-30, a+120, e+25);
  line (a+175, e-43, a+145, e+9);
  line (a+198, e-57, a+168, e-6);

  //lago
  noStroke ();
  fill (143, 238, 252, 180);
  rect (0, 200, 500, 200);

  //ondas
  frameRate (2);
  stroke (255);
  strokeWeight (2);
  onda (random (0, 500), random (200, 400));
}

void onda (float x, float y) {
  bezier (x, y, x+3, y+5, x+15, y-5, x+18, y);
  }

