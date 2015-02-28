
/**************************************************************
    Proposta: O melhor de 2013. 
    Proposito: PImage, img(), move(), condicionais, void setup, 
               void draw,funcao,keyPressed.

Ultima Revisao: 18/12/13

O ano de 2013 representou para mim o ingresso numa universidade,
e junto com as alegrias vieram tambem as responsabilidades de
superar as dificuldades pessoais, a administracao de tempo, a
convivencia com os colegas e professores, e aprender uma licao
diaria de humildade para reconhecer os erros e aprender com eles.

A analogia da vida com uma viagem de onibus veio de uma mensagem
passada por um professor da minha juventude. Segundo a narrativa,
entramos nesse onibus ao nascer e descemos dele ao morrer. E,
a viagem representa todas as experiencias boas e ruins que todos
temos que enfrentar. O itinerario de 2013 ja esta chegando ao
fim, agora resta a cada um de nos pegar o proximo onibus e fazer
a melhor viagem possivel, talvez a que mude toda a nossa vida!

**************************************************************/

int vx = 4; // Velocidade da imagem -> nuvens

int a = 0;
int b = 573;
int V = 4;

float x = random(100, 0); //Posição inicial em x
PImage asfalto;
PImage nuvens; 
PImage fundo;
PImage placa1;
PImage placa2;
PImage placa3;
PImage placa4;
PImage placa5;
PImage placa6;
PImage roda;
PImage ano;
PImage mensagem;

void setup() {
  size(950, 600);
  fundo = loadImage("fundo.jpg");
  placa1 = loadImage("placa1.png");
  placa2 = loadImage("placa2.png");
  placa3 = loadImage("placa3.png");
  placa4 = loadImage("placa4.png");
  placa5 = loadImage("placa5.png");
  placa6 = loadImage("placa6.png");
  roda = loadImage("roda.png");
  ano = loadImage("2013.png");
  nuvens = loadImage("nuvens.png");
  mensagem = loadImage("mensagem.png");
  asfalto = loadImage("asfalto.jpg");
  }
  
void draw(){
  image (fundo,0,0,950,600);
  image(nuvens, x, 25,width/1.5,height/3.5); 
    
  fill (10,60,200);
  rect (200,350,650,200,35,30,15,25); /*bus*/
  image(ano,490, 460,100,80); 
  fill(80);
          
  for (int x =280; x <=750; x +=150) 
    image(roda,x, 511, 63, 63);
             
   fill (255); 
   for (int x = 250; x <=750; x +=100) 
   rect (x,400,60,60,10); /* janelas */
   
    fill (0);
    for (int x = 262; x <=800; x +=100) {
    textSize(12);
    text ("aperte", x, 420);
    }
    textSize (20);
    text ("A", 275, 445);
    text ("S", 375, 445);
    text ("D", 475, 445);
    text ("F", 575, 445);
    text ("G", 675, 445);
    text ("H", 775, 445);
   
 /* animacao das placas */
 
 if (keyPressed) {
    if (key == 'a' || key == 'A') {
    image(placa1, 0, 205, 210, 345);
    }
    
    if (key == 's' || key == 'S') {
    image(placa2, 0, 205, 210, 345);
    }
    
    if (key == 'd' || key == 'D') {
    image(placa3, 0, 205, 210, 345);
    }
    
    if (key == 'f' || key == 'F') {
    image(placa4, 0, 205, 210, 345);
    }
      
    if (key == 'g' || key == 'G') {
    image(placa5, 0, 205, 210, 345);
    }
    
    if (key == 'h' || key == 'H') {
    image(placa6, 0, 205, 210, 345);
    }
   }
   
   /* movimento das nuvens */  
   
   x += vx;
   if (x>=960)
   {
   x=-750; // volta a imagem 
   }

   /* funcao movimento do asfalto */
  
   img();
   move();
   }
   void img() {
     image(asfalto, a, b, asfalto.width, asfalto.height);
     }
     void move() {
       a = a + V;
       if (a > 0) {
         a = -100;
         }

     }


  



