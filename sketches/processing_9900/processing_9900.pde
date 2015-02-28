
Riscos riscos;

void setup() {
  riscos = new Riscos();
  riscos.carrega();
  size(800,600);
  frameRate(1);


}

void draw() {
  background(255);
  riscos.dimensoes();
}

void mousePressed(){
  background(255);
}


