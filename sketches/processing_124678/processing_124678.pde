


PImage fons1, fons2, fons3, fons4, fons5; 


Boto b1, b2, b3, b4, b5;


int pantalla=1; 

void setup(){ 
  size(203, 207); 
 
  fons1 = loadImage("honestidad1.jpg");
  fons2 = loadImage("honestidad2.jpg");
  fons3 = loadImage("honestidad3.jpg");
  fons4 = loadImage("honestidad4.jpg"); 
  
  b1 = new Boto();
  b2 = new Boto(40, 168, color(255,255,255), 30, 25, 2, 3, "-->");
  b3 = new Boto(70, 169, color(255,255,255), 30, 25, 3, 4, "-->");
  b4 = new Boto(100, 170, color(255,255,255), 45, 25, 4, 1, "return");
  
  
} 

void draw(){ 
  background(255); 
  switch(pantalla){ 
   case 1:princi();break; 
   case 2:honesti1();break;  
   case 3:honesti2();break;  
   case 4:honesti3();break;  
   case 5:honesti4();break; 
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
    xPos = 8;
    yPos = 167;
    c = color(255,0,0);
    widthB = 30;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Arial", 12);
    textFont(fonBoto);
    texte = "-->";
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
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}

void princi(){
image(fons1, 0, 0);
  b1.dibuixa();
}

void honesti1(){ 

  image(fons2, 0, 0); 
  b2.dibuixa();  


} 


void honesti2(){  

 image(fons3, 0, 0);  
 b3.dibuixa(); 

   } 


void honesti3(){  


 image(fons4, 0, 0);  


 b4.dibuixa(); 


}    


void honesti4(){ 

  image(fons5, 0, 0); 
  
  
} 


  



