
//Original: http://processing.org/examples/storinginput.html

//Added two new variables for controlling separately:
//the size and quantity of circles and the quantity of positions of circles.
//int num = 120;

float tamanho = 60;  //Diametro Máximo dos Círculos
int circulos = 60; //Quantidade de Círculos
int posicoes = 60; //Quantidade de Posições


//float mx[] = new float[num];
//float my[] = new float[num];

float mx[] = new float[posicoes];
float my[] = new float[posicoes];

void setup() {
  size(640, 360);
  noStroke();
  fill(255, 153);
}

void draw() {
  background(51); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % posicoes;
 
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < circulos; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % posicoes;
    float diametro = (tamanho - circulos) + (i + 1); 
    ellipse(mx[index], my[index], diametro, diametro);
  }
}
