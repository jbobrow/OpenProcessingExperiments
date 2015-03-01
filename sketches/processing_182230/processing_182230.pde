
PImage fons1, fons2, fons3, fons4;
Boto b1, b2, b3, b4;
int pantalla=1;

void setup(){
  size(500, 500);
  fons1 = loadImage("primero.jpg");
  fons2 = loadImage("segundo.jpg");
  fons3 = loadImage("quinto.jpg");
  fons4 = loadImage("ultimo.png");
  b1 = new Boto(100, 400, col(0,0,255), 1 ,"primero");
  b2 = new Boto(200, 400, col(0,0,255), 2 ,"Segundo");
  b3 = new Boto(300, 400, col(0,0,255), 3 ,"Quinto");
  b4 = new Boto(400, 400, col(0,0,255), 4 ,"Ultimo");
  
}
void draw(){
  background(100);
  switch(pantalla){
    case 1: primero();break;
    case 2: segundo();break;
    case 3: quinto();break;
    case 4: ultimo();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
}




class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int [] pantallaDesti = {1,2, 3, 4}; 
  PFont fonBoto;
  String texte;
  
  
  Boto(float x, float y, color col, int inici, String t){
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = 50;
    heightB = 50;
    pantallaActual = inici;
    pantallaDesti = 1;
    texte = t;
  }
  
  void dibuixa(){
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void apreta(){
    if ((100 <= mouseX && mouseX <= xPos + widthB) && (400 <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
    if ((200 <= mouseX && mouseX <= xPos + widthB) && (400 <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
    if ((300 <= mouseX && mouseX <= xPos + widthB) && (400 <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
    if ((400 <= mouseX && mouseX <= xPos + widthB) && (400 <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void primero(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}


void segundo(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}

void quinto(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}




