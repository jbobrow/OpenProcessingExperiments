
PImage fons1, fons2, fons3, fons4, fons5;
 
 
Boto b1, b2, b3, b4, b5;
 
 
int pantalla=1;

 
void setup(){
  size(800, 600);
  
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpeg");
  fons3 = loadImage("3.jpg");
  fons4 = loadImage("4.jpg");
   
  b1 = new Boto();
  b2 = new Boto(300, 500, color(255,255,255), 85, 40, 2,3 , "PANTALLA 2");
  b3 = new Boto(450, 500, color(255,255,255), 85, 40, 3, 4, "PANTALLA 3");
  b4 = new Boto(600, 500, color(255,255,255), 85, 40, 4, 1, "FIN");
   
   
}
 
void draw(){
  background(255);
  switch(pantalla){
   case 1:mario1();break;
   case 2:mario2();break; 
   case 3:mario3();break; 
   case 4:mario4();break; 
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
    xPos = 150;
    yPos = 500;
    c = color(255,0,0);
    widthB = 85;
    heightB = 40;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Arial", 12);
    textFont(fonBoto);
    texte = "PANTALLA 1";
  }
  
Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
 
 
    fonBoto = createFont("Arial", 12);
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
    fill(255);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(161,143,121);
    text (texte, xPos + 10, yPos + 20);
    
  }
   
  void apreta(){
    if ((150 <= mouseX && mouseX <= 235 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 1;
    }
    if ((300 <= mouseX && mouseX <= 385 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 2;

 }
  if ((450 <= mouseX && mouseX <= 535 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 3;
}
   if ((600 <= mouseX && mouseX <= 685 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 4;
}
  }
}
  
void mario1(){
image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}

void mario2(){
 image(fons2, 0, 0);

   b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
 
 
}

void mario3(){ 
 image(fons3, 0, 0); 
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
 
   }

void mario4(){ 
 image(fons4, 0, 0); 
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
 }  


