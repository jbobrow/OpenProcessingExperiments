
float var = 5;
int verifica = 0, x_pos = 0;

void setup() 
{
  size(1000,300);
  stroke(3);
  fill(#FFE203);
  smooth();
  frameRate(80);
  }
//fantasma
void fantasma(int x, int y)
{
  PImage fantasma;
  fantasma = loadImage("fantasma_2.png");
  image(fantasma, x, y);
  }
int inc=0;  
void draw() 
{
  background(#FFFFFF);
  stroke(255, 255, 0);
  fill(255, 255, 0);
  //fantasma
  fantasma(100+inc, 100);
  inc += 2.5;
  
  //pacman
  arc(x_pos,138,100,85,0,(var*PI)/3);
  if(verifica == 1) 
  {
    var -= 0.1;
    if(var == 5.0)
    verifica = 0;
    }
  if(verifica == 0) 
  {
    var += 0.1;
    if(parseInt(var) == 6)
    verifica = 1;
    }
    if(x_pos >= 850)
    x_pos = 70;
    x_pos += 2;
}


