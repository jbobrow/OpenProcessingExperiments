
import ddf.minim.*;// importar librarias de sons

Minim minim;//variaveis globais 
AudioSample player_1;// variavel da musica 1
AudioSample player_2;// variavel da musica 2

int s; // segundos
int m; // minutos 
int h; // horas

int seconds; // variavel para os segundos
int lastSecond;// variavel do ultimo segundo 
int secondsBeat; // variavel dos beats dos segundos 

int lastMinut;// variavel do ultimo minuto 



void setup(){ // esta função serve para as definiçoes do setup
  size(500,500); // define o tamanho da janela, que neste caso será 500x500
  
  
  minim = new Minim(this); // libraria onde se importa a primeira(segundos) musica
  player_1 = minim.loadSample("water-droplet-2.wav", 512);// musica dos segundos, o 1º é o nome do ficheiro e o segundo parametro é o buffersize, quanto maior for mais delay há.
  
  minim = new Minim(this);// libraria onde se importa a segunda(minutos) musica
  player_2 = minim.loadSample("water-splash-2.wav", 512);// musica dos minutos
   
  s = 0;// segundos
  m = 0;// minutos
  h = 0;// horas
 
  
}


void draw(){ // esta funçao serve para as definiçoes do void draw
   background(0); // para definir a cor do fundo 
  
 
  
    seconds = second();// variavel dos segundos
    s = second();// variavel dos segundos de 0 - 59
    m = minute();// variavel dos minutos de 0 - 59
    h = hour();// variavel das horas de 0 - 23
    
    
   
    if(lastSecond+1 == seconds){//condiçao em que no ultimo segundo volta a repetir 
      player_1.trigger();// toca a musica 1
      
    }
    
    fill(255,0,0);// cor de preenchimento
    text (h, -100,-100);// texto
    
    if (lastMinut+1 == m){// condiçao que diz que o ultimo minuto corresponde ao m (minutos)
    
      
      
    }
    
  
  if(lastMinut+1 == m){//condiçao em que no ultimo segundo volta a repetir 
      player_2.trigger();//tocar a musica 2
      
    }  
    
    
  lastSecond = seconds;//o ultimo segundo que corresponde aos segundos
  lastMinut = m;// o ultimo minuto que corresponde aos minutos
  
  float h12; // variavel de h12
  h12=h;// os nossos relogios marcam 24horas, assim sendo, esta função assume que sempre que chegue as 12h soma-se de 1 a 1 até às completar mais 12 que dá 24h
 
  
  println(s); // esta funçao vai nos permitir ver no rectangulo a preto embaixo os segundos a passar
  noFill(); // esta funçao serve para nao ter cor de preenchimento
  stroke(255); // espessura da linha - stroke - a cor do mesmo
  
  
  translate(width/2, height/2);// esta funçao serve para mover o objecto sem mover a janela
 
  pushMatrix();// esta funçao serve para nao rodar mais tarde a parte do texto
  for (float i = 0; i < 50; i++) { // esta função controla a sequência de repetições, neste caso de ellipses
  rotate(0.1);// esta função serve para rodar o objecto que neste caso é uma espiral feita de ellipses
   
   
    stroke(149);// cor do stroke da ellipse
    ellipse(i, 0, s*10, s*10);// ellipses que constinuem a espiral dos segundos 
   
   stroke(53);// cor do stroke da ellipse 
    ellipse(i, 0, m*10, m*10);// ellipses que constinuem a espiral dos minutos
   
   stroke(255);// cor do stroke da ellipse
    ellipse(i, 0, h*10, h*10);// ellipses que constinuem a espiral das horas
  }
  
  popMatrix();// completa a outra funçao em cima  pushMatrix, com estas duas funçoes anula o rotate e o texto deixa-se horizontal 
  
  translate(0, 0);// 
  
  if (mousePressed){// condiçao para o mouse
  fill(255,255,255);// cor do texto
  text(h,-20,-20);// texto das horas
  text(m,-20,0);// texto dos minutos
  text(s, -20,+20);// texto dos segundos
  
  } else{// condiçao para por mais informaçao com o mouse
  
    fill(255,255,255); // cor do texto
    text("click on!",-40,0);// texto 
  }
  

  
}
