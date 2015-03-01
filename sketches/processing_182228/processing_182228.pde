
PImage fons1, fons2, fons3, fons4;
Boto b1, b2, b3, b4;
int pantalla=1;

void setup(){
  size(700, 400);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  fons3 = loadImage("3.jpg");
  fons4 = loadImage("4.jpg");
  
  b1 = new Boto(50, color(0,0,255), 1, 2, "Insert Coin");
  b2 = new Boto(200, color(0,255,0), 2, 3, "Select");
  b3 = new Boto(350, color(0,255,255), 3, 4,  "Start mision");
  b4 = new Boto(500, color(255,0,255), 4, 1,  "Mision Complete");

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: grup();break;
    case 2: altavoces();break;
    case 3: kenyo();break;
    case 4: montesinos();break;
  }
}
void mousePressed(){
  b1.apreta(color(0,0,255));
  b2.apreta(color(0,255,0));
  b3.apreta(color(0,255,255));
   b4.apreta(color(255,0,255));
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
  
  
  
  Boto(float x, color col, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    xPos = x;
    yPos = 350;
    c = col;
    widthB = 120;
    heightB = 30;
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
  
  void apreta(color col){
    if ((50<= mouseX && mouseX <= 170 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 1; 
      
    }  
    
   if ((200 <= mouseX && mouseX <= 320 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 2;    
     
    }   
   if ((350 <= mouseX && mouseX <= 470 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 3;    
      
    } 
 
   if ((500 <= mouseX && mouseX <= 620 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 4;    
       c = color (255,255,0);
    }    
     else
     {
       c = col;
     }
    }

}
void grup(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void altavoces(){
  image(fons2, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void kenyo(){
  image(fons3, 0, 0);
   b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void montesinos(){
  image(fons4, 0, 0);
   b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}


