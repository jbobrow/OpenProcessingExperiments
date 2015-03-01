

PImage im[] = new PImage[10];   // Array para 10 imagenes
String imFile[] = {
  "0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"
}; 
String valor[] = {
  "Céntimos de Euro", "Euros", "Millones de Euros", "Céntimos de Euro", "Céntimos de Euro", "Céntimos de Euro"
};
PImage moneda;
int ran = (int)random(9);
int val = (int)random(3);



void setup() {
  size(600, 600);
  background(0);


  for (int i = 0; i < 10; i = i + 1) {
    im[i] = loadImage(imFile[i]); 
    moneda = loadImage("moneda2.gif");
    cursor(moneda);
    

   
  
    
  }
}

void draw() {

  dibujo();




  color theColor;

  //y le asignamos, vÃ­a la funciÃ³n GET, el color del pÃ­xel en el que se encuentra el MOUSE
  theColor = im[ran].get(mouseX, mouseY);
  //cargamos este color en el FILL
  fill(theColor);
  noStroke();
  rect(mouseX, mouseY, 10, 10);
}

void dibujo() {
  fill(255, 0, 0);
    ellipse(380, 180, 95, 95);
  fill(255);
  textSize(20);
  text("Raspe y Gane ARCHIMEGAMILLONARIO", 220, 50);
  textSize(15);
  text("Raspa el recuadro de la izquerda para saber el \n número", 220, 100);
  text("Clickea en el círculo rojo para saber si \n ganas Céntimos, Euros o Millines de Euros", 220, 275);
  stroke(100);
  line(200, 0, 200, 300);
  line(0, 300, 200, 300);
}




void mousePressed() {
  fill(255,180,60);
  textSize(60);
  stroke(255);
  text(valor[val], 50, 500);
}



