
PImage adelante, atras, random, fons1, fons2, fons3, fons4, fons5, fons6, fons7;
Boto b1, b2, b3;
int pantalla=1;
boolean pasa = true;

void setup(){
  size(500, 400);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  fons3 = loadImage("3.jpg");
  fons4 = loadImage("4.jpg");
  fons5 = loadImage("5.jpg");
  fons6 = loadImage("6.jpg");
  fons7 = loadImage("7.jpg");
  adelante = loadImage("adelante.png");
  atras = loadImage("atras.png");
  random = loadImage("random.png");
  b1 = new Boto(atras,0,175);
  b2 = new Boto(adelante,450,175);
  b3 = new Boto(random,450,350);

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: a1();break;
    case 2: b();break;
    case 3: c();break;
    case 4: d();break;
    case 5: e();break;
    case 6: f();break;
    case 7: g();break;
    
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
}
void mouseReleased(){
  pasa = true;
}
 



class Boto {
  float xPos;
  float yPos;
  PImage img; 

  Boto(PImage i, float x, float y){
    img=i;
    
  xPos=x;
      yPos=y;
  }
  
  
  void dibuixa(){
     image(img, xPos, yPos);
  }
  
  void apreta(){
    if ((450 <= mouseX && mouseX <= 500) && (175 <= mouseY && mouseY <= 225) && pasa == true){
     pasa = false;
    
     if(pantalla<7){
       pantalla = pantalla+1;
       }
    }
   if ((0 <= mouseX && mouseX <= 50) && (175 <= mouseY && mouseY <= 225) && pasa == true){
     pasa = false;
      if(pantalla>1){
        pantalla = pantalla-1;
       }
    }
  if ((450 <= mouseX && mouseX <= 500) && (350 <= mouseY && mouseY <= 400) && pasa == true){
     pasa = false;
     int rand=random(1,7);
     pantalla = rand; //no se porque solo coje de 1 a 7 sin el 8
    }}
}

void a1(){
  image(fons1, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void b(){
  image(fons2, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void c(){
  image(fons3, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void d(){
  image(fons4, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void e(){
  image(fons5, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void f(){
  image(fons6, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}
void g(){
  image(fons7, 50, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
}


