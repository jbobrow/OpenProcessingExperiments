
//Trabalho final da disciplina de computacao grafica
//Alunos:
// Fabrício da Silva Peres
// Marco Antonio Lobo S Cavalcante De Souza
// Michel Rodrigues Dos Santos

//classe que define cada bola do jogo
class peca{
  int px;
  int py;
  int aberto;
  //constructor peca
  peca(int posx, int posy){
    px = posx;
    py= posy;
    aberto=int(random(2));
  }
}


void mousePressed()
{
  if ( fim == 0 ) //entrar se o jogo nao acabou
  {
    for (int i=0; i< linhas; i++)
      for (int j=0; j< colunas; j++)
      {
        //verifica se a peca esta aberta e se o mouse foi pressionado sobre ela
        if (( tabuleiro[i][j].aberto == 1 ) && 
           ( tabuleiro[i][j].px >= mouseX - diametroG/2 && tabuleiro[i][j].px < mouseX + diametroG/2 )&& 
           ( tabuleiro[i][j].py >= mouseY - diametroG/2 && tabuleiro[i][j].py < mouseY + diametroG/2))
            { 
              tabuleiro[i][j].aberto=abs(tabuleiro[i][j].aberto-1);
              if (i+1 < linhas) tabuleiro[i+1][j].aberto=abs(tabuleiro[i+1][j].aberto-1);
              if (i-1 >=0) tabuleiro[i-1][j].aberto=abs(tabuleiro[i-1][j].aberto-1);
              if (j+1 < colunas) tabuleiro[i][j+1].aberto=abs(tabuleiro[i][j+1].aberto-1);
              if (j-1 >=0) tabuleiro[i][j-1].aberto=abs(tabuleiro[i][j-1].aberto-1);
              jogadas++;
            }
       else 
         if ( (tabuleiro[i][j].aberto == 0 ) && 
            ( tabuleiro[i][j].px >= mouseX - diametroP/2 && tabuleiro[i][j].px < mouseX + diametroP/2 )&& 
            ( tabuleiro[i][j].py >= mouseY - diametroP/2 && tabuleiro[i][j].py < mouseY + diametroP/2))
            { 
              tabuleiro[i][j].aberto=abs(tabuleiro[i][j].aberto-1);
              if (i+1 < linhas) tabuleiro[i+1][j].aberto=abs(tabuleiro[i+1][j].aberto-1);
              if (i-1 >=0) tabuleiro[i-1][j].aberto=abs(tabuleiro[i-1][j].aberto-1);
              if (j+1 < colunas) tabuleiro[i][j+1].aberto=abs(tabuleiro[i][j+1].aberto-1);
              if (j-1 >=0) tabuleiro[i][j-1].aberto=abs(tabuleiro[i][j-1].aberto-1);
              jogadas++;
            }  
      }
  }  
  //testar botao de restart
  if  (( mouseX >= 275 && mouseX <= 275+90)&&( mouseY >= 195 && mouseY <= 194+40))
    reiniciar(); 
}

//verifica se o jogo acabou conferindo se existem no maximo 2 pecas abertas
int verificaFim()
{
  int abertos=0;
  PFont font;

  fill(255,255,0);      
   font = loadFont("BookAntiqua-20.vlw");
   textFont(font); 

   for (int i=0; i< linhas; i++)
    for (int j=0; j< colunas; j++)
      if (tabuleiro[i][j].aberto == 1 ) abertos++;
   
   if ( abertos <= 2 )  
   {  text("Parabens! Você conseguiu!", 10, 60);
      text("Utilizou " + str(jogadas) + " jogadas.", 10, 90);
   return 1;
   }
   else return 0;
}

//metodo que monta o menu lateral
void menu_lateral()
{
  PFont font;

    //retangulo superior - objetivo
    fill(49,31,124);
    rect(250,0,150,50);
    fill(255,255,255);      
    font = loadFont("BaskOldFace-12.vlw");
    textFont(font);
    text("O objetivo do jogo é deixar no", 251, 12);
    text("máximo 2 bolas amarelas com", 252, 25);
    text("o menor número de jogadas.", 252, 38);

    //retangulo central
    fill(49,31,124);
    rect(250,51,150,350);
    //contador de jogadas
    fill(255,255,255);  
    font = loadFont("BaskOldFace-20.vlw");
    textFont(font);
    text("Jogadas: " + jogadas, 280, 100);
    
    //botão restart
    fill(188,184,184);
    rect(275,195,90,40);
    rect(280,200,80,30);
    fill(255,255,255); 
    text("Reiniciar", 285, 220);
    
    //retangulo inferior - Funcionamento
    fill(49,31,124);
    rect(250,350,150,50);
    fill(255,255,255);      
    font = loadFont("BaskOldFace-12.vlw");
    textFont(font);
    text("Funcionamento:", 251, 362);
    text("Ao clicar em um círculo, ele", 252, 375);
    text("e os 4 ao redor invertem.", 252, 388);

}

//metodo para reiniciar o jogo
void reiniciar(){
  fim=0;
  jogadas=0;
  for (int i=0; i< linhas; i++)
      for (int j=0; j< colunas; j++)
        tabuleiro[i][j].aberto=int(random(2));
}

//variaveis globais
peca[][] tabuleiro; //tabuleiro
int linhas=5; //linhas do tabuleiro
int colunas=8; //colunas do tabuleiro
int diametroG=25; //diametro da peca aberta
int diametroP=10; //diametro da peca fechada
int fim=0; //controla o fim do jogo
int jogadas=0; //controla a quantidade de jogadas
PImage imagem; //variavel para aramazenar a imagem de fundo
int posYimagem=0; //posicao da imagem de fundo.

void setup(){
  size (400,400);
  //cria o tabuleiro de pecas
  tabuleiro = new peca[linhas][colunas]; 
  for (int i=0; i< linhas; i++)
    for (int j=0; j< colunas; j++)
      tabuleiro[i][j]=new peca((i*50)+20,(j*50)+20);
}

void draw(){
    stroke(0);
    //fundo da tela
    imagem = loadImage("galaxia.jpg");
    
    //faz o movimento do fundo da tela
    if ( fim == 0 ){
      if ( posYimagem > 400) posYimagem=0; else posYimagem++;
      image(imagem, 0, posYimagem-400,250,399);
      image(imagem, 0, posYimagem,250,400);
    }
    else
    {
       imagem = loadImage("galaxia-final.jpg");
       image(imagem, 0, 0,250,400);
    }
    
    menu_lateral();
    
    //desenha o tabuleiro e as pecas
    for (int i=0; i<linhas; i++)
      for (int j=0; j<colunas; j++)
        if (tabuleiro[i][j].aberto == 1)
        {
          fill(250,255,113);
          ellipse(tabuleiro[i][j].px, tabuleiro[i][j].py, diametroG, diametroG);
          fill(255,218,113);
          ellipse(tabuleiro[i][j].px, tabuleiro[i][j].py, diametroG-10, diametroG-10);
        }
        else
        {
          fill(222,254,255);
          ellipse(tabuleiro[i][j].px, tabuleiro[i][j].py, diametroP,diametroP);
        }

   fim=verificaFim();
}

