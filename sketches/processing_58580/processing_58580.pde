
int VariosObjectos; //Variável criada para os todos os objectos 

PImage ImagemWW; //Instanciar a imagem e dar-lhe um nome "imagemWW"


void setup()//Definir o ambiente da janela, como tamanho da janela, cor de fundo, etc.
{
  size(600,400);//tamanho da janela
  background(random(255),random(255),random(255)); //cor de fundo que neste caso será aleatória
  noLoop();//função que permite que não sejam criadas novas imagens depois de já termos atingido o número de objectos que queremos criar
  
  VariosObjectos  = 600;// definir o número total de objectos
  
  ImagemWW = loadImage("WW.png");//Carregamos o ficheiro de imagem
}


void draw(){//Irá executar o código que tem dentro
  

      for (int i = 0; i < VariosObjectos  ; i = i +1 )//desenhar a repetição dos nossos objectos
      {
        
        float tamanho = random(400); //variável para o tamanho 
  
        tint(random(255),random(255),random(255) );//iremos colorir aleatroriamente as nossas imagens
        image(ImagemWW, 5 , random(height), tamanho*0.93, tamanho); //função que desenhará a imagem (*0.93 serve para manter a imagem com dimensões proporcionais)
      
      }
      }


