
Circ[] myCirc = new Circ[10];

void setup() {
  size(500, 600);
  smooth();
  int ancho = 50; 
  // ARRAY FOR INITILIAZING CIRC 
  for (int i = 0; i < myCirc.length; i++) {  
    myCirc[i] = new Circ(100+i, i*ancho, ancho, 60);
  }
}

void draw() {
  background(20 );

  for (int i = 1; i < myCirc.length; i++) {
    myCirc[i].display(abs(mouseX/2)); // RUN Circ
  }
}


class Circ { // CLASS NAME
  // DATA
  color col; // color de los circulos
  int tam; // tamaño de los circulos
  int posx; // posx cirulos
  int posy; // posy de circulos

  // CONSTRUCTOR
  Circ(color tempcol, int tempposx, int tempposy, int temptam) {
    posx = tempposx; // posx cirulos
    posy = tempposy; // posy de circulos
    col = tempcol; // color de los circulos
    tam = temptam; // tamaño de los circulos
  }

  // ADDING FUNCTIONALITY - FUNCTIONS 
  void display(int myMouse) {
    noStroke();
    ellipseMode(CENTER);
    // ELLIPSE 01
for(int i = 0; i < (height-50); i+= 50){
    // ELLIPSE 01
    fill(150, 150, abs(i/2)); 
    ellipse(posx, posy+i, tam, tam);
    // ELLIPSE 02
    fill(myMouse, 10, abs(i/2)); 
    ellipse(posx, posy+i, tam*.75, tam*.75);
    // ELLIPSE 03
    fill(abs(i/2), 100, 50); 
    ellipse(posx, posy+i, tam*.5, tam*.5);
}
  }
}




