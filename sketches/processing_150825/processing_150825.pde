
Circulo circulo1;
Circulo circulo2;
Circulo circulo3;

void setup() {
  size(800,800);
  frameRate(15);
  smooth();
  
  circulo1 = new Circulo(100);
  circulo2 = new Circulo(50);
  circulo3 = new Circulo(250);
}

void draw() {
  background(98,17,17);
    
    
  circulo1.actualizar(mouseX, mouseY);
  circulo1.mostrar(15);
  
  circulo2.actualizar(pmouseX, pmouseY);
  circulo2.mostrar(15);
  
  circulo3.actualizar(pmouseX-100, pmouseY-100);
  circulo3.mostrar(8);
}
class Circulo {
  int [] xpos;
  int [] ypos;
  
  Circulo(int i) {
    xpos = new int [i];
    ypos = new int [i];
  }
  
  void actualizar(int newX, int newY) {
    //shift all elements down one spot. Stop at the second to last element.
    for(int i = 0; i < xpos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = newX;
  ypos[ypos.length-1] = newY;
}


void mostrar(int a) { 
  for (int i = 0; i < xpos.length; i++) {
  strokeWeight(40);
  stroke(240, 150, 5-i*5, a);
  noFill();
  ellipse(xpos[i], ypos[i], i, i);
  noCursor();
  }
}
}


