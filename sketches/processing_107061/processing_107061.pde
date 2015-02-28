
PImage youlose, youwin;
float x=random(-390, 390);
int y=0;
int c=0;
void setup()
{
  size(800,800);
  // define imagens caso ganhar ou perder o jogo *************************
  youlose = loadImage("youlose.jpg");
  youwin = loadImage("youwin.png");
  //**********************************************************************
}
void draw()
{ 
  frameRate(3); // reduz o tempo de iteração do programa
  background(255);  // redefine o plano de fundo a cada iteração
  rectMode(CENTER);
  fill(0);
  rect(192,790,385,20);  // limite inferior esquerdo
  rect(610,790,390,20);  // limite inferior direito
 
 
  //  verifica condição para ocorrência de imagem *************************
  if(c == 1)
  {  
    image(youwin, 150, 150);
  }
  else if (c == 2)
  {   
    image(youlose, 200, 200);
  }
  // **********************************************************************
 
 
  rectMode(CENTER);
  fill(0);
  rect(400+x,y,20,20); // quadrado utilizado na interação com usuário
  y+=20;
 
 
  // define imagem resultante, vencedor ou perdedor ***********************
  if(y >= 800 && x >= -6 && x <= 6)
  {
    c = 1;   
  }
  else if (y >= 800 && (x < -6 || x > 6))
  {
    c = 2;   
  }
  // ***********************************************************************
}

// comandos de interação do quadrado com o usuário *************************
void keyPressed(){
 if(key == CODED)
 {
  if(keyCode == LEFT)
  {
    x-=2;
  }
   else if(keyCode == RIGHT)
   {
     x+=2;
   }
   else if(keyCode == DOWN)
   {
     y+=10;
   }
   else if(keyCode == UP)
   {
     y-=10;
   }  
 }
}
// **************************************************************************
 

// condição para reiniciar o jogo *******************************************
void mousePressed()
{
    x=random(-390, 390);
    y=0;
    c=0;
}


