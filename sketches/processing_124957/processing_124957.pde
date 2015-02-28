
PImage fons1, fons2, fons3;
Boto b1, b2, b3;
int pantalla=1;

void setup(){
  size(400, 300);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  fons3 = loadImage("3.jpg");
  b1 = new Boto();
  b2 = new Boto(300,230, color(34,237,17), 85, 30, 2, 3, "Respuesta");
  b3 = new Boto(150, 210, color(30,150,255), 65, 30, 3, 1, "Volver");

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: acertijo();break;
    case 2: pregunta();break;
    case 3: respuesta();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
}




class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  
  Boto(){
    xPos = 300;
    yPos = 265;
    c = color(255,0,0);
    widthB = 80;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Arial", 14);
    textFont(fonBoto);
    texte = "Siguiente";
  }
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 16);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixa(){
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);

  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void acertijo(){
  image(fons1, 0, 0);
  fill(0,0,255);
  text("Un pato y un niño nacen el mismo día", 80,250);
  b1.dibuixa();
}
void pregunta(){
  image(fons2, 0, 0);
  fill(0,0,0);
  text("Al cabo de un año, ¿Cuál es mayor de los 2?", 50,25);
  b2.dibuixa();
}
void respuesta(){
  image(fons3, 0, 0);
  fill(255,0,0);
  text("El pato, porque tiene 1 año y pico", 90,20);
  b3.dibuixa();
}


