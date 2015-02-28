
void setup() { // constroi o stage
  size (600,600); // define o tamanho da janela
  background (255); // define a cor de fundo
  smooth(); // suaviza as formas
  noStroke(); // retira as linhas de contorno
  frameRate(10); // define o numero de frames por segundo
}

void draw(){ // controi o desenho/formas
  
  for ( int i = 0; i < 600; i++){ // define o numero de repetições da variavel i
    float x = random(100,400); // atribui um valor aleatório para a posição x
    float y = i; //atribui a variavel i à posição y
    float tamanho; // atribui uma variavel para o tamanho
    float h = map ( i, 0, 400, 0,300); // indica que o valor h vai ser convertido atravez das repetições de i consoante o alcance dos valores minimos e maximos introduzidos
    tamanho = map ( i, 0, 400, 0,30); // indica que o tamanho vai variar consoante as repetições e conversões de cor
    
    fill(50,255,h); // indica as cores de preenchimento da forma qe vao variar na escala dos azuis
    rect ( x, y, tamanho, tamanho); // desenha os quadrados 
} 
}

