
//Bruno Henrique Henning sobota
//Universidade TecnolÃ³gica Federal do ParanÃ¡
//Curitiba, 18 de marÃ§o de 2014
//Professor Luiz Ernesto Merkle

//Este trabalho está licenciado sob uma Licença Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by-sa/4.0/.

color[] palette=
{
  #ffffff, #000000, #dbd74b, #4bdb4c, #a34bdb, #f2368e
};


void setup() {


  size(600, 600);
  background(255);
  smooth(30);
  stroke (0);
  strokeWeight(1.5);
  frameRate(200);
}

float t = 5;
float ax = 200;
float ay = 150;
float bx = 8;
float by = 5*t;
float cx = 0.0;
float cy = 0.5+t;

float velocidade = 0.0008;

void draw() {



  float r = random(1, 6); 
  float x = ax*cos(bx*t+cx+10)+width/2;
  float y = ay*sin(by*t+cy)+height/2; 

  stroke (palette[int(r)]);
  strokeWeight(2);
  t += velocidade;
  point(x, y);
}


//condicionais

boolean pressed = true;
boolean released = true;

void mousePressed() {
  pressed = !pressed;

  if (pressed)
    velocidade = velocidade*2;
}

void mouseReleased() {
  released = !released;

  if (released)
    velocidade = velocidade/2;
}





