
void setup(){ //inicio do loop na composição
  
  size (500,500); //definição do tamanho da composição
  background (0); //definição da cor de fundo
  noLoop(); //serve para suavizar os elementos
  smooth(); //serve para suavisar os elementos da composição
  
}

void draw(){ //inicio da criação dos elementos da composição
  
  stroke (255); //cor da linha 
  strokeWeight (1); //espessura da linha
  
  for (int i=0; i < 300; i=i+1){ //determina que a repetição dá-se 300 vezes começando em 1
    
    float posX_1 = random (width); //criação de uma variável para a posição de X#1
    float posY_1 = random (height); //criação de uma variável para a posição de Y#1
    float posX_2 = random (width); //criação de uma variável para a posição de X#2
    float posY_2 = random (height);//criação de uma variável para a posição de Y#2
    
    line (posX_1, posY_1, posX_2, posY_2); //coordenadas de linha aleatorias dadas pelas variáveis criadas anteriormente
    
    fill (0,0,0,100); // preenchimento dos quandrados
    rect (posX_1, posY_1, 3, 3); //posição dos quadrados gerados pelas variaveis criadas anteriormente relacinadas com as linhas #1
    rect (posX_2, posY_2, 3, 3); //posição dos quadrados gerados pelas variaveis criadas anteriormente relacinadas com as linhas #2
    
    
  }

}
 
  
