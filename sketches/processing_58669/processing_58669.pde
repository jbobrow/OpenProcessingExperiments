
void setup(){
  size(800,800); // tamanho janela
  smooth(); // suavizar desenho
  noLoop(); // não repetir
  
}

void draw(){
  background(0); // cor fundo
  
  
  int totalObjectctos = 100; // total objectos
  
  for ( int i = 0; i < totalObjectctos; i = i +1){ // variavel e quantidade dos objectos
  
      float s = random(10);
      float r = random(250);
      float g = random(7);
      float b = random(120);
  
      float posX = random(0,800); // width
      float posY = random(400,100); // height
      
      float dis = random(20,100);
    
      strokeWeight(s);
      fill(r,g,b);
      rect(posX,posY,dis,dis);
      noStroke();
      
  }
  
}
