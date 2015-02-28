
float[] alturas; // declara uma variável para conter um array qualquer

void setup() {
  // equação de uma circunferência, em coordenadas cartesianas
  // raio*raio = (x-a)*(x-a) + (y-b)*(y-b)
  // y = sqrt(raio*raio-(x-a)*(x-a)) 
  float raio = 5;
  float a = 5;
  float b = 5; 
  alturas = new float[11];// cria um array com 11 posições e atribuia alturas
  for (int i=0; i<alturas.length; i++)//percorre o array alturas
  {
    alturas[i] = sqrt(raio*raio-pow(i-a,2))+b ;
    println(alturas[i]);
  } // 
  noLoop();
}

void draw() {
  for (int i=0; i<alturas.length-1; i++) {
    //percorre o array alturas
    ellipse (i*10, 100-alturas[i]*8, 5, 5); 
    line(i*10, 100-alturas[i]*8, (i+1)*10, 100-alturas[i+1]*8);
  }
  ellipse ((alturas.length-1)*10, 100-alturas[alturas.length-1]*8, 5, 5);
}
