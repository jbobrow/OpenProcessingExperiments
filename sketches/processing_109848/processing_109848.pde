
// Configuracao dos status dos quadrados
final int ativo = 1;
final int clicado = 2;
final int clicado_2 = 3;
final int inativo = 4;
// Criando o tabuleiro
int tabuleiro[][] = 
{
  {ativo, ativo, ativo, ativo},
  {ativo, ativo, ativo, ativo},
  {ativo, ativo, ativo, ativo},
  {ativo, ativo, ativo, ativo}
};
// Variáveis que servem como parâmetros para criar os items.
int colunas = 4; 
int linhas = 4; 
int ladox; 
int ladoy;
// Variaveis que armazenam, temporariamente, a posicao dos cliques 
int cliques = 0;
int pos_1_x = 0;
int pos_1_y = 0;
int pos_2_x = 0;
int pos_2_y = 0;
int tentativas = 0;
int pontos = 0;
int dificuldade = 20;
// Vetor para sortear as imagens.
int pares[] = {2, 3, 4, 5, 6, 7, 8, 9, 20, 30, 40, 50, 60, 70, 80, 90};
// Iniciando os dados da tela do jogo
void setup()
{ 
  size(400, 500); 
  strokeWeight(2); 
  ladox = 100; 
  ladoy = 100;
  shuffle(pares);// Embaralha os valores
  atribuiAleatorio(); //Incorpora os valores aleatorios na matriz
  noLoop();
}
// Desenhando os quadrados
void draw() { 
  background(0);
  for (int i = 0; i < colunas; i++)
  { 
    for (int j = 0; j < linhas; j++)
    { // Definindo as caracteristicas dos status
     switch(tabuleiro[i][j])
       {
        case ativo: // ativo e o status inicial, onde o item pode ser clicado para encontrar seu par.
          fill(235);
        break;
        case clicado: // clicado e o status de "aguardando", no caso revela a imagem, aguardando a escolha do proximo item.s
          desenhaCor();
        break;
        case clicado_2: // inativo e o status final, onde o item ja foi "casado" com seu correspondente.
          desenhaCor_2();
        break;
        case inativo: // inativo e o status final, onde o item ja foi "casado" com seu correspondente.
          fill(0);
        break;
       }
       if (tentativas<dificuldade) // Total de tentativas permitidas
       {
       rect(j*ladox, i*ladox, ladox, ladoy); // Desenha os quadrados que representam os itens.
       }
       else // Fim de jogo
       {
         fill(255);
         textSize(18);
         text("Acabaram as tentativas", 105,100);
         textSize(40);
         text("Fim de jogo", 90,180);
       }
       if ((pontos == 8)&&(tentativas<(dificuldade-1)))
       {
         fill(255);
         textSize(40);
         text("Parabéns", 110,100);
         textSize(20);
         text("Fim de jogo", 140,180);
       }
    }
    fill(255);
    textSize(22);
    text("Jogo da Memória", 10,430);
    textSize(14);
    text("Resetar", 340,430); // Botão de resetar o jogo
    textSize(18);
    text("Tentativas = ", 10,465);
    text(tentativas, 130, 465); // Exibe as tentativas
    text("/", 152, 465);
    text(dificuldade, 170, 465); // Exibe a dificuldade
    text("fácil", 10, 490);
    text("médio", 60, 490);
    text("difícil", 130, 490);
    textSize(14);
    text("Ariane Lao", 320, 470);
    text("Rodrigo Kovalski", 280, 490);
  }
}
// Interação com o mouse
void mousePressed() {
  cliques+=1; // Incrementa o numero de cliques realizados.
  if(cliques==1) // Primeira "clicada": a função programa vai selecionar o primeiro item.
  {
     pos_1_x = (retornaPosX()); // Chama uma função que pela posição do mouse retorna o valor da matriz na posição X.
     pos_1_y = (retornaPosY()); // Chama uma função que pela posição do mouse retorna o valor da matriz na posição Y.
     if(mouseY<=400) // Verifica se o mouse não está fora da "área jogável"
     {
       if (tabuleiro[pos_1_y][pos_1_x] == ativo) //Verifica se o item não está inativo
         {
         tabuleiro[pos_1_y][pos_1_x] = clicado; // Muda o status do item para clicado
         redraw();
         }
       else // Para item inativo reseta os cliques
         {
           cliques = 0;  
         }
     }
     else //Quando clicar fora não contar como "jogada"
     {
       cliques = 0; 
     } 
  }
  else if((cliques==2)&&(tabuleiro[pos_1_y][pos_1_x] != inativo)) // Segunda "clicada": a função vai selecionar o segundo item, se ele não for o mesmo que o primeiro.
  {
     pos_2_x = (retornaPosX()); // A função é chamada novamente, sendo possivel pois ela é genérica.
     pos_2_y = (retornaPosY());
     if(mouseY<=400) // Verifica se o mouse não está fora da "área jogável"
     {
       if(((pos_2_x)!=(pos_1_x))||(pos_2_y)!=(pos_1_y)) // Checa se o item clicado não é o mesmo que o anterior
       {
         if(tabuleiro[pos_2_y][pos_2_x] == ativo) //Verifica se o item não está inativo
         {
           tabuleiro[pos_2_y][pos_2_x] = clicado_2; // Muda o status do item para clicado
         }
         else // Para item inativo volta um clique
         {
         cliques = 1;  
         }  
       }
     }
     if(((tabuleiroOrdenado[pos_1_y][pos_1_x])==(tabuleiroOrdenado[pos_2_y][pos_2_x])/10)||((tabuleiroOrdenado[pos_2_y][pos_2_x])==(tabuleiroOrdenado[pos_1_y][pos_1_x])/10))// Verifica paridade
      {
      tabuleiro[pos_1_y][pos_1_x] = inativo; // reseta valores
      tabuleiro[pos_2_y][pos_2_x] = inativo;
      pos_1_x = 0;
      pos_1_y = 0;
      pos_2_x = 0;
      pos_2_y = 0;
      cliques = 0;
      tentativas+=1; // Incrementa o total de tentativas.
      pontos+=1; // Marca um ponto
      }
     redraw();
  }
  else if(cliques>=3) // Caso de não ocorrer os pares correspondentes ele "reseta" os cliques e os items selecionados.
  {
    if(tabuleiro[pos_1_y][pos_1_x] == clicado)
    {
      tabuleiro[pos_1_y][pos_1_x] = ativo;
    }
    if(tabuleiro[pos_2_y][pos_2_x] == clicado_2)
    {
      tabuleiro[pos_2_y][pos_2_x] = ativo;
    }
    pos_1_x = 0;
    pos_1_y = 0;
    pos_2_x = 0;
    pos_2_y = 0;
    cliques = 0;
    tentativas+=1; // Incrementa o total de tentativas.
    redraw();
  }
  if ((mouseX>340 && mouseX<500)&&(mouseY>425 && mouseY<440)) // Botao de reset
  {
    resetarJogo ();
  }
  if ((mouseX>10 && mouseX<50)&&(mouseY>475 && mouseY<495)) // Botao do modo Fácil
  {
    dificuldade = 30;
    resetarJogo ();
  }
  if ((mouseX>60 && mouseX<120)&&(mouseY>475 && mouseY<495)) // Botao do modo Médio
  {
    dificuldade = 20;
    resetarJogo ();
  }
  if ((mouseX>130 && mouseX<180)&&(mouseY>475 && mouseY<495)) // Botao do modo Difícil
  {
    dificuldade = 10;
    resetarJogo ();
  }
}
// Função que pega a posição X de acordo com a posição do mouse.
int retornaPosX()
{
  int retorno_pos_x = 0;
  if(mouseX>0 && mouseX<100)
  {
  retorno_pos_x = 0;
  }
  else if(mouseX>100 && mouseX<200)
  {
  retorno_pos_x = 1;
  }
  else if(mouseX>200 && mouseX<300)
  {
  retorno_pos_x = 2;
  }
  else if(mouseX>300 && mouseX<400)
  {
  retorno_pos_x = 3;
  }
  return retorno_pos_x; // Valor da posicao na matriz
}
// Função que pega a posição Y de acordo com a posição do mouse.
int retornaPosY()
{
  int retorno_pos_y = 0;
  if(mouseY>0 && mouseY<100)
  {
  retorno_pos_y = 0;
  }
  else if(mouseY>100 && mouseY<200)
  {
  retorno_pos_y = 1;
  }
  else if(mouseY>200 && mouseY<300)
  {
  retorno_pos_y = 2;
  }
  else if(mouseY>300 && mouseY<400)
  {
  retorno_pos_y = 3;
  }
  return retorno_pos_y;
}
// Embaralha os valores
void shuffle(int[] pares)
{
  int temp;
  int escolha;
   for(int i=0; i<pares.length; i++)// Embaralha os valores
     {
       temp = pares[i];
       escolha  = (int)random(16);
       pares[i] = pares[escolha];
       pares[escolha]= temp;
     }
}
// Atribui os itens ao valor aleatorio
int tabuleiroOrdenado [] [] = {
  {pares[0], pares[1], pares[2],pares[3]},
  {pares[4], pares[5], pares[6],pares[7]},
  {pares[8], pares[9], pares[10],pares[11]},
  {pares[12], pares[13], pares[14],pares[15]}
};
// Faz o aleatorio funcionar na matriz;
void atribuiAleatorio()
{
  for (int i=0; i<16; i++)
  {
    for (int j=0; j<4; j++)
    {
      for (int h=0; h<4; h++)
      {
        tabuleiroOrdenado [j] [h] = pares[i];
        i++;
      }
    }
  }
}
// Define as cores pelo valor
void desenhaCor()
{
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 2)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 20)){
    fill(255,0,0);//Vermelho
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 3)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 30)){
    fill(0,255,0);//Verde
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 4)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 40)){
    fill(0,0,255);//Azul
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 5)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 50)){
    fill(255,255,0);//Amarelo
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 6)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 60)){
    fill(255,0,255);//Rosa
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 7)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 70)){
    fill(0,255,255);//Azul claro
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 8)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 80)){
     fill(115,0,115);//Roxo
  }
  if(((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 9)||((tabuleiroOrdenado[pos_1_y][pos_1_x]) == 90)){
    fill(115,115,0);//Marrom
  }
};
// Define as cores pelo valor
void desenhaCor_2()
{
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 2)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 20)){
    fill(255,0,0);//Vermelho
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 3)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 30)){
    fill(0,255,0);//Verde
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 4)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 40)){
    fill(0,0,255);//Azul
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 5)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 50)){
    fill(255,255,0);//Amarelo
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 6)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 60)){
    fill(255,0,255);//Rosa
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 7)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 70)){
   fill(0,255,255);//Azul claro
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 8)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 80)){
    fill(115,0,115);//Roxo
  }
  if(((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 9)||((tabuleiroOrdenado[pos_2_y][pos_2_x]) == 90)){
    fill(115,115,0);//Marrom
  }
};
// Reseta o jogo
void resetarJogo ()
{
    pos_1_x = 0;
    pos_1_y = 0;
    pos_2_x = 0;
    pos_2_y = 0;
    cliques = 0;
    tentativas = 0;
    pontos = 0;
    for (int j=0; j<4; j++)
    {
      for (int h=0; h<4; h++)
      {
        tabuleiro [j] [h] = ativo;
      }
    }
    shuffle(pares);// Embaralha os valores
    atribuiAleatorio(); //Incorpora os valores aleatorios na matriz
    redraw();
}
