
void setup(){ // defeniçoes setup
  size(500,500); // tamanho janela
  smooth();  // suavizar imagen
  noLoop();  // nao repetir
  
}


void draw(){
  background(255); // cor fundo
  
 
  //crar varios circulos
  
  int totalObjectctos = 50;  // numero total de objetos
  
  for ( int i = 0; i < totalObjectctos; i = i +1){ // repetir o objecto
  
      float s = random(10);   
      float r = random(255); // variaveis para cor vermelha
      float g = random(255); // variaveis para cor verde
      float b = random(255); // variaveis para cor azul
  
      float posX = random(10,150); // width
      float posY = random(5,400); // height
      
      float dis = random(20,100); 
    
      strokeWeight(2); // espessura das linhas
      fill(r,g,b,80); // preenchimento
      rect(posX,posY,dis,dis);  // objecto rectangulo
     
     //ftgserdrt
  }
  
}
     

