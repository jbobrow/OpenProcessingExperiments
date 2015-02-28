
float[] alturas; // declara uma variável para conter um array qualquer

void setup() {
  alturas = new float[5];// cria um array com 5 posições e atribuia alturas
  alturas [0] = 1.64; // atribui valor ao primeiro ítem de alturas
  alturas [1] = 1.68; // atribui valor ao segundo item de alturas
  alturas [2] = 1.93; // atribui valor ao terceiro item de alturas
  noLoop();
}

void draw() {
  for (int i=0; i<alturas.length; i++)//percorre o array alturas
    rect (i*20, 90, 10, -alturas[i]*20); // desenha retangulos
  }
