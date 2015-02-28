
int tamanho=12;
int colunas=600/tamanho;
int linhas=600/tamanho;
Grama[][] Comida=new Grama[colunas][linhas];
ArrayList<Bicho> Animais=new ArrayList<Bicho>(0);
int i, j;

void setup()
{
  size(600, 600);
  for(i=0; i<colunas; i=i+1)
  {
    for(j=0; j<linhas; j=j+1)
    {
      Comida[i][j]=new Grama();
    }
  }
  noStroke();
}

void draw()
{
  if(mousePressed && mouseButton==RIGHT)
  {
    Comida[floor(mouseX/tamanho)][floor(mouseY/tamanho)].qtd=100;
  }
  for(i=0; i<colunas; i=i+1)
  {
    for(j=0; j<linhas; j=j+1)
    {
      Comida[i][j].crescer();
    }
  }
  for(i=0; i<Animais.size(); i=i+1)
  {
    Animais.get(i).viver();
  }
}

void keyPressed()
{
  if(key==ENTER)
  {
    for(i=0; i<colunas; i=i+1)
    {
      for(j=0; j<linhas; j=j+1)
      {
        Comida[i][j]=new Grama();
      }
    }
  }
}

void mousePressed()
{
  if(mouseButton==LEFT)
  {
    Animais.add(new Bicho(100, int(mouseX/tamanho), int(mouseY/tamanho)));
  }
}

class Bicho
{
  int posx;
  int posy;
  float energia;
  
  Bicho(int tenergia, int tposx, int tposy)
  {
    posx=tposx;
    posy=tposy;
    energia=tenergia;
  }
  
  void viver()
  {
    if(energia<=0)
    {
      Animais.remove(i);
    }
    else
    {
      if(posx<0)
      {
        posx=colunas-1;
      }
      if(posx>colunas-1)
      {
        posx=0;
      }
      if(posy<0)
      {
        posy=linhas-1;
      }
      if(posy>linhas-1)
      {
        posy=0;
      }
      if(Comida[posx][posy].qtd>0)
      {
        Comida[posx][posy].qtd=Comida[posx][posy].qtd-1;
        energia=energia+1;
      }
      else
      {
        posx=posx+floor(random(-1, 2));
        posy=posy+floor(random(-1, 2));
      }
      if(energia>120)
      {
        Animais.add(new Bicho(60, posx, posy));
        energia=60;
      }
      fill(map(energia, 0, 100, 0, 255), 0, 0);
      ellipse(posx*tamanho+tamanho/2, posy*tamanho+tamanho/2, tamanho-2, tamanho-2);
      energia=energia-0.4;
    }
  }
}

class Grama
{
  int qtd;
  int taxa;
  int a;
  
  Grama()
  {
    qtd=int(random(100));
    taxa=int(random(500, 1000));
  }
  
  void crescer()
  {
    if(a>=taxa && qtd<100)
    {
      qtd=qtd+10;
      a=0;
    }
    else
    {
      a=a+1;
    }
    fill(0, map(qtd, 0, 100, 100, 255), 0);
    rect(i*tamanho, j*tamanho, tamanho, tamanho);
  }
}
