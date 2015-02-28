
size (800,600);// define o tamanho da janela
background (0); // define a cor do background
smooth ();// aplica anti-alias


for (int r=0; r<100; r=r+1) {
  stroke (255, 50);//define a cor da linha
  float corpo = random (0, 3);//define uma variável
  ellipse (random (width), random (height), corpo, corpo);//cria uma forma
}

noStroke ();
noFill();

//define variáveis
float x1, y1; //ponto 1
float x2, y2; //point 2

float radius;
radius = 200;

x1 = width/2;
y1 = height/2;


float x01, y01; //ponto 1
float x02, y02; //ponto 2

float radius0;
radius0 = 80;

float radius1;
radius1 = 350;

x01 = width/2;
y01 = height/2;

float x04 = 50;
float y05 = 100;

float x06 = 550;
float y07 = 500;


//define o angulo
for (int angle0=0; angle0<360; angle0=angle0+1)
{
  float rad0 = -radians (angle0);
x02 = radius1 * cos (rad0); 
y02 = radius0 * sin (rad0);

//define as caracteristicas da linha

  stroke (random (100), 150, y01,20);
  strokeWeight (random (1,3));
line (x01,y01,width/2+x02,height/2+y02);

line (x06,y07,width/2+x02,height/2+y02);

line (x04,y05,width/2+x02,height/2+y02);

saveFrame ("polar2.tiff"); //salva uma imagem
}

