
int x, y, larg, alt;
int count = 0;

float vel=3;

int pontos=0;
int somaPontos=1;

int vidas=5;

int nivel=1;
int contNivel=0;


Boolean estado, estadoDown;


Boolean fimJogo=false;

Bala b1;

void setup()
{
  //size(displayWidth, displayHeight);

  size(600,600);

  noStroke();
  frameRate(60);
  noCursor();

  x=(width/2)-30;
  y=(int)(height-(height*0.2));
  larg=80;
  alt=30;

  b1=new Bala((int)random(50, 400), 10, y, alt);
}

void draw()
{

  if (!fimJogo)
  {

    background(0);

    textSize(20);
    fill(255);
    text("Pontos: " + pontos, (width-(width*0.95)), (height-(height*0.1)));
    text("Vidas: " + vidas, (width-(width*0.50)), (height-(height*0.1)));
    text("Nivel: " + nivel, (width-(width*0.15)), (height-(height*0.1)));

    fill(random(255),random(255),random(255));
    rect(x, y, larg, alt);
    
    
    b1.display();
    b1.mover(vel);
    estado=b1.check(x, larg);

    if (estado)
    {
      pontos=pontos+somaPontos;
      contNivel=contNivel+1;

      if (contNivel==5)
      {
        nivel=nivel+1;
        vel=vel+0.5;
        contNivel=0;
      }
    }

    estadoDown=b1.checkDownTra(y);

    if (estadoDown)
    {
      vidas--;
      if(vidas<0)
      {
        fimJogo=true;
      }
    }
  }
  
  else
  {
    textSize(width*0.1);
    fill(255);
    text("GAME OVER!",(width-(width*0.80)),height*0.5);
    textSize(width*0.025);
    text("Pressione ENTER para jogar e ESC para sair!",(width-(width*0.75)),height*0.55);
    
    if(keyPressed)
    {
      if(key == 10) //pressionar a tecla enter (keyascii enter=10)
      {
        fimJogo=false;
        pontos=0;
        vidas=5;
        nivel=0;
        contNivel=0;
        vel=3;
      }
    }
    
  }
}

/*boolean sketchFullScreen() {
  return true;
}*/


class Bala
{
  float x; //posicao gerada aletoria para o x do novo elemento bala
  float y; // posicao inicial do y do novo elemento
  float posYTra; //obtem a posicao do y do traco inferior
  float altTra; // obtem a altura do traco inferior
  
  int[] cor = new int[3];
  
  Bala(int _x, int _y, int _posTra, int _altTra)
  {
    x=_x;
    y=_y;
    posYTra=_posTra;
    altTra=_altTra;
    
    for(int i=0;i<3;i++)
    {
      cor[i]=(int)random(255);
    }
    
  }
  
  void mover(float vel)
  {
    y=y+vel;
  }
  
  void display()
  {
    fill(cor[0],cor[1],cor[2]);
    rect(x,y,20,20);
    
  }
  
  Boolean check(int xPosTra, int larTra)
  {
    Boolean estado=false;
    
    if(y>=posYTra && y<=posYTra+altTra && x>=xPosTra && x<=xPosTra+larTra)
    {
      y=0;
      
      for(int i=0;i<3;i++)
      {
        cor[i]=(int)random(255);
      }
      
      x=random(50,400);
      estado=true;
    }
    else
    {
      estado=false;
    }
    
    return estado;
  }
  
  Boolean checkDownTra(int yPosTra)
  {
    Boolean estado=false;
    
    if(y>yPosTra+altTra+1)
    {
      y=0;
      
      for(int i=0;i<3;i++)
      {
        cor[i]=(int)random(255);
      }
      
      x=random(50,400);
      estado=true;
    }
    else
    {
      estado=false;
    }
    
    return estado;
  }
  
}
void mouseMoved()
{
  if(mouseX>0 && mouseX<width-larg)
  {
    x=mouseX;
  }
}



