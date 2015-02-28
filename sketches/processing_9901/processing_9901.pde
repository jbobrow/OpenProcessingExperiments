
Riscos riscos;

void setup() {
  background(255); 
  size(800,600);
  frameRate(1);
  riscos = new Riscos();
  riscos.carrega();


}

void draw() {
  background(255);
  riscos.dimensoes();
}

void mousePressed(){
  background(255);
}



