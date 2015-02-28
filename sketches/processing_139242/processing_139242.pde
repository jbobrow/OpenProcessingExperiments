
//Leonardo Borges Moreira 11.03.2014


float x;
float y;
float z;

void setup() {
  size (640, 360);
  x = width/2;
  y = height/2;
}

void draw() {
  //CEU
  noStroke();
  fill(100);
  for (int i = 0; i<width; i+=3)
  {
    for (int j = 0; j<height; j+=3)
    {
      fill(44 +j/6, 42 +i/40, 70);
      rect(i, j, 20, 20);
    }
  }
  //lua
  fill (234, 215, 62);
  ellipse (520, y, 100, 100);
  y = y + 0.1;
  // Introdução para o skylline
  stroke(0);
  strokeWeight(2);
  smooth();

  //predios pretos
  fill(0);

  //predio 1
  rect(0, 210, 43, 180);

  //predio 2
  rect(43, 240, 54, 180);

  //predio 3
  pushStyle();
  rect(96, 150, 64, 220);
  rect(107, 135, 43, 30);
  triangle(117, 135, 139, 135, 128, 90);
  fill (random (255), random (0), random (0));
  noStroke();
  triangle (126, 98, 128, 86, 132, 98);
  popStyle();

  //predio 4
  rect(160, 288, 21, 72);
  rect(181, 216, 21, 144);

  //predio 5
  rect(202, 108, 64, 252);
  rect(214, 90, 43, 180);

  //predio 6
  rect(266, 216, 85, 144);

  //predio 7
  rect(351, 144, 53, 216);
  triangle(362, 144, 373, 144, 366, 108);
  triangle(388, 144, 398, 144, 394, 108);

  //predio 8
  rect(404, 288, 21, 72);
  rect(416, 72, 42, 288);
  rect(458, 108, 21, 252);
  rect(479, 144, 10, 216);

  //predio 9
  pushStyle();
  rect(489, 324, 153, 36);
  rect(501, 306, 21, 36);
  rect(533, 270, 85, 108);
  rect(554, 72, 42, 288);
  rect(565, 36, 21, 36);
  int m = millis ();
  fill (m % 255);
  triangle(571, 36, 580, 36, 576, 0);
  popStyle();

  //Disco Voador Luz
  noStroke ();
  fill (231, 232, 37, random(150));
  smooth(8);
  triangle (x, 38, x + 50, 400, x-40, 400);
  //Disco Voador Nave
  fill (234, 234, 218);
  noStroke ();
  smooth (8);
  fill (m % 255);
  ellipse (x, 40, 80, 20);
  fill (random (200));
  ellipse (x, 40, 80, 15);
  fill (m % 100);
  ellipse (x, 40, 80, 8);  
  fill (52, 191, 60, 200);
  ellipse (x, 40, 5, 8);
  x = 320 + 200*sin (z);
  z = z + 0.01;

  // variaveis do loop das estrelas
  int x = 0;
  float randomX;
  float randomY;

  // cor e preenchimento

  stroke(255);
  strokeWeight(2);

  // criação do loop de 
  for (int i=0;i<0.1;i++) {
    randomX = random(0, 640);
    randomY = random(0, 100);
    point(randomX, randomY);
  }
}

