
// evocar a class criada
Flor[] flores; 
int num;//enuciar a variavel




//importar a library Minin para poder colocar som
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//variaveis para a musicqa 1 e2
Minim som;
AudioPlayer musica;

Minim som2;
AudioPlayer musica2;

 
void setup(){
  size (400,400); //tamanho da janela
  
  //carregamneto do ficheiro de musica principal
      som = new Minim (this);
  musica = som.loadFile("loop1.mp3"); // vai buscar o ficheiro de som
 
   //carregamneto do ficheiro de musica alternativo
      som2 = new Minim (this);
  musica2 = som.loadFile("loop2.mp3"); // vai buscar o ficheiro de som
 
  
   
  num = 50; //numero de ojectos a ser desenhado
  flores = new Flor[num]; 
  
  
  //ciclo que determina os novos valores da variaveis
  for ( int i =0; i< num; i++){
      flores[i] = new Flor ( 0, random (width), random (height));
  }
  
}

void draw(){
  background(0);//cor do fundo
  
  // cilo que desenha e anima os objectos
   for ( int i =0; i< num; i++){
     
     flores[i].drive();
      flores[i].display();
      
  }

}

class Flor{  // objeto flor
  
  float r,g,b; // variaveis cor do Flor
  float largura; // variavel para a largura do ojjecto
  float altura; // variavel para a altura do ojjecto
  float escala; // variavel para crescer
  
  //   criar uma funcao onde coloco as novas variaves a usar no objecto
  Flor ( int t_largura, float t_altura, float t_escala  ){
  
  
  //dar valores iniciais as variaveis  
   largura = t_largura; 
   altura = t_altura; 
   escala = t_escala; 
   r = random(255); // random varia entre 0 e 255 de intensidade da cor vermelha
   g = random(255); // random varia entre 0 e 255 de intensidade da cor verde
   b = random(255); // random varia entre 0 e 255 de intensidade da cor azul
  
  }
  
  // funcao que anima o Flor, actualizando a variavel largura
  void drive (){
    
    largura = largura + escala; // incrementa a escala á largura, o tamanho inicial objecto
    
    
    //condiçao que diz se a largura que esta a ser incrementada ultrapassar o tamanho
    //da janela esta passa a ser 0 novamente
    //altura dos objectos e aleatoria
    if ( largura > width){
     largura = 0; 
     altura = (int) random(height); 
     r = random(255); 
     g = random(0,250); 
     b = random(0,250); 
    }
    
  }
  
 
  void display (){   // funcao de desenho do Flor
    smooth();        
    noStroke(); 

    
    /* condiçao que diz se a tecla "espaço" for presionada, as cores 
    dos objectos passam para random atraves das variasveis ja defenidas, 
   e opacidade random entre 10-90, e toca a musica alternativa.
   
   "se nao", se nao for (ou enquanto nao for) presionada a tecla "espaço" 
   a cor do objecto manten-se vermelha com transparencia andom entre 10-90 
   e toca a mucica principal */
     if (key == ' ')
        {    
             fill(r,g,b,random(10,90));  
             musica2.play(); 

             
        }else{
          
        fill(255,0,0,random(10,90));
        musica.play(); 
    
        }
    

 /* condiçao que diz se o rato for presionado, ao objecto desenhado é um quadrado
    "se nao", se nao for (ou enquanto nao for) presionada o rato 
   ao objecto desenhado é uma elipse */
    if (mousePressed == true ) {
      rectMode(CENTER);
    rect (width/2, height/2, largura, altura); 
    } else { 
      
    ellipse (width/2, height/2, largura, altura); 
    }
    
   
    
  }
  
}

