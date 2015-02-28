
//Copyright - NINTENDO® Todos os Direitos Reservados - NINTENDO®
//Code Created BY: Rafael Moreira de Melo and Luiz Guilherme Mehl.
//For the class of algorithms 1 in UTFPR - Para a classe de Algoritmos 1 em UTFPR.

import gifAnimation.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;          
AudioPlayer tema;     //Use the Standard AudioPlayer from operating system to play.. // Usa o Player padrão do sistema operacional para tocar..   
AudioPlayer jump;     //..the music will be defined in the variable.                 // a musica que será definida na variavel. 
Gif loopingGif;       //To load a animated . gif image  // Para carregar uma imagem .gif animada. 
Gif loopingGif2;
PImage img; 
PImage chao;
PImage[] mario;     //Automatically sets the array size needed for the image. Gif will be loaded.
PImage[] marioleft; //Define automaticamente o tamanho do vetor necessario para a imagem .gif que será carregada.
PImage mario2;
PImage nuvem1;
PImage nuvem2;
int xbg = 0;
int x = 10;


void setup(){
  size(1280, 720);
  nuvem1 = loadImage("nuvem1.gif");
  nuvem2 = loadImage("nuvem2.gif");
  chao = loadImage("chao.jpg");
  mario2 = loadImage("mario2.gif");
  
  loopingGif = new Gif(this, "mario.gif");     // the .GIF will be runs in loop when it is called.
  loopingGif.loop();                           
  loopingGif2 = new Gif(this, "marioleft.gif");// o . GIF será executado em loop quando ele é chamado.
  loopingGif2.loop();
  
  minim = new Minim(this);               //plays the music theme while programs runs.
  tema = minim.loadFile("tema.mp3");     // toca a musica tema enquanto o programa rodar.
  tema.loop();
   
}


void draw(){
  int y = 523;
  xbg -= 5;
  
  background(0, 0, 255);
  image(nuvem1, xbg, -100);     //used to move the clouds 
  image(nuvem2, xbg + 100, 5);  //usado para mover as nuvems
  if(xbg == -1200){
     xbg = 980;
    }
    
  image(chao, 0, 600); 
   
     if(keyPressed == true) {
       if (key == CODED) {
         if (keyCode == RIGHT) {    
           x += 5;
           image(loopingGif, x, y);
         } else {
          if (keyCode == LEFT){
           x -= 5;
           image(loopingGif2, x, y);
          } 
         }
          if (keyCode == UP){
           y -= 50;
           image(mario2, x, y);
           minim = new Minim(this);        //To play the sound of Mario's jump.
           jump = minim.loadFile("jump.mp3"); // para tocar o som do Mario pulando.
           jump.play();
          }
        }
      } else {
        
        image(mario2, x, y);
        
      }
       
}



