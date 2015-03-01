
PImage fase1, fase2, fase3;
Boton home1, home2, home3, escojer, proxy; //clases de botones
int pantalla = 1;

void setup(){
  size(450, 700);
  fase1 = loadImage("1.jpg"); 
  fase2 = loadImage("2.jpg"); 
  fase3 = loadImage("3.jpg"); 
  
  //declaració de botons /1boton
  //home
  home1 = new Boton(205, 650, 35, 1, 1);
  home2 = new Boton(205, 650, 35, 2, 1);
  home3 = new Boton(205, 650, 35, 3, 1);
  //menu
  escojer = new Boton(200, 585, 45, 1, 2);
  //proxy
  proxy = new Boton(65, 545, 56, 2, 3);

  
  
}

void draw(){
  background(222, 184, 135);

  
//telefono
  strokeWeight(0);
  fill(39, 38, 38);
  rect(40, 5, 370, 690, 7);
//pantalla
  rect(50, 25, 350, 620);
  image(fase1,50,25);
//detalles
  strokeWeight(1);
  stroke(0);
  //camara
  fill( 75, 75, 75);
  ellipse( 80, 15, 12, 12);
  fill( 191, 191, 191);
  ellipse( 80, 15, 6, 6);
  //altavoz
  beginShape();
  vertex(195, 7);
  vertex(200, 17);
  vertex(250, 17);
  vertex(255, 7);
  endShape(CLOSE);
//botones dibujo
  //externos
  //vol
  beginShape();
  vertex(40, 65);
  vertex(35, 65);
  vertex(35, 165);
  vertex(40, 165);
  endShape(CLOSE);
  //on/off
  beginShape();
  vertex(410, 75);
  vertex(415, 75);
  vertex(415, 100);
  vertex(410, 100);
  endShape(CLOSE);
  //internos
  //erramientas
  strokeWeight(3);
  stroke(255);
  line(85, 657, 130, 657);
  line(90, 667, 125, 667);
  line(95, 677, 120, 677);
  //atras
  noFill();
  ellipse(350, 667, 40, 20);
  stroke(39, 38, 38);
  fill(39, 38, 38);
  rect(349, 652, -20, 35);
  stroke(255);
  line(351, 657, 358, 651);
  line(351, 657, 358, 663);
  //home
  noFill();
  stroke(50, 79, 216);
  beginShape();
  vertex(215, 665);
  vertex(215, 682);
  vertex(235, 682);
  vertex(235, 665);
  endShape();
  beginShape();
  vertex(205, 670);
  vertex(225, 655);
  vertex(245, 670);
  endShape();
  stroke(0);

//selector de pantalla telefono

switch (pantalla){
    case 1: casa();break;
    case 2: menus();break;
    case 3: proxys();break;
  }


}

void mouseReleased() {
  home1.click();
  home2.click();
  home3.click();
  escojer.click();
  proxy.click();

}
//pantallas
void casa() {
  image(fase1, 50, 25);
}
void menus() {
  image(fase2, 50, 25);
}
void proxys() {
  image(fase3, 50, 25);
}
class Boton {
  int x; 
  int y;
  int longitud;
  int pantalla1;
  int pantalla2;
  
  Boton(int xx, int yy, int longitudd, int pantallaa1, int pantallaa2) {
    x = xx;
    y = yy;
    longitud = longitudd;
    pantalla1 = pantallaa1; 
    pantalla2 = pantallaa2;
    
  }
   void click() {
     if ((x <= mouseX && mouseX <= x + longitud) && (y <= mouseY && mouseY <= y + longitud) && pantalla == pantalla1){
     pantalla = pantalla2; }
   
   
   }
}


