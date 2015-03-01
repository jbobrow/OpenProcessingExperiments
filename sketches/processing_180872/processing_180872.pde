
/* @pjs preload="subi1.jpg, subi2.jpg, subi3.jpg"; 
 */

PImage fons1, fons2, fons3;
Boto b1, b2;
int primera=1;
int a = 153;
int b = 130;
int c = 130;

void setup(){
  size(650, 650);
  //IMATGES CARREGADES
  fons1 = loadImage("subi1.jpg");
  fons2 = loadImage("subi2.jpg");
  fons3 = loadImage("subi3.jpg");
  //especificant botons
  b1 = new Boto();
  b2 = new Boto(10, 10, color(0,0,255), 30, 60, 2, 1, "torna-hi");

}
void draw(){
  
  background(255,211,155);
  //TELEVISIÓ
  fill(153);
  rect(174,102,315,250);
  line(348,102,280,22);
  line(348,102,400,22);
  ellipse(420,338,10,10);
  ellipse(440,338,10,10);
  fill(a,b,c);
  ellipse(460,338,10,10);
  //MANDO
  fill(255,64,64);
  ellipse(327,475,10,10);
  fill(130);
  rect(262,475,138,200);
  rect(285,560,30,30,7);
  rect(345,560,30,30,7);
  fill(255,64,64);
  rect(345,510,30,30,7);
  fill(50,205,50);
  rect(285,510,30,30,7);
  fill(0);
  fill(130);
  //switch per variar les fotos al apretar el boto
  switch(primera){
    case 1: foto1();break;
    case 2: foto2();break;
  }
  // if per encendre i apagar la televisió
  if (mousePressed && mouseX>346 && mouseX < 375 && mouseY > 511 && mouseY < 540){
    fons1 = loadImage("subi3.jpg");
    fons2 = loadImage("subi3.jpg");
    a = 255;
    b = 64;
    c= 64;
  }else if (mousePressed && mouseX>285 && mouseX < 314 && mouseY > 510 && mouseY < 540){
    fons1 = loadImage("subi1.jpg");
    fons2 = loadImage("subi2.jpg");
    a = 130;
    b = 130;
    c = 130;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
}



class Boto {
  float xPos;
  float yPos;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;  
  
  Boto(){
    xPos = 285;
    yPos = 560; 
    widthB = 30;
    heightB = 30;
    pantallaActual = 1;
    pantallaDesti = 2;
    
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    
    xPos = 345;
    yPos = 560;
   
    widthB = 30;
    heightB = 30;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
  
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && primera == pantallaActual){
      primera = pantallaDesti;
    }
  }
  
  void dibuixa(){
    rect(xPos, yPos, widthB, heightB, 5);
    triangle(288,575,306,566,306,584);
    triangle(371,575,355,567,355,583);
  }

}
void foto1(){
  image(fons1, 188, 116);
  b1.dibuixa();
}
void foto2(){
  image(fons2, 188, 116);
  b2.dibuixa();
}


