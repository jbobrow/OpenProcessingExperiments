
PImage foto,foto2,foto3,desbloquejar2,llamar2,matrix2,angry2,paint2;
PFont fecha;
Boto b1, b2,b3,b4,b5,b6,b7,b8,b9;
int pantalla=1;
Ocells[] ocells = new Ocells[20];
Grog[] grog = new Grog[20];
boolean pasa=false;
void setup(){
size(400,600);
//fons
foto= loadImage("http://img844.imageshack.us/img844/2015/20zy8g8.png");
foto2= loadImage("numero.jpg");
foto3=loadImage("http://spottydotty.co.nz/wp-content/uploads/2012/12/angry-birds-sqare-1024x1024.jpg");
//icones
desbloquejar2= loadImage("desbloquejar.png");
llamar2= loadImage("llamar.png");
matrix2= loadImage("matrix.png");
angry2= loadImage("angry.png");
paint2=loadImage("paint.png");
      b1 = new Boto((width/2)-40, height/3*2, color(255), 80, 80, 1, 2, "Desbloquejar");
      //Aplicacio Trucar
      b2 = new Boto(20, 20, color(255), 80, 80, 2, 3, "Trucar");
      b3 = new Boto(width/2, height-50, color(255), 40, 40, 3, 2, "Menu");
      //Aplicacio Angrybirds
      b4 = new Boto(120, 20, color(255), 80, 80, 2, 4, "Angry Birds");
      b6 = new Boto(width/2, height-50, color(255), 40, 40, 4, 2, "Menu");
      //Aplicacio Matrix
      b5 = new Boto(220, 20, color(112), 80, 80, 2, 5, "Matrix");
      b7 = new Boto(width/2, height-50, color(255), 40, 40, 5, 2, "Menu");
      //Aplicacio Paint
      b8 = new Boto(20, 150, color(255), 80, 80, 2, 6, "Paint");
      b9 = new Boto(width/2, height-50, color(255), 40, 40, 6, 2, "Menu");
}

void draw(){
  switch(pantalla){
    case 1: desbloquejar();break;
    case 2: menu();break;
    case 3: numero();break;
    case 4:angry();break;
    case 5:matrix();break;
    case 6:paint();break;
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
  b9.apreta();
}
void mouseReleased(){
 pasa=true; 
}
  
void angry(){
  image(foto3,0,0);
  for (int i = 0; i < ocells.length;i++){
    ocells[i] = new Ocells(0, random(height), random (1,4));
  }
  for (int i = 0; i < grog.length;i++){
    grog[i] = new Grog(0, random(height), random (1,4));
  }
  for (int i = 0; i < ocells.length;i++){
   ocells[i].vermell();
   ocells[i].moure();
  }
  for (int i = 0; i < grog.length;i++){
   grog[i].grog();
   grog[i].moure();
  }
  b6.casa2();
 }
 
boolean cargando= false;
int posX=200;
float x=10;
int contador=1;
void matrix(){
  background(0,0,0);
      //Presentacio
      fill(0,255,0);
      textSize(30);
      text("Si vols jugar a Matrix",150,200);
      text("clica aquì",200,250);
      rect(220,300,100,50);
      textSize(20);
      fill(0,0,0);
      text("Jugar",240,335);
      if(mousePressed==true&&mouseX>=220&&mouseX<=320&&mouseY>=300&&mouseY<=350){
        cargando=true;
      }
      
      //Cargando
      if(cargando==true){
           //borrar tot
           fill(0,0,0);
           rect(0,0,700,500);
           //text cargant
           textSize(20);
           fill(0,255,0);
           text("Cargando...",300,400);
               //1,0
               int posicioX= 00;
                 while(posicioX<=680){
                        while(contador<=4){
                          frameRate(5);
                          textSize(10);
                          text("1",posicioX,x);
                          x= x+10;
                          text("0",posicioX,x);
                          x= x+10;
                          contador=contador+1;
                        }
                   posicioX=posicioX+10;
                   contador=0;
                   x=random(0,400);
                   }
               }
               b7.casa();
      }   

class Ocells {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  Ocells(){
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
    ySpeed = 1;
  }
  Ocells(float x, float y, float vel){
    xPos = x;
    yPos = y;
    xSpeed = vel;
    ySpeed = vel;
  }
  void vermell(){
    //rodona vermella
    fill(255,0,0);
    stroke(0);
    strokeWeight(1);
    ellipse (xPos -10, yPos -10, 60, 60);
    
    //ulls
    fill(255);
    ellipse (xPos -10, yPos-20, 20, 20);
    ellipse (xPos+10, yPos-20, 20, 20);
      //negres
      fill(0);
      ellipse (xPos -10, yPos-20, 3, 3);
      ellipse (xPos+10, yPos-20, 3, 3);
      
    //rodona beix
    fill(#F5DA81);
    noStroke();
    ellipse (xPos-5, yPos+7, 35, 22);
    
    //celles
    stroke(0);
    strokeWeight(5);
    line(xPos,yPos-23,xPos-15,yPos-30);
    line(xPos,yPos-23,xPos+15,yPos-30);
    
    //nas
    fill(#FFBF00);
    strokeWeight(1);
    triangle (xPos,yPos-15 , xPos-10,yPos-2, xPos+20,yPos-2);
    triangle (xPos,yPos+6 , xPos-10,yPos-2, xPos+12,yPos-2);
    //cua
    stroke(0);
    strokeWeight(5);
    line(xPos-45,yPos-10,xPos-40,yPos-10);
    line(xPos-45,yPos,xPos-40,yPos-10);
    
    //cresta
    stroke(255,0,0);
    strokeWeight(5);
    line(xPos-20,yPos-42,xPos-10,yPos-40);
    line(xPos-20,yPos-50,xPos-10,yPos-40);
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
    yPos = (yPos + ySpeed)%height;
  }
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
    xPos = width/2-20;
    yPos = height/3*2;
    c = color(255,0,0);
    widthB = 40;
    heightB = 40;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Boto";
  }
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 15);
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
  
  //boto daplicacions
  void dibuixa(){
    strokeWeight(1);
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos+5, yPos + heightB+20);
  }
  
  //boto tornar al menu
  void casa(){
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(xPos, yPos+10, widthB-10, heightB-10, 5);
    triangle(xPos-15,yPos+10,xPos+45,yPos+10,xPos+15,yPos-10);
  }
  void casa2(){
    strokeWeight(1);
    stroke(255);
    fill(0);
    rect(xPos, yPos+10, widthB-10, heightB-10, 5);
    triangle(xPos-15,yPos+10,xPos+45,yPos+10,xPos+15,yPos-10);
  }
  
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
class Grog {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  Grog(){
    xPos = width/2;
    yPos = height/2;
    xSpeed = 10;
    ySpeed = 10;
  }
  Grog(float x, float y, float vel){
    xPos = x;
    yPos = y;
    xSpeed = vel;
    ySpeed = vel;
  }
  void grog(){
    //triangle grog
    stroke(0);
    strokeWeight(3);
    fill(#FFFF00);
    triangle(xPos-40,yPos,xPos-10,yPos-70,xPos+40,yPos);
    
    //ulls
    fill(255);
    strokeWeight(1);
    ellipse(xPos-5,yPos-30,15,15);
    ellipse(xPos+12,yPos-30,15,15);
      //punt negre
      fill(0);
      ellipse(xPos-5,yPos-30,2,2);
      ellipse(xPos+10,yPos-30,2,2);
   //celles
   stroke(#B45F04);
   strokeWeight(6);
   line(xPos-12,yPos-40,xPos+2,yPos-35);
   line(xPos+4,yPos-35,xPos+16,yPos-40);
   
   //nas
   fill(#FFBF00);
   stroke(0);
   strokeWeight(1);
   triangle(xPos,yPos-30,xPos-5,yPos-20,xPos+20,yPos-20);
   triangle(xPos,yPos-15,xPos-5,yPos-20,xPos+10,yPos-20);
   
    //cua
   strokeWeight(6);
   line(xPos-30,yPos-30,xPos-40,yPos-30);
   line(xPos-30,yPos-30,xPos-40,yPos-40);
   line(xPos-30,yPos-30,xPos-40,yPos-20);
   
   //cabell
   line(xPos-10,yPos-70,xPos-20,yPos-80);
   line(xPos-10,yPos-70,xPos-17,yPos-70);
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}
void menu(){
   background(0);
   textSize(12);
   image(llamar2,20,20);
   image(angry2,120,20);
   image(matrix2,220,20);
   image(paint2,20,150);
   b2.dibuixa();
   b4.dibuixa();
   b5.dibuixa();
   b8.dibuixa();
   b3.casa();
}
boolean numero1, numero2, numero3, numero4,numero5,
numero6,numero7,numero8,numero9,numero0= false;
String texte=" ";
int contador2=1;
boolean trucar=false;
void numero(){
 image(foto2,0,0); 
  b3.casa();
  textSize(30);
  text(texte,60,75);
  //teclejar numeros
          if(mousePressed==true&&mouseX<=135&&mouseY>=116&&mouseY<=203&&contador2<=9&&pasa==true){
            pasa=false;
            texte=texte+1;
            contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=136&&mouseX<=265&&mouseY>=116&&mouseY<=203&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+2;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=266&&mouseX<=width&&mouseY>=116&&mouseY<=203&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+3;
             contador2=contador2+1;
           }
          if(mousePressed==true&&mouseX<=135&&mouseY>=204&&mouseY<=289&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+4;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=136&&mouseX<=265&&mouseY>=204&&mouseY<=289&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+5;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=266&&mouseX<=width&&mouseY>=204&&mouseY<=289&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+6;
             contador2=contador2+1;
           }
          if(mousePressed==true&&mouseX<=135&&mouseY>=290&&mouseY<=374&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+7;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=136&&mouseX<=265&&mouseY>=290&&mouseY<=374&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+8;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=266&&mouseX<=width&&mouseY>=290&&mouseY<=374&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+9;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=136&&mouseX<=265&&mouseY>=375&&mouseY<=459&&contador2<=9&&pasa==true){
             pasa=false;
             texte=texte+0;
             contador2=contador2+1;
           }
           if(mousePressed==true&&mouseX>=266&&mouseX<=width&&mouseY>=460&&mouseY<=536&&pasa==true){
             pasa=false;
             texte=" ";
             contador2=1;
           }
           if(mousePressed==true&&mouseX>=136&&mouseX<=265&&mouseY>=460&&mouseY<=536&&pasa==true){
             pasa=false;
             trucar=true;
           }
           /*if(texte="620794494"){
            texte="Isaac"; 
           }*/
           if(trucar==true){
             fill(0);
             rect(0,25,width,90);
             fill(255);
             text("Estas trucant al"+ texte,20,60);
           }
           
}
float color1= 255;
float color2= 255;
float color3= 255;
void paint(){
  noStroke();
  fill(0);
  rect(0,0,width,height);
  strokeWeight(3);
  stroke(color1,color2,color3);
  line(mouseX,mouseY,pmouseX,pmouseY);
  if(mouseX>100){
    line((mouseX-100),mouseY,(pmouseX-100),pmouseY);
  }
          //funcio mousePressed
          if(mousePressed==true){
            color1=random(0,255);
            color2=random(0,255);
            color3=random(0,255);
            fill(color1,color2,color3);
                ellipse(mouseX,mouseY,20,20);
                ellipse((mouseX-12),(mouseY-12),4,4);
                ellipse((mouseX-12),(mouseY+12),4,4);
                ellipse((mouseX+12),(mouseY+12),4,4);
                ellipse((mouseX+12),(mouseY-12),4,4);
                ellipse((mouseX-100),mouseY,20,20);
                ellipse((mouseX-112),(mouseY-12),4,4);
                ellipse((mouseX-112),(mouseY+12),4,4);
                ellipse((mouseX-88),(mouseY+12),4,4);
                ellipse((mouseX-88),(mouseY-12),4,4);
            }
  b9.casa();
}

void desbloquejar(){
 //fons
  image(foto,0,0);
  fill(0,255,0);
  image(desbloquejar2,(width/2)-40, height/3*2);
  //fecha
      //hora i minuts
      fill(255);
      fecha = createFont("Georgia",100); 
      textFont(fecha);
      int hora = hour();
      int minuts = minute();
      String s = String.valueOf(hora);
      text(s, (width/2)-100, height/4);
      text(":",width/2, height/4);
      s = String.valueOf(minuts);
      text(s, (width/2)+40, height/4);
      
      //Dia,mes i any
      fecha = createFont("Georgia",25); 
      textFont(fecha); 
      int dia = day();
      int mes = month();
      int any = year();  
      s = String.valueOf(dia);
      text(s, (width/2)-60, height/3);
      text(",",width/2-30, height/3);
      s = String.valueOf(mes);
      text(s, width/2-20, height/3); 
      text(",",width/2+10, height/3);
      s = String.valueOf(any);
      text(s, (width/2)+20, height/3);
 b1.dibuixa();   
}


