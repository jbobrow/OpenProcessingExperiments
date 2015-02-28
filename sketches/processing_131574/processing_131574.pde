
//Leonardo Borges Moreira 11.03.2014
/* Ataque Alienígena de Leonardo Moreira está licenciado com uma Licença Creative Commons - Atribuição 4.0 Internacional.
Baseado no trabalho disponível em http://www.openprocessing.org/sketch/131574.
Podem estar disponíveis autorizações adicionais às concedidas no âmbito desta licença em http://www.openprocessing.org/sketch/131574. */

float x; //movimento do disco voador
float y; //movimento da lua
float z; //movimento do disco voador

void setup() {
  size (640, 360);
  x = width;
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
  y = y + 0.2;

  // IntroduÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o para o skylline
  stroke(0);
  strokeWeight(2);
  smooth();

  //predios pretos
  fill(0);

  //vetor para os predios
  for (int i = 0; i < cidade.length; i++)
    rect (cidade [i] [0], cidade [i] [1], cidade [i] [2], cidade [i] [3]);

  //predio 3
  pushStyle();
  triangle(117, 135, 139, 135, 128, 90);
  fill (random (255), random (0), random (0));
  noStroke();
  triangle (126, 98, 128, 86, 132, 98);
  popStyle();

  //predio 7
  triangle(362, 144, 373, 144, 366, 108);
  triangle(388, 144, 398, 144, 394, 108);

  //predio 9
  pushStyle();
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
  int k = 0;
  float randomX;
  float randomY;

  // cor e preenchimento

  stroke(255);
  strokeWeight(2);

  // criaÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o do loop de
  for (int i=0;i<0.7;i++) {
    randomX = random(0, 640);
    randomY = random(0, 100);
    point(randomX, randomY);
  }
}
int cidade [][] = {
  //predio 1
  {    0, 210, 43, 180  }  , 

  //predio 2
  {    43, 240, 54, 180  }  , 

  //predio 3
  {    96, 150, 64, 220  }  , 
  {    107, 135, 43, 30  }  , 

  //predio 4
  {    160, 288, 21, 72  }  , 
  {    181, 216, 21, 144  }  , 

  //predio 5
  {    202, 108, 64, 252  }  , 
  {    214, 90, 43, 180  }  , 

  //predio 6
  {    266, 216, 85, 144  }  , 

  //predio 7
  {    351, 144, 53, 216  }  , 

  //predio 8
  {    404, 288, 21, 72  } ,  
  {   416, 72, 42, 288  }  , 
  {    458, 108, 21, 252  }  , 
  {    479, 144, 10, 216  }  , 

  //predio 9

  {    489, 324, 153, 36  }  , 
  {    501, 306, 21, 36  }  , 
  {    533, 270, 85, 108  }  , 
  {    554, 72, 42, 288  }  , 
  {    565, 36, 21, 36  }};

