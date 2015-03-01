
PImage fons1, fons2;
Boto b1, b2;
int pantalla=1;

void setup(){
  size(875, 700);
  fons1 = loadImage("pantalons.jpg");
  fons2 = loadImage("camisa.jpg");
  b1 = new Boto();
  b2 = new Boto(63, 161, color(0,0,255), 100, 60, 2, 1, "Pantalons");

}
void draw(){
  println(mouseX, mouseY);
  background(255);
  beginShape();
  fill(200,100,0);
  vertex(550,103);
  vertex(250,103);
  vertex(250,500);
  vertex(550,500);
  vertex(550,103);
  endShape();
  fill(0);
  ellipse(366, 315, 20, 20);
  
  //porta
  beginShape();
  fill(200,100,0);
  vertex(550,103);
  vertex(645,130);
  vertex(645,541);
  vertex(550,500);
  endShape();
  
  
  line(405,104,405,500);
  
  //rectangle de fotos
  beginShape();
  fill(255);
  vertex(405, 103);
  vertex(550, 103);
  vertex(550, 500);
  vertex(405, 500);
  endShape();
  
  switch(pantalla){
    case 1: cerrado();break;
    case 2: abierto();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
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
    xPos = 54;
    yPos = 278;
    c = color(0,255,100);
    widthB = 100;
    heightB = 70;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Comic Sans MS", 2);
    textFont(fonBoto);
    texte = "Camisa";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Comic Sans MS", 20);
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
void cerrado(){
  image(fons1, 405, 330);
  b1.dibuixa();
}
void abierto(){
  image(fons2, 405,108);
  b2.dibuixa();
}


