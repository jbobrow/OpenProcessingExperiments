
// @autor Jorge Luiz dos Santos Ramos Junior
// 1.0  (16/abr/2014) - versao basica sem animacao (http://pastebin.com/M0k13SVV)
// 1.1  (25/abr/2014) - inclusao de setup() draw() classe Barco e animacao (http://pastebin.com/LKRhw6Wm)
// 1.2  (05/mai/2014) - add randomizacao, classes Sol e Agua (http://www.openprocessing.org/sketch/145877)
// 1.23 (05/mai/2014) (esta versao!) - adicionada funcionalidade RAVE

/* inspiracao: Com quantos gigabytes
               Se faz uma jangada
               Um barco que veleje
               Um barco que veleje
               
   o codigo eh uma tentativa de visualizacao desse trecho */
   
// recurso usado: http://www.processing.org/tutorials/objects/
// versao basica: http://pastebin.com/M0k13SVV

// variaveis
Barco b;
Agua w;
Sol s;
color bg;

int omg = 0; // :o

void setup()
{
  // definicao da janela
  size(800,600);
  bg = color(64,192,255);
  
  // definicoes do barco
  float xb = 200; // posicao inicial no eixo x
  color c1b = color(40,8,8); // cor do barco
  color c2b = color(248,248,248); // cor da bandeira e do texto
  int lb = 300; // largura
  int ab = 325; // altura
  float vb = 12.5; // velocidade em pixels
  
  // definicoes do sol
  int ts = 100; // tamanho
  float xs = 700; // posicao inicial
  color cs = color(255,192,0); // cor
  float vs = 0; // velocidade
  
  // definicoes da agua
  color ca = color(0,0,192); // cor

  // cria objetos
  b = new Barco(xb, c1b, c2b, lb, ab, vb);
  s = new Sol(xs, ts, cs, vs);
  w = new Agua(ca);
}


void draw()
{
  noStroke();
  background(bg);

  b.move();
  b.display();
  
  s.move();
  s.display();
  
  w.display();
}


void chaos()
{
  w.randomize();
  s.randomize();
  if (omg == 0)
  {
    int r = 64 + (int)random(191);
    bg = color(r/4,r*3/4,r);
  }
  else
  {
    bg = color((int)random(255),(int)random(255),(int)random(255));
  }
}


void keyPressed()
{
  chaos();
  if (key == ENTER)
  {
    if (omg != 1) { omg = 1; } else { omg = 0; }
    bg = color((int)random(255),(int)random(255),(int)random(255));
  }
}


class Barco
{
  // ver declaracao em setup() para explicacao das variaveis
  float x; color c1; color c2; int l; int a; float v;

  Barco(float x, color c1, color c2, int l, int a, float v)
  { this.x = x; this.c1 = c1; this.c2 = c2; this.l = l; this.a = a; this.v = v; }

  // tamanhos em funcao de l, h escolhidos por algo de tentativa e erro :D
  void display()
  {
    // cor para o corpo e a haste
    fill(c1);
    
    // corpo
    rect(x, 400, l, 100);
    triangle(x-l/3, 400, x, 400, x, 500);
    triangle(x+l, 400, x+l, 500, x+l+l/3, 400);
    
    // haste
    rect(x+3*l/7, 400-a, l/7, a);
    
    // cor para a bandeira e o texto
    fill(c2);
    
    // bandeira
    triangle(x+4*l/7, 400-a, x+l, 400-a, x+4*l/7, 400-5*a/6);
    
    // texto
    textSize(32);
    text("GB", x+l/30, 460);
  }
  
  void move()
  {
    // v pixels por passo
    x = x + v;
    
    // verifica se wtf mode
    if (omg == 1) { v = 69; }
    
    // retorna para a esquerda ao alcancar a direita
    // l/3 eh a largura de um dos triangulos que compoem os lados
    // portanto, o barco deve retornar apenas quando o triangulo passar da direita
    // e retornar aparecendo com a ponta do triangulo da direita  
    if (x > width+l/3)
    {
      randomize(); // randomiza o barco a cada iteracao
      x = 0-l-l/3; // posicao inicial: l = largura do casco, l/3 largura do triangulo
    }
  }
  
  void randomize()
  {
      l = int(random(555));
      a = int(random(400));
      c1 = color((int)random(255),(int)random(255),(int)random(255));
      c2 = color((int)random(255),(int)random(255),(int)random(255));
      
      v = random(5)+10; // velocidade minima de 10
      
      chaos();
  }
}


class Agua
{
  color c; // cor da agua
  
  Agua(color c)
  {
    this.c = c;
  }

  void display()
  {
    fill(c);
    rect(0,500,width,100);
  }

  void randomize()
  {
    c = color(0, 0, 64+(int)random(191));
  }
}


class Sol
{
  float x; int t; color c; float v;
  float y = 100; float vy; // :o

  Sol(float x, int t, color c, float v)
  { this.x = x; this.t = t; this.c = c; this.v = v; }

  void display()
  {
    fill(c);
    ellipse(x,y,t,t);
  }
  
  void move()
  {
    x = x + v;
    y = y + vy;
    
    // mudar orientacao ao alcancar os lados
    // tambem atualizar a posicao para "in bounds", para nao haver o risco de o sol ficar travado na borda
    // se wtf mode, tambem adicionar vy
    if (x+t/2 > width) { x = width-t/2; v = v*-1; updatevy(); }
    if (x-t/2 < 0) { x = t/2; v = v*-1; updatevy(); }
    
    // coisas vy
    if (y+t/2 > height) { y = height-t/2; updatevy(); }
    if (y-t/2 < 0) { y = t/2; updatevy(); } 
  }
  
  void randomize()
  {
    if (omg == 0) // cores normais
    {
      c = color(255, 64+(int)random(191), 0);
      v = random(-5, 5);
    }
    if (omg == 1) // qualquer coisa
    {
      c = color((int)random(255),(int)random(255),(int)random(255));
      v = random (-69, +69); 
    }
  }
  
  void updatevy()
  {
     if (omg == 1) { vy = random(-10, 10); } else { vy = 0; }
  }
}

