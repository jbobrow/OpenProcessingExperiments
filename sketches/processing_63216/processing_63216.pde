


int totalObjectos; // numero total de objectos




float posX, posY; // variaveis para a posição horizontal e vertical dos objectos 
float tamanho; // variavel para o tamanho 
float r,g,b; // variaveis para a cor 
float s; // variavel referente á espessura do stroke


void setup() { // definição dos elementos estáticos
  
  size(600,600);// define a área de composição
  background (255); // define a cor de fundo
  smooth();// suaviza a composição
  frameRate(3);// define a quantidade de frames por segundo, neste caso 3 

  
  totalObjectos = 900; // numero total de objectos
  
  
}

void draw(){// definição de elementos em animação
  background(0);
  
  for ( int i = 0; i <totalObjectos; i++) // função em que a composição começa em 0 até ao numero total de objectos
  {
     posX = random (width); // define que a posição horizonral varia entre a largura total
     posY = random (height); //define que a posição vertical varia entre a largura total
     tamanho = random (5, 50); // define que o tamanho dos objectos vai variar entre 5 a 50
     r = random(255); // define um valor para a componente vermelha entre 0 e 255
     g = random(255); // define um valor para a componente verde entre 0 e 255
     b = random(255); // define um valor para a componente azul entre 0 e 255
     s = random (1,12); // define valor para a espessura do stroke 
     
     strokeWeight(s);// define valor para a espessura do stroke
     stroke(r,g,b);// define a cor do stroke
     line ( posX, posY, posX +random(-100,100), posY+random(-100, 100)); // desenha a linha com as coordenadas anteriormente definidas
  } 
  
  
  } 
  

         




