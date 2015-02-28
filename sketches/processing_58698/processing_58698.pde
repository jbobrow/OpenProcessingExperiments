
int totalObjectos; // numero total de objectos, neste caso quadrados

float posX, posY; //variaveis para a posição horizontal e vertical dos quadrados

float r,g,b; // variaveis para a cor dos quadrados
float s; // variavel para controlar a espessura do outline


void setup() { // definiçoes do setup
  
 size(500, 500);// para definir o tamanho da janela
  background (255); // definir a cor do fundo
  smooth(); // suavizar o contorno mesmo que este nao contenha stroke
  noLoop();// criar imagem estática
  

  
  totalObjectos = 130;// numero total de quadrados (controlo do loop)
  
 

}

void draw(){// definiçoes do void draw
  
  colorMode(RGB, 255,255,255);// esta função é usada para mudar cores especificas do RGB
  background(255); // para definir a cor de fundo
  
  colorMode(HSB, 320,70,70); // para mudar a cor para HSB 
  
  for ( int i = 0; i <130; i++)// esta função controla a sequência de repetições 
  {
    
    // gerar uma posição aleatoria na janela
     posX = width/2 + random (-i,i); // gerar uma posição horizonral 
     posY = random (height); // gerar uma posição vertical
     
     
     float h = map ( i, 0, 130, 0,320); //para criar um valor de uma cor para a outra  
     

   
     
     strokeWeight(3);// espessura da linha, do stroke
     fill(h,70,70); // cor de preenchimento 
     rect(random(posX), random(posY), random(height/2), random(width/2));// desenhar os quadrados com os valores gerados
  }
  
  saveFrame("Interation.png");// para salvar uma imagem
}

