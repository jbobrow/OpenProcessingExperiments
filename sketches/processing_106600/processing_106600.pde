
float[] alturas = {1.45, 1.67, 1.70, 1.55, 1.93}; // declara um array já com valores
void setup() {
   noLoop();
}

void draw() {
  for (int i=0; i<alturas.length; i++)//percorre o array alturas
    rect (i*20, 90, 10, -alturas[i]*20); // desenha retangulos
  }
