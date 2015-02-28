
int tamanho=10;
int colunas=600/tamanho+2;
int linhas=600/tamanho+2;
Quad[][] quad=new Quad[colunas][linhas];
boolean[][] antiga=new boolean[colunas][linhas];
int i, j;
boolean simular=false;

void setup()
{
  size((colunas-2)*tamanho, (linhas-2)*tamanho);
  cursor(ARROW);
  for(i=0; i<colunas; i=i+1)
  {
    for(j=0; j<linhas; j=j+1)
    {
      quad[i][j]=new Quad();
      antiga[i][j]=false;
    }
  }
  noStroke();
}

void draw()
{
  if(mousePressed)
  {
    if(mouseButton==LEFT)
    {
      quad[floor(mouseX/tamanho)+1][floor(mouseY/tamanho)+1].estado=true;
      antiga[floor(mouseX/tamanho)+1][floor(mouseY/tamanho)+1]=true;
    }
    if(mouseButton==RIGHT)
    {
      quad[floor(mouseX/tamanho)+1][floor(mouseY/tamanho)+1].estado=false;
      antiga[floor(mouseX/tamanho)+1][floor(mouseY/tamanho)+1]=false;
    }
  }
  for(i=1; i<colunas-1; i=i+1)
  {
    for(j=1; j<linhas-1; j=j+1)
    {
      antiga[i][j]=quad[i][j].estado;
    }
  }
  for(i=1; i<colunas-1; i=i+1)
  {
    for(j=1; j<linhas-1; j=j+1)
    {
      if(simular)
      {
        quad[i][j].simular();
      }
      quad[i][j].desenhar();
    }
  }
}

void keyPressed()
{
  if(key=='c' || key=='C')
  {
    for(i=0; i<colunas; i=i+1)
    {
      for(j=0; j<linhas; j=j+1)
      {
        quad[i][j].estado=false;
        antiga[i][j]=false;
      }
    }
    simular=false;
  }
  if(key==ENTER)
  {
    simular=!simular;
  }
}
class Quad
{
  boolean estado;
  int vizinhos;

  Quad()
  {
    estado=false;
    vizinhos=0;
  }

  void simular()
  {
    vizinhos=0;
    if(antiga[i-1][j-1])  //1
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i][j-1])  //2
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i+1][j-1])  //3
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i-1][j])  //4
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i+1][j])  //6
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i-1][j+1])  //7
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i][j+1])  //8
    {
      vizinhos=vizinhos+1;
    }
    if(antiga[i+1][j+1])  //9
    {
      vizinhos=vizinhos+1;
    }
    if(estado)
    {
      if(vizinhos<2 || vizinhos>5)  //Stay
      {
        estado=false;
      }
    }
    else
    {
      if(vizinhos>3 && vizinhos<9)  //Begin
      {
        estado=true;
      }
    }
  }
  
  void desenhar()
  {
    if(estado)
    {
      fill(random(100, 150), 0, 0);
    }
    else
    {
      fill(0);
    }
    rect((i-1)*tamanho, (j-1)*tamanho, tamanho, tamanho);
  }
}
