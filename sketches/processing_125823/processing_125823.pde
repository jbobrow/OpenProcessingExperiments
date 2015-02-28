
void setup()
{
  size(1000, 500);
  
}

int base = 40;
int qtdRodas;
  
void fundo()
{
  background(#B75E3D);
  fill(#67C4E8);
  quad(0, 0, 0, 360, 1000, 360, 1000, 0);
}

void tanque(float base)
{  
  //desenho do tanque

  for (qtdRodas=0; qtdRodas<1; qtdRodas++)
  {
    strokeWeight(2);     
    fill(#547C3B);
    ellipse(base, 340, 40, 40);
    ellipse(base+40, 340, 40, 40);
    ellipse(base+80, 340, 40, 40);
    ellipse(base+120, 340, 40, 40);
    ellipse(base+160, 340, 40, 40);
    ellipse(base+200, 340, 40, 40);
  }
  /*nao descobri um jeito de desenhar um tanque usando float
   e depois ir atualizando os valores sem que desse problemas*/

  strokeWeight(2);
  fill(#8CC169);
  rect(base-40, 300, 280, 40);
  fill(#27501F);
  rect(base+160, 282, 190, 15);
  fill(#386C2E);
  rect(base, 275, 200, 30);
  
}

void draw()
{
  fundo();
  tanque(base); 
  base += 1;
  if(base >= 800)
  {
    base = 30;
  }  
}

