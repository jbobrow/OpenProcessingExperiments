
PImage fons1, fons2,fons3,fons4;
Boto b1,b2,b3,b4;
int pantalla=1;
void setup(){
  size(640, 450);
  fons1 = loadImage("4.jpg");
  fons2 = loadImage("1.jpg"); 
  fons3 = loadImage("2.jpg");
  fons4 = loadImage("3.jpg");
  b1 = new Boto();
  b2 = new Boto(100, 80, color(0,0,255), 60, 30, 2, 3, "2");
  b3 = new Boto(170, 80, color(200,100,255), 60, 30, 3, 4, "3");
  b4 = new Boto(240, 80, color(250,200,255), 60, 30, 4, 1, "4");
  
}
void draw(){
  background(100);
  switch(pantalla){
    case 1: sonic1();break;
    case 2: sonic2();break;
    case 3: sonic3();break;
    case 4: sonic4();break;
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
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  
  Boto(){
    xPos = 30;
    yPos = 80;
    c = color(255,0,0);
    widthB = 60;
    heightB = 30;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "1";
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
void sonic1(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic2(){
  image(fons2, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic3(){
  image(fons3, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic4(){
  image(fons4, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}


