
void setup(){ // definiçoes do setup
  size(500,500); // tamanho janela
  smooth();  // suavizar o contorno
  frameRate(5); // numero de frames por segundo
}


void draw(){ // definiçoes do void draw
  background(255); // cor fundo
  
  float diametroe = random(100,200); // atribui variavel de um valor aliatorio para diametro
  
  //elipse
    noStroke();  // sem contorno
   fill(59,155,131); // cor de fundo
   ellipse(random(500),random(500),diametroe,diametroe);
   
   
   
  // quadrado
   float diametroq = random(100,200); // criar uma variavel e atribuir um valor
   float r = random(255); // criar uma variavel para cor vermelha
   float g = random(255); // criar uma variavel para cor verde
   float b = random(255); // criar uma variavel para cor azul
 
  
   fill(r,g,b); // preenchimento
   rect(random(500),random(500),diametroq,diametroq); // desenho rectangulo
   
   
  //crar varios circulos
  
  int totalObjectctos = 80;
  
  for ( int i = 1; i < totalObjectctos; i = i +1){
  
  
      float posX = random(100,400);  // variavel para posiçao x
      float posY = random(100,400); // variavel para posiçao y

      
  // linha    
      float dis = random(25,25);
      stroke(0); // linha contorno
      strokeWeight(3); // espessura
      line(posX,posY,dis,dis); // desenho linha
      
    triangle(10, 45, 28, 20, 46, 45); // desenho triangulo
  
  }
 }
