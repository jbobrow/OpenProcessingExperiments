

int totalObjectos; // número dos circulos

float posX, posY; // variavel para a posição horizontal e vertical do circulo
float diametro; // variavel do diâmetro do circulo
float r,g,b; // variavel da cor dos circulos
float s; // variavel da espessura do circulo

// definições de Set up
void setup() {
  
  float sizeW, sizeH;
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (255); 
  smooth(); // definição do contorno
  noLoop(); // imagem estática
  
  
  totalObjectos = 100;// totalidade dos circulos (controlo do loop)
  
 

}

void draw(){ // desenhar imagem 
  background(255); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++) // número total de circulos
  {
     posX = random (width); // numero para posição horizontal
     posY = random (height); // numero para posição vertical
     diametro = random (5, 100); // diametro entre 5 e 100
     r = random(350); // valor para a componente vermelha entre 0 e 350
     g = random(300); // valor para a componente verde entre 0 e 300
     b = random(200); // valor para a componente azul entre 0 e 200
     s = random (1,10); // valor para a espessura do stroke (outline)
     
     strokeWeight(s); // espessura da linha do circulo
     fill(r,g,b); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // elipse desenhada com os valores 
  } 
  
  

         
}


