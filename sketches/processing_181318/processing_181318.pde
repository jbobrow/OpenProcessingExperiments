

PImage fons1, fons2, fons3, fons4, fons5, fons6, fons7;
Boto b1, b2, b3, b4, b5, b6, b7, b10, b20, b30;
int pantalla=1;


void setup(){
  size(755, 539);
  fons1 = loadImage("escritori.JPG");
  fons2 = loadImage("google.JPG");
  fons3 = loadImage("llocs.JPG");
  fons4 = loadImage("billeteRoma.JPG");
  fons5 = loadImage("billeteCaribe.JPG");
  fons6 = loadImage("billeteBR.JPG");
  fons7 = loadImage("billetePeru.JPG");
  
  b1 = new Boto();
  b2 = new Boto(417, 348, color(255,255,255), 93, 19, 2, 3);
  b3 = new Boto(320, 77 ,color(255,255,255), 44, 42, 3, 4);
  b10 = new Boto(378, 320 ,color(255,255,255), 42, 41, 3, 5);
  b20 = new Boto(682, 74 ,color(255,255,255), 46, 42, 3, 6);
  b30 = new Boto(682, 305 ,color(255,255,255), 47, 32, 3, 7);
  b4 = new Boto(50, 50 ,color(0,0,255), 100, 20, 4, 1);
  b5 = new Boto(50, 50 ,color(0,0,255), 100, 20, 5, 1);
  b6 = new Boto(50, 50 ,color(0,0,255), 100, 20, 6, 1);
  b7 = new Boto(50, 50 ,color(0,100,255), 100, 20, 7, 1);

}
void draw(){
  background(#99CCFF);
 
  switch(pantalla){
    case 1: escritori();break;
    case 2: google();break;
    case 3: llocs();break;
    case 4: billeteRoma();break;
    case 5: billeteCaribe();break;
    case 6: billeteBR();break;
    case 7: billetePeru();break;
  }
  
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
  b5.apreta();
  b6.apreta();
  b7.apreta();
  b10.apreta();
  b20.apreta();
  b30.apreta();
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
    xPos = 4;
    yPos = 146;
    c = color(240, 240, 240);
    widthB = 40;
    heightB = 40;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Arial", 16);
    textFont(fonBoto);
    
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
  
  void dibuixa(){
    //Es el boto
    fill(c, 0);
    //Posicio mida
    rect(xPos, yPos, widthB, heightB, 5); 
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void escritori(){
  image(fons1, 0, 0);
  b1.dibuixa();
}
void google(){
  image(fons2, 0, 0);
  b2.dibuixa();
}
void llocs(){
  image(fons3, 0, 0);
  b3.dibuixa();
}
void billeteRoma(){
  image(fons4, 144, 156);
  textSize(20);
  fill(#606060);
  text("UBUNTU", 50,68);
  text("Has vist que fàcil anar se'n de viatge!", 231, 51);
  b4.dibuixa();
}
void billeteCaribe(){
  image(fons5, 144, 156);
  textSize(20);
  fill(#606060);
  text("UBUNTU", 50,68);
  text("Has vist que fàcil anar se'n de viatge!", 231, 51);
  b5.dibuixa();
}
void billeteBR(){
  image(fons6, 144, 156);
  textSize(20);
  fill(#606060);
  text("UBUNTU", 50,68);
  text("Has vist que fàcil anar se'n de viatge!", 231, 51);
  b6.dibuixa();
}
void billetePeru(){
  image(fons7, 144, 156);
  textSize(20);
  fill(#606060);
  text("UBUNTU", 50,68);
  text("Has vist que fàcil anar se'n de viatge!", 231, 51);
  b7.dibuixa();
}


