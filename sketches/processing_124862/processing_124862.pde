
PImage fons1, fons2, fons3, fons4;
Boto b1, b2, b3, b4, b5, b6, b7, b8;
int pantalla=1;

void setup(){
  size(650, 500);
  fons1 = loadImage("1.png");
  fons2 = loadImage("2.png");
  fons3 = loadImage("3.png");
  fons4 = loadImage("4.png");
  b1 = new Boto(270, 30, color(255,0), 80, 80, 1, 2, "");
  b2 = new Boto(270, 150, color(255,0), 80, 80, 1, 4, "");
  b3 = new Boto(270, 265, color(255,0), 80, 80, 1, 3, "");
  b4 = new Boto(270, 400, color(255,0), 80, 80, 1, 3, "");
  b5 = new Boto(580, 450, color(50,0,255), 60, 30, 4, 1, "volver");
  b6 = new Boto(580, 450, color(50,0,255), 60, 30, 3, 1, "volver");
  b7 = new Boto(580, 450, color(50,0,255), 60, 30, 3, 1, "volver");
  b8 = new Boto(580, 450, color(50,0,255), 60, 30, 2, 1, "volver");

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: oper();break;
    case 2: suma();break;
    case 3: resta();break;
    case 4: md();break;
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
  b8.apreta();
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
    xPos = width/2;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 50;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Boto";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 12);
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
    noStroke();
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
void oper(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  println(mouseX + "," + mouseY);
}
void suma(){
  image(fons2, 0, 0);
  b5.dibuixa();
}
void resta(){
  image(fons3, 0, 0);
  b6.dibuixa();
}
void md(){
  image(fons4, 0, 0);
  b7.dibuixa();
}


