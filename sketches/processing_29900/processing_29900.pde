
int x_bola, y_bola;
 
int x_direcao, y_direcao;
 
int x_fundo, y_fundo;
 
boolean bStop;
 
int pontos, pontos1, pontos2;
 
int Vidas, mode;
 
int cont;
 
int r,v,b;
 
void setup()
{
  size(400,435);
  background(0);
 
  x_fundo = 60;
  y_fundo = width-25;
 
  x_direcao = -3;
  y_direcao = -6;
 
  x_bola = 200;
  y_bola = 200;
 
  pontos = 0;
  pontos1 = 0;
  pontos2 = 0;
 
  mode = 0;
  Vidas = 3;
 
  cont = 10;
 
  r = 0;
  v = 128;
  b = 255;
 
  PFont pong = loadFont("pong.vlw");
  textFont(pong, 20);
}
 
void draw()
{
  tout();
}
void tout() {
  if (cont==10) {
    entrar();
  }
  if (cont==20) {
    text("Clica  para recomeçar", 100, 200);
    if(mousePressed) {
      reset();
    }
  }
}
 
 
void reset() {
  background(0);
  x_direcao = -3;
  y_direcao = -6;
  x_bola = 200;
  y_bola = 200;
  pontos = 0;
  Vidas = 3;
  cont = 10;
}
 
void entrar() {
  if(mousePressed)
  {
    mode = 2;
  }
    if(mode == 0) {
    fill(r, v, b);
    stats();
    text("Clica para começar",100,200);
  }
  if (mode == 2) {
    jogo();
  }
 }
void limpar()
{
  background(0);
}
 
void desenho()
{
  smooth();
  fill(190,213,219);
  stroke(190,213,219);
 
  rect(x_fundo,y_fundo,85,5);
 
  ellipse(x_bola,y_bola,10,10);
}
 
void mexer()
{
  x_bola = x_bola + x_direcao;
  y_bola = y_bola + y_direcao;
 
  if(keyPressed) {
    if(keyCode == LEFT && x_fundo > 0) {
      x_fundo -= 5;
    }
 
    if(keyCode == RIGHT && x_fundo < 315) {
      x_fundo+= 5;
    }
    else
    {
      x_fundo = x_fundo;
    }
  }
}
 
void ressalto()
{
  if (x_bola > width-5 && x_direcao > 0)
  {
    x_direcao = -x_direcao;
  }
 
   if (x_bola < 5)
  {
    x_direcao = -x_direcao ;
  }
  if (y_bola>y_fundo-5 && x_bola > x_fundo && x_bola<x_fundo+85)
  {
    y_direcao = -y_direcao;
    pontos++;
  }
  if (y_bola>y_fundo+10 && x_bola > x_fundo && x_bola<x_fundo+85)
  {
    y_direcao = -y_direcao;
    pontos++;
  }
 
  if (y_bola < 50)
  {
    y_direcao = -y_direcao;
  }
 
  if (y_bola > width - 10)
  {
    if(Vidas > 0)
    {
      y_direcao = -y_direcao;
      Vidas--;
      print("Restam : ");
      print(Vidas);
      println(" Vidas");
    }
    if(Vidas == 0)
    {
      println("Perdeu");
      println("Pontos : ");
      println(pontos);
      cont = 20;
    }
  }
}
 
void jogo()
{
 
  limpar();
  mexer();
  ressalto();
  desenho();
 
  if(pontos>pontos1)
  {
    print("Pontos : ");
    println(pontos);
    pontos1++;
  }
 
  if(pontos > pontos2+19) {
    Vidas++;

    pontos2 = pontos;
  }
  fill(r, v, b);
  text("Criado por Diogo Carvalho",55,425);
  stats();
}
 
void stats() {
  stroke(r,v,b);
  line(0,40,400,40);
  line(0,405,400,405);
  text("PONG", 175,30);
  text("Pontos : ", 50, 30);
  text(pontos, 110, 30);
  text("Vidas : ", 300,30);
  text(Vidas,350,30);
}

