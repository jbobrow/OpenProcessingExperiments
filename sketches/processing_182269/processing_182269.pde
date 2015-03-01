
PImage fons1,fons2, fons3, fons4;
Boto b1, b2, b3, b4;
int pantalla=1;


void setup(){
  size(800, 600);
  fons1 = loadImage("New-Super-Mario-Bros-nintendo-ds-1383152-800-600.jpg");
  fons2 = loadImage("New-Super-Mario-Bros-nintendo-ds-1383158-800-600.jpg");
  fons3 = loadImage("New-Super-Mario-Bros-nintendo-ds-1383165-800-600.jpg");
  fons4 = loadImage("new-super-mario-bros-nintendo-ds-princess-funny-wallpaper-800x600.jpg");
  

  b1 = new Boto(50, 500, color(0,0,255),85,40, 1, 2, "1º Mario");
  b2 = new Boto(200, 500, color(0,0,255),85,40, 2, 3 ,"2º Mario");
  b3 = new Boto(350, 500, color(0,0,255),85,40, 3, 4, "luigi");
  b4 = new Boto(500, 500, color(0,0,255),85,40, 4, 1,"Peach");


}
void draw(){
  background(100);
  switch (pantalla){
    case 1: mario1();break;
    case 2: mario2();break;
    case 3: mario3();break;
    case 4: mario4();break;
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
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){ //metodo especial (constructor)
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = 85;
    heightB = 40;
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
    if ((xPos <= mouseX && mouseX <= yPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = 1;
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


