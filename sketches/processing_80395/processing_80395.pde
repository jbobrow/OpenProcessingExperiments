
int[]coordenadasxinvasor ={int(random(600)),
int(random(600)),
int(random(600)),
int(random(600)),
int(random(600))};
int[]coordenadasyinvasor={0,0,0,0,0};
int diametroInvasor=15;
int numero=0;
PImage fondo;



void setup()
{
  size(500,500);
  fondo = loadImage("fondo1.jpg"); 
  image(fondo,0,0);
}

void draw()
{
  background(fondo);
  arma();
  invasores();
  fin(); 
  textSize(35);
}

void arma()
{
  fill(0);
  triangle(mouseX-8, 480, mouseX, 465, mouseX+8, 480);
}

void invasores()
{
  stroke(0);
  fill(0);
  for(int i=0; i<5; i++)
  {
  ellipse(coordenadasxinvasor[i], coordenadasyinvasor[i]++, diametroInvasor,diametroInvasor);
  }
}

void mousePressed()
{
  proyectil(mouseX);
}

void proyectil(int disparox)
{
  boolean acertar = false;
  for(int i=0; i<5; i++)
  {
    if((disparox >= (coordenadasxinvasor[i] - diametroInvasor/2)) && (disparox <=(coordenadasxinvasor[i]+diametroInvasor/2)))
    {
      acertar = true;
      stroke(0);
      line(mouseX, 465, mouseX, coordenadasyinvasor[i]);
      ellipse(coordenadasxinvasor[i], coordenadasyinvasor[i], diametroInvasor+25, diametroInvasor+25);
      coordenadasxinvasor[i] = int(random(600));
      coordenadasyinvasor[i] = 0;
      numero++;
    }
  }
  if(acertar == false)
  {
    stroke(color(255,0,0));
    line(mouseX, 565, mouseX, 0);
  }
}


void fin()
{
 for (int i=0; i<5; i++)
 {
   if(coordenadasyinvasor[i] == 500)
   {
     noLoop();
     fill(0);
     text("PERDISTE!!!",155,250);
     text("Total: ",155,290);
     text(numero,260,290);
   }
 }
}




