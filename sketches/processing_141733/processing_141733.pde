
//Nicolás Villa López
//Practica 1 - Reloj
//Realidad Virtual

float secx[];
float secy[];
int radioSec;
int tamanoSec;

float minx[];
float miny[];
int radioMin;
int tamanoMin;

float horax[];
float horay[];
int radioHora;
int tamanoHora;

float tamanoVentana;

void setup() 
{
  size(500, 500);
  tamanoVentana = width/2;

  secx = new float[60];
  secy = new float[60];
  minx = new float[60];
  miny = new float[60];
  horax = new float[12];
  horay = new float[12];

  radioSec = 400;
  tamanoSec = 15;
  radioMin = 150;
  tamanoMin = 10;
  radioHora = 80;
  tamanoHora = 30;


  for (int i = 0; i < 60; i++)
  {
    
    float min = map(i, 0, 60, 0, TWO_PI) - HALF_PI;
    minx[i] = cos(min) * radioMin + tamanoVentana;
    miny[i] = sin(min) * radioMin + tamanoVentana;
  }


  for (int i = 0; i < 12; i++)
  {
    float hora = map(i%12, 0, 12, 0, TWO_PI) - HALF_PI;
    horax[i] = cos(hora) * radioHora + tamanoVentana;
    horay[i] = sin(hora) * radioHora + tamanoVentana;
  }
}

void draw()
{
  fill(0, 0, 0, 20);
  noStroke();
  rect(0, 0, width, height);
  
  stroke(255);
  smooth();

  float s = map(second(), 0, 60, 0, -TWO_PI);
  s += PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour()%12, 0, 12, 0, TWO_PI) - HALF_PI;

  noFill();
  stroke(50,50,60);
  strokeWeight(15);
  strokeCap(PROJECT);
  arc(width/2, height/2, radioSec, radioSec, -PI/2, s+PI/2);
  strokeWeight(1);
  fill(0, 255, 0);
  ellipse(cos(m) * radioMin + tamanoVentana, sin(m) * radioMin + tamanoVentana, tamanoMin-3, tamanoMin-3);
  fill(0, 0, 255);
  ellipse(cos(h) * radioHora + tamanoVentana, sin(h) * radioHora + tamanoVentana, tamanoHora-3, tamanoHora-3);

  strokeWeight(2);
  stroke(0, 150, 0, 40);
  line(width/2, height/2, cos(m) * radioMin + tamanoVentana, sin(m) * radioMin + tamanoVentana);
  stroke(0, 0, 200, 40);
  line(width/2, height/2, cos(h) * radioHora + tamanoVentana, sin(h) * radioHora + tamanoVentana);
  
  fill(200);
  ellipse(width/2, height/2, 5,5);

  strokeWeight(0.2);
  
  for (int i = 0; i < 60; i++)
  {
    if (i%5 == 0)
    {
      strokeWeight(2);
      stroke(255, 0, 0);
    }
    else
    {
      strokeWeight(0.2);
      stroke(255);
    }

    noFill();
    ellipse(minx[i], miny[i], tamanoMin, tamanoMin);
  }


  for (int i = 0; i < 12; i++)
  {
    stroke(255);
    noFill();
    ellipse(horax[i], horay[i], tamanoHora, tamanoHora);
  }
}



