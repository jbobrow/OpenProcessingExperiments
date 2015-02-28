
/*
1- defenir a área - size
2- construir o layout do background
3- criar comteúdos
4- inserir botões
5- usar os botões
criar uma condição que pergunta ao botão se foi pressionado para mudar o estado da variável do gate, para corresponder ao gate que vai mostrar o conteúdo respectivo
6- criar um gate para o mouse pressed para só escutar a 1ª vez que é pressionado
*/

//variáveis da tela
int ScreenHorizontal; 
int ScreenVertical; 
int x; 

//definir as variáveis para carregar as imagens
PImage imgRegras;
PImage imgBackground;

boolean bottonOpen = true;//variável para controlar o mousePressed

float alturaRelativa = 0.80;//80 % da altura

Button BotaoEsquerda;//criei os botões
Button BotaoDireita; 

//cena inicial
int gate; 
    float r2 ;
    float g2 ;
    float b2 ;
        
  texto carregarTexto;//carregar a class texto - botões
  
    //jogo
    // iniciar o código do jogo
 
  //definir as variáveis para carregar as imagens
  PImage g;//variável para carregar o background
  PImage n;//variável para carregar a nave
  PImage c;//variável para carregar o cometa
  PImage n2;//variável para carregar a nave destruída (Game Over)
  PFont font; //variável para carregar o tipo de letra
  
  int galaxyY = 0; //variável do background "galaxy"
  int velgalaxy = 1;//variável da velocidade do background "galaxy"
  int velKey = 4; //velocidade no clique do teclado
  int velnaveHorizontal = 0; //variáveis da velocidade da nave
  int naveY = 500;//Variável da posição X da nave
  int naveX = 200;//Variável da posição Y da nave
  float nSizeX = 70;//definir o comprimento da nave
  float nSizeY = 58;//defini a altura da nave
  
  //variáveis da posição X dos cometas
  int comX0 = int(random(20,380));
  int comX1 = int(random(20,100));
  int comX2 = int(random(100,200));
  int comX3 = int(random(200,300));
  int comX4 = int(random(300,380));
  //variáveis da posição inicial Y dos cometas
  int comY0 = 0;
  int comY1 = int(random(-200,-300));
  int comY2 = int(random(-400,-600));
  int comY3 = int(random(-600,-800));
  int comY4 = int(random(-800,-1000));
  
  //variáveis da velocidade dos cometas
  int velmin = 5;
  int velmax = 15;
  int velcomY0 = int(random(velmin,velmax));
  int velcomY1 = int(random(velmin,velmax));
  int velcomY2 = int(random(velmin,velmax));
  int velcomY3 = int(random(velmin,velmax));
  int velcomY4 = int(random(velmin,velmax));
  
  int pontos = 0; //variável da contagem de pontos
  int pontosInc = 5;//variável que define a velocidade da contagem dos pontos
  int transpFill = 255;//variável usada no game over
  
////////////////////////////////////////////////////////////
    
//início da função setup
//definições gerais do jogo, chamadas somente uma vez
void setup (){
  
size (600,670);//tamanho tela
  
  gate = 0; // porta do conteúdo
  x = width/2; 
  
  carregarTexto = new texto();
  
//////////////////////////////////////////////////////////
  // jogo
      //as imagens são carregadas junto com as suas variáveis
    g = loadImage ("galaxy.jpg");//imagem da galáxia
    n = loadImage ("nave.gif");//imagem da nave
    c = loadImage ("cometa.gif");//imagem do cometa
    n2 = loadImage ("nave2.gif");//imagem da nave destruída (no Game Over)
    font = loadFont("BankGothicBT-Light-48.vlw"); //o tipo de letra é carregado
  
/////////////////////////////////////////////////////////
  
   //set up dos dois botões
   BotaoEsquerda = new Button (0,600,//posição X , posição Y do botão  
                               300,70, //largura e altura do botão
                               152,255,0,// cor inicial
                               193,255,100);//cor highlight
                               
                                 
   BotaoDireita = new Button (300,600,// posição X , posição Y do botao 
                              300,70,// largura e altura do botao
                              206,183,4, // cor inicial
                              255,236,100);// cor Highlight)
                                 
   
   //as imagens são carregadas junto com as suas variáveis                                
   imgRegras = loadImage ("regras.png");// fazer o load a imagem das regras
   imgBackground = loadImage ("background.jpg");// fazer o load a imagem background das instruções
   
}
//fim da função setup
//fim das definições gerais do jogo


//função draw
//definições do background
void draw (){

  stroke(255);
  strokeWeight(5);
  smooth();
  
  if (BotaoEsquerda.pressed()){// se o botão da esquerda estiver a ser pressionado
  
    
           if (bottonOpen){// e se o press do botão estiver aberto
                
                                 
                    gate = 1; // muda a variável do gate para mostrar o conteúdo respectivo
                    
                     x = width/2; // faz o reset a variável
                     r2 = random(255);// gera uma cor nova
                     g2 = random(255);
                     b2 = random(255); 
                                                   
                    println("pressed");
                    
                     bottonOpen = false;
           }
  }
  
  if ( BotaoDireita.pressed()){
    
         if (bottonOpen){ // e se o press do botão esta activo
                
                 bottonOpen = false;
                                                              
            gate = 2; 
        
         }
    }

  switch (gate){
    
          case 0:
              cena0();
          break;
           
          case 1:
              cena1();
          break;
          
          case 2:
              cena2();
          break;
  }

  
 //desenhar os botões
  BotaoEsquerda.desenha();
  BotaoDireita.desenha();
  carregarTexto.desenharRegras();
  carregarTexto.desenharJogar(); 
}


//definições da cena 0
void cena0(){
        
       rect(0,0,ScreenHorizontal,ScreenVertical*alturaRelativa);
       imageMode(CORNER);
       image(imgBackground,0,0);
  

}

//definições da cena 1
void cena1(){
  
  
  
  rect(0,0,ScreenHorizontal,ScreenVertical*alturaRelativa);
  imageMode(CORNER);
  image(imgBackground,0,0);
  image(imgRegras,10,10);
     
}


//definições da cena 2
void cena2(){
  imageMode(CORNER);
  tint(255,255,255,80); //aplicar transparência na imagem
  image(g,0,galaxyY); //1ª imagem do background
  image(g,0,galaxyY-600); //2ª imagem do background = copiar
  
  galaxyY=galaxyY+velgalaxy;
  
  if (galaxyY==+600){ //aplica repetição à imagem do bacground "galaxy" - criar ciclo de background infinito
    galaxyY=galaxyY-600;
  }
    
  //fim das definições do background

  
  //definições do teclado
  if(keyPressed){
    if(keyCode == RIGHT){ //velocidade para a direita e para a esquerda
      velnaveHorizontal = velKey;}
    if(keyCode == LEFT){
      velnaveHorizontal = -velKey;}}
  //fim das definições do teclado


  //definições da nave
  //impede a nave de sair para os lados da tela
  if (naveX > 375){
    velnaveHorizontal = -velnaveHorizontal;}
  if (naveX < 25){
    velnaveHorizontal = -velnaveHorizontal;}
      imageMode(CENTER);
  
  tint(255,255,255,255); //tira a transparência da imagem
  
  naveX = naveX + velnaveHorizontal; //velocidade da nave
  
  image(n,naveX,naveY,nSizeX,nSizeY); //chama a imagem da nave   
  //fim das definições da nave


  //definições dos cometas
  float comSizeX = random(30,40);//tamanho da imagem
  float comSizeY = random(80,90);  
  
  comY0 = comY0 + velcomY0; //velocidade dos cometas
  comY1 = comY1 + velcomY1; 
  comY2 = comY2 + velcomY2; 
  comY3 = comY3 + velcomY3; 
  comY4 = comY4 + velcomY4;
  
  image(c,comX0,comY0,comSizeX,comSizeY); //chamar imagem dos cometas
  image(c,comX1,comY1,comSizeX,comSizeY);
  image(c,comX2,comY2,comSizeX,comSizeY);
  image(c,comX3,comY3,comSizeX,comSizeY);
  image(c,comX4,comY4,comSizeX,comSizeY);
  
  //reinicia a queda dos cometas com novos valores de X e de velocidade
  if (comY0 > 690){
    comY0 = -90;
    comX0 = int(random(20,380));
    velcomY0 = int(random(velmin,velmax));  
  }
  
  if (comY1 > 690){
    comY1 = -90;
    comX1 = int(random(20,380));
    velcomY1 = int(random(velmin,velmax));  
  }

  if (comY2 > 690){
    comY2 = -90;
    comX2 = int(random(20,380));
    velcomY2 = int(random(velmin,velmax)); 
  }
  
  if (comY3 > 690){
    comY3 = -90;
    comX3 = int(random(20,380));
    velcomY3 = int(random(velmin,velmax));  
  }
  
  if (comY4 > 690){
    comY4 = -400;
    comX4 = int(random(20,380));
    velcomY4 = int(random(velmin,velmax)); 
  }
  //fim das definições dos cometas


  //definições de interacção
  //defini a variável como a distância entre os centros definidos da nave e do cometa
  int dCentros0 = int(dist(comX0,comY0,naveX,naveY-50));
  int dCentros1 = int(dist(comX1,comY1,naveX,naveY-50));
  int dCentros2 = int(dist(comX2,comY2,naveX,naveY-50));
  int dCentros3 = int(dist(comX3,comY3,naveX,naveY-50));
  int dCentros4 = int(dist(comX4,comY4,naveX,naveY-50));
  
  //se a distância for menor ou igual a 40 é detectada a colisão, ativando a função GameOver
  if (dCentros0 <= 40 || dCentros1 <= 40 || dCentros2 <= 40 || dCentros3 <= 40 || dCentros4 <= 40)
  
  { 
    GameOver();
  }
  //fim das definições de interacção


  //área lateral - contagem de pontos
  stroke(255);//cor do contorno da área lateral
  strokeWeight(5);//grossura do contorno
  fill(0);//cor da área lateral
  quad(400, 0, 400, 600, 600, 600, 600, 0);//forma da área lateral
  line(400,90,600,90);//linha separatória entre os pontos e o nome do jogo
  
  if (comY0 < 1000){ //defini a contagem infinita de pontos
    pontos = pontos + pontosInc;} //definir o aumento na variável
    
    
  //textos  
  fill(255);//preenchimento
  textFont(font, 35);//tipo de letra e tamanho
  textAlign(CENTER);//alinhamento
  
  //texto -  nome do jogo "Nave do Jeeko"
  text("Jogo", 500, 40);
  text("do Jeeko", 500, 70);
  
  //texto da pontuação e "Game Over"
  textSize(30);
  text("Pontos", 500, 370);
  textSize(50);
  text(pontos, 500, 420);
  
  //se a igualdade presente no game over acontecer, é activado este texto, mantido dentro de draw
  if (n == n2){ 
    textFont(font, 130);
    textAlign(CENTER);
    text("Game", 200, 220);
    textFont(font, 120);
    text("Over", 200, 310);
  
}

  delay (8); //tempo entre os frames
  
}//final da função draw



void keyReleased(){//se a tecla for solta, a velocidade fica a 0
  velnaveHorizontal = 0;
}


//função de "Game Over"
//diminuir todas as velocidades
void GameOver(){
  velgalaxy = 0; 
  velmax = 3;
  velmin = 3;
  velcomY0 = 3;
  velcomY1 = 3;
  velcomY2 = 3;
  velcomY3 = 3;
  velcomY4 = 3;
  
  fill(255,255,255,transpFill); //surge um flash branco sem transparência
  quad (0,0,0,600,400,600,400,0);
  transpFill = transpFill-90; //transparência activada para que o flash volte a aparecer
  n=n2;//chama a nave2 destruída
  pontosInc = 0; //pára a contagem de pontos
  velKey = 0; //a nave não se move mais
 
}
  

void mouseReleased(){
  //quando liberto o mouse pressed
  //muda o estado do "gate" para verdadeiro
  //para voltar a permitir o mousePressed
  
bottonOpen = true; 

}
//////////////////////////


//class dos botões
class Button {

//variáveis da class RollOver

// área do botão
float x1, y1;//coordenada do 1º ponto
float larguraBotao;//largura do botão
float alturaBotao;//altura do botão

int r,g,b;;//altura do botão
int rD, gD, bD;//cor para "downLight", quando o botão estiver activo
int rNew, gNew, bNew;//actualiza as cores
int rH, gH, bH;//cor para "highLight", quando estiver em cima do botão

// variável para devolver o estado do botão - se estiver ou não em cima do botão
boolean over; 

// variável para devolver o estado do botão - se for ou não pressionado
boolean pressed; 
          
Button ( float t_x1, float t_y1, 
         float t_larguraBotao, float t_alturaBotao,
         int t_r, int t_g, int t_b, //cor inicial
         int t_rH, int t_gH, int t_bH //cor "highlight"
         )
            
         {
          x1 = t_x1;
          y1 = t_y1; 
          larguraBotao = t_larguraBotao;
          alturaBotao = t_alturaBotao; 
          
          r = t_r;//cor do botão
          g = t_g; 
          b = t_b;
          
          rNew = r;//memoriza as novas cores para começar igual à cor do botão
          gNew = g;
          bNew = b;
          
          //calcular o valor do "downLight" - tirar 20 valores a todos os componentes definidos
          rD = r-100;
          gD = g-100;
          bD = b-100; 
          
          //cor "highLight"
          rH = t_rH;
          gH = t_gH;
          bH = t_bH;

          over = false; 
          pressed = false; 
          }


boolean pressed ()
{

   if (over()){ 
   
   //chamar a função over() para saber se o rato esta por cima do objecto
   //para testar o mousePressed se pressionarmos o rato fora do botão
   
   if (mousePressed == true && mouseButton == LEFT){
         
          //muda para preto         
          rNew = rD; // quando o botão está activo
          gNew = gD;
          bNew = bD;
      
         pressed = true;  
         
     } 
     else //caso contrário, se estiver em cima mas o rato não for pressionado, devolver o false
     {
       
       rNew = rH;// quando o botão não é pressionado volta ao "highLight"
       gNew = gH;
       bNew = bH;
       
       pressed = false; 
          
     
     
     }// se estiver over 
     
    
   }

 return pressed; // devolver a função o valor da variável
 
}

boolean over() {
  
  //início sistema para detectar se o mouse está over
  //sistema de colisão - vai detectar se o rato está em cima da área do botão
  if ( mouseX > x1 &&  mouseX < x1 +larguraBotao
      && mouseY > y1 && mouseY < y1 +alturaBotao ) // se verdadeiro,
                                                   // ou seja se estiver
      {
  
          over= true; //se estiver em cima, a variável fica verdadeiro
          
          
          //se estiver em cima 
          //passa as cores do "highlight"
          rNew = rH; 
          gNew = gH;
          bNew = bH;
       

      } else // caso contrario, por exemlo quando sairmos de cima
      {

        
        over = false;// se não estiver em cima, a variável fica falsa
        // volta à cor inicial
        rNew = r; 
        gNew = g;
        bNew = b;
      
      }
 //fim do sistema para detectar se o mouse está over
  
  return over; //devolver o estado da detecção
  
  
}// end update


void desenha (){//desenhar
   
  fill (rNew,gNew,bNew);
  rect(x1,y1, larguraBotao,alturaBotao); 
}

}
//fim do código

