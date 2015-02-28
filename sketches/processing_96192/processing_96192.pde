
/*
Exercício 4 da avaliação formal de 9 mde abril de 2013
Um esboço interativo divide a tela de saída em quadro regiões de mesmo tamanho. 
Quando o mouse está sobre o quadrante superior esquerdo, o fundo é vermelho. 
Quando o mouse está sobre o quadrante superior direito,  o fundo é verde. 
Quando o mouse está sobre o quadrante inferior esquerdo, o fundo é desenhado azul. 
Quando o mouse está sobre o quadrante inferior direito, fundo é desenhado preto. 
Ao centro da tela um quadrado 20 por 20, dividido também em quatro, e desenhado com as repectivas cores dos quadrantes de controle. 
Desenvolva tal esboço. 
*/
// exemplo de solução

void setup() {
size(200,200);
}

void draw()
{
  int x = mouseX;
  int y = mouseY;

  // escolha da cor a desenhar o fundo
  if (x<width/2) // esquerda
  {
    if (y<height/2)  //superior
    {
      fill(255, 0, 0);
    }
    else  // inferior
    {
      fill(0, 0, 255);
    }
  }
  else  // direita
  {
    if (y<height/2) // superior
    {
      fill(0, 255, 0);
    } 
    else // inferior
    { 
      fill(0, 0, 0);
    }
  }
  noStroke();
  rect(0, 0, width, height); // desenho do fundo

  // desenho dos pequenos retangulos
  fill(255, 0, 0);  //vermelho
  rect(width/2-10, height/2-10, 10, 10);

  fill(0, 255, 0); // verde
  rect(width/2, height/2-10, 10, 10);

  fill(0, 0, 255); // azul
  rect(width/2-10, height/2, 10, 10);

  fill(0, 0, 0); // preto
  rect(width/2, height/2, 10, 10);
}
