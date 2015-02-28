
//Torres Torres Felipe Andrés
//Hernandez Cruz Yanahui

PImage foto;

void setup()
{
  size(500,500);
  foto = loadImage("fondo.jpg");
}

void draw()
{
  background(0);
  image(foto,0,0);
  arma();
  invasores();
  finjuego();

}

//El arma
void arma()
{
  fill(0,255,0);
  stroke(color(0,255,0));
  triangle(mouseX-8, 480, mouseX, 465, mouseX+8, 480);
}

//Invasores
int[] coordenadasXinvasor = { int(random(500)), int(random(500)),
                              int(random(500)),int(random(500)),
                              int(random(500))
                              };
int[] coordenadasYinvasor = {0,0,0,0,0};
int diametroInvasor = 10;

int r,g,b;

void invasores()
{
  stroke(255);
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  
  fill(r,g,b);
  for(int i=0; i<5; i++)
  {
    ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i]++,
    diametroInvasor, diametroInvasor);
  }
}

//El disparo (!clic en el mouse)
void mousePressed()
{
  proyectil(mouseX);//tomamos la posicion x del disparo(de mouse)
}

//Proyectil
void proyectil(int disparoX)
{
  boolean acertar = false;
  for(int i=0; i<5; i++)
  {
    if((disparoX >= (coordenadasXinvasor[i] - diametroInvasor/2))
    && (disparoX <= (coordenadasXinvasor[i] + diametroInvasor/2)))
    {
      acertar = true;
      line(mouseX,465, mouseX, coordenadasYinvasor[i]);    
     
      ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i]++,
    diametroInvasor+25, diametroInvasor+25);//explota
    
    coordenadasXinvasor[i] = int(random(500));
    coordenadasYinvasor[i] = 0;  
    
    }
  }
  if(acertar == false)
  {
    line(mouseX,465,mouseX,0);//Falló, el proyectil se va hasta arriba
  }
}

void finjuego()
{
  for(int i=0; i<5; i++)
  {
    if(coordenadasYinvasor[i] == 500)
    {
      noLoop();      
    }
  }
}

//es.surveymonkey.com/s/WP8J8rj

