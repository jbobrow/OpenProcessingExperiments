
Riscos riscos;
 
 void setup(){
  background(255);
  size(800, 600);
  frameRate(1);
  riscos = new Riscos();
  riscos.carrega();
}

void draw(){
    riscos.desenho();
}

void mousePressed(){
  background(255);
}

