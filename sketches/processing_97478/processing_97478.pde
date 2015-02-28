
// Autor ou Autora LEM
// licença CC A SA 

// Se em javascipt, é preciso especificar a fonte
/* @pjs font="Georgia.ttf"; */
  
PFont fonte;
  
void setup() {
  size(200, 200);
  background(0);
  fonte = createFont("Serif", 12); // crie a fonte 
  textFont(fonte); // especifique que vai usá-la para escrever 
  noLoop(); 
}

void draw() {
  textAlign(RIGHT);
  fill (255); 
  text("Iris 2013", width-10, height-10);
}
