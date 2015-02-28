
PImage fons1, fons7, cerrar,pantallazo,malo,virus,limpiar;
Boto b1, b2, b3,b4;
int pantalla=1;
float x=random(100,200);
float y=random(100,200);
void setup(){
  size(700, 397);
  fons1 = loadImage("8.jpg");
  fons7 = loadImage("7.jpg");
  cerrar=loadImage("cerrar.png");
  pantallazo=loadImage("pantallazo.png");
  malo = loadImage("detectado.jpg");
  virus= loadImage("virus.jpg");
  limpiar=loadImage("limpio.jpg");
  
  b1 = new Boto();
  b2 = new Boto(530, 120, color(0,255,0), 50, 25, 2, 1, "Volver");
  b3 = new Boto(600, 120, color(0,255,0), 50, 25, 2, 3, "ignorar");
  b4 = new Boto(x,y,color(255),75,75,3,4,"a");

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: escritorio();break;
    case 2: web();break;
    case 3:virus();break;
    case 4:limpio();break;
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
    xPos = 247;
    yPos = 195;
    c = color(255,255,255);
    widthB = 65;
    heightB = 45;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    
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
 void imatge(){
 image(virus,xPos,yPos);
 }
  
  void dibuixa(){
    fill(c,50);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);

  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void escritorio(){
  image(fons1, 0, 0);
  
  b1.dibuixa();
}

int altura=0;
void web(){
  image(fons7, 0, 0);
  stroke(0);
  fill(#BDBDBD,150);
  rect(500,0,200,altura);
  fill(#6E6E6E,50);
  noStroke();
  rect(550,0,150,20);
  image(cerrar,572,0);
  if(altura>=0&&altura<=150){
    
    altura=altura+1;
   
  }if(altura>=150){
   fill(0);
   image(malo,501,30);
   textSize(15);
    text("ALERTA!!! VIRUS",570,80);
    textSize(10);
    text("Pagina peligrosa XXX",510,105);
    text("Borrar",535,133);
    text("Ignorar",605,133);
    b2.dibuixa();
    b3.dibuixa();
  }

}


void virus(){
//  frameRate(1);
  image(pantallazo, 0, 0);
  textSize(30);
  fill(255,0,0);
  text("Borrame si eres capaz so pik(clica encima)" ,30,40);
  b4.imatge();
  if (frameCount%35 == 0){
       println(frameRate);
    
  b4.xPos = random(0,width);
  b4.yPos= random(0,height);
  }
  }

void limpio(){
  
  image(limpiar,0,0);
  textSize(40);
  text("De la que te has " ,width/2-50,height/2-50);
  text("SALVADO", width/2,height/2);
  }


