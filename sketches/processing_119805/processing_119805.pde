
/**************************************************************
    Proposta: Animação com funções.
    Propósito: uso de PImage, image, operações lógicas, random, 
               keyPressed, noCursor, void setup, void draw.
               
    Autoras: Ana Paula Galdino
             Cleusa Granatto

    Ultima Revisao: 16/11/13
**************************************************************/

int vx = 2; // Velocidade da imagem
float x = random(100, 0); //Posição inicial em x

PImage background; 
PImage peixe; 
PImage menina; 
PImage polvo;

void setup () 
{
  size (450,300); 
  menina = loadImage("girl.png");
  background = loadImage("fundo.jpg"); 
  peixe = loadImage("peixe.png");
  polvo=loadImage("polvo.png");
}

void draw () 
{
  image(background, 0, 0, 450, 300);
  image(menina, x, 55); 
    
  noCursor(); // esconde o cursor
  image (peixe, mouseX, mouseY, 70,70); // animação do peixe
  
  //quando a imagem alcança o fim da janela a imagem retorna.
  x+=vx;
  if (x>=260 || x<=0)
  {
    vx*=-1; // inverte a direção da menina
  }
    
   if (keyPressed == true) 
   {
    image(polvo,20,20, 90, 90);
   }
  
}

