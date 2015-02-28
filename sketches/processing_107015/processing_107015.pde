
//Tiro ao alvo
//Marynea e Rodrigo K.

PImage img;
int vx = 2;// Velocidade inicial em x
int vy = 2;//Velocidade inicial em y
float x = random(100, 500);//Posição inicial em x
float y = random(100, 500);//Posição inicial em y
float r = random(0,255);// valor para vermelho
float g = random(0,255);//valor para verde
float b = random(0,255);//valor para azul
int pontos = 0; //Pontuação


void setup() {
  size(600, 600);
  img = loadImage("http://www.insetnetrj.com.br/template/pragas/mosca.png");
  noCursor();
}

void draw() {
  background(r, g, b);
  fill (255-r, 255-g, 255-b);
  text ("Pontos: "+pontos, 10, 10);
  noFill();
  stroke(0);
  // Desenha a mira
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseX,mouseY,10,10);
  line(mouseX,mouseY-40,mouseX,mouseY+40);
  line(mouseX-40,mouseY,mouseX+40,mouseY);
  
  //"desenha" a mosca
  image(img, x, y, 50,50);
  
  //Movimento da mosca
  x+=vx;
  y+=vy;
  //Caso a mosca toque em uma das bordas da janela, ela muda o sentido do movimento
  if (x>=550 || x<=0)
  {
    vx*=-1;
  }
  if (y>=550 || y<=0)
  {
    vy*=-1;
  }
}

void mousePressed() {
  //Se a pessoa acertar a área que a mosca ocupa:
  if (mouseX >=x && mouseX <= x+50 && mouseY >=y && mouseY <= y+50) {
    //A cor do fundo muda:
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    //A coordenada da mosca muda
    x=random(100,500);
    y=random(100,500);
    //Aumento da pontuação
    pontos ++;
    if (pontos>5)
    {
        noLoop();
        background(0);
        fill(255);
        textSize(90);
        text("PARABÉNS!!!", 10, 300);
        
    }
    // A velocidade da mosca muda:
    
    //Limita a velocidade da mosca
    if (vx>=20)
      vx = 1;
    else if (vx<= -20)
      vx =-1;
    if (vx>=20)
      vx = 1;
    else if (vx<= -20)
      vx =-1;
      
    //Aumenta a velocidade da mosca  
    if (vx>0)
      vx++;
    else
      vx--;
    if (vy>0)
      vx++;
    else
      vy--;
  }
}
