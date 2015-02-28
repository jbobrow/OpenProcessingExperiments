
void setup () { // construção do stage
  size (600,600); // tamanho da janela
  background(255); // cor de fundo
  smooth(); // suaviza as formas
  
}
void draw() { // construção das formas/desenhos
  float posX1 = random (0,600); // atribui uma variavel para uma posição x aleatória do circulo
  float posY1 = random (0,200); // atribui uma variavel para uma posição y aleatória entre 0 a 200 do circulo
  float diametro = random (0,50); // atribui uma variavel para um diametro aleatório do circulo
  float be = random (115,218); // atribui uma variavel para um valor aleatório na escala dos azuis
  
  
  fill(73,219,be); // define a cor de preenchimento dos circulos
  ellipse (posX1,posY1, diametro, diametro); // contrução do circulo
  
  float posX2 = random (0,600); // atribui uma variavel para uma posição x aleatória do circulo
  float posY2 = random (400,600); // atribui uma variavel para uma posição y aleatória entre 400 a 600 do circulo
  
  fill (73,219,be);  //define a cor de preenchimento dos circulos
  ellipse (posX2, posY2, diametro, diametro); // construção dos circulos
  
  float postX1 = random (0,600); // atribui uma variavel para uma posição x aleatória do circulo
  float postY1 = random (200,400); // atribui uma variavel para uma posição y aleatória entre 200 a 400 do circulo
  float bt = random (77,115); // atribui uma variavel para um valor aleatório na escala dos azuis
  
  fill(219,15,bt); //define a cor de preenchimento dos circulos
  ellipse(postX1,postY1,diametro, diametro); // construção dos circulos
}
