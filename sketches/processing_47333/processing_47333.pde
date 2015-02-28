
import netscape.javascript.*;


PImage acua; //imagenes
PImage pisc;
PImage tier;
PImage fond;


PImage f1;
PImage f2;
PImage f3;
PImage f4;

PImage t1;
PImage t2;
PImage t3;
PImage t4;

PImage n1;
PImage n2;
//PImage n3;
//PImage n4;
//PImage n5;
PImage n6;
PImage n7;
//PImage n8;

import ddf.minim.*; //audio
AudioPlayer player;
Minim minim;


float e = 40; // "energia"
int i;
float sz = 30;

int q = 470; // signos
int w = 130;

int a = 120;
int s = 130;

//int v = 150;
//int c = 300;

void setup() {
  size(750, 500);

  smooth();
  background(0);
  
  frameRate(15);
  smooth();
  
minim=new Minim(this); //audio


player=minim.loadFile ("cambio.mp3",2500); // carga del audio
player.play();

fond = loadImage("fond1.jpg"); //carga de imagenes
acua = loadImage("acua1.gif");
pisc = loadImage("pis1.gif");
tier = loadImage("pla.gif");


f1 = loadImage("feliz1.gif");
f2 = loadImage("feliz2.gif");
f3 = loadImage("feliz3.gif");
f4 = loadImage("feliz4.gif");

t1 = loadImage("triste1.gif");
t2 = loadImage("triste2.gif");
t3 = loadImage("triste3.gif");
t4 = loadImage("triste4.gif");

n1 = loadImage("nube1.gif"); //nubes simbolo plasma
n2 = loadImage("nube1.gif");
//n3 = loadImage("nube1.gif");
//n4 = loadImage("nube1.gif");
//n5 = loadImage("nube.gif"); //nubles cuadrado
n6 = loadImage("nube.gif");
n7 = loadImage("nube.gif");
//n8 = loadImage("nube.gif");


}

void draw() {
  
image(fond,0,0);            //imagenes posición
image(acua, q,w,150,150);
image(pisc, a,s,150,150);
//image(tier,v,c,450,450);  //variable de la tierra
image(tier,150,300,450,450);
//v=v-1;   //movimiento variable de la tierra izquiera - derecha.
//c=+1;



image(f1,mouseX-0, mouseY-5,25,35); //imagenes personitas posición
image(f2,mouseX-30, mouseY-0,25,35);
image(f3,mouseX-70, mouseY-3,25,35);
image(f4,mouseX-50, mouseY-5,25,35);

image(t1,mouseX-230, mouseY-0,25,35);
image(t2,mouseX-250, mouseY-7,25,35);
image(t3,mouseX-270, mouseY-4,25,35);
image(t4,mouseX-300, mouseY-8,25,35);


image(n1,mouseX-20, mouseY-40,40,40);
image(n2,mouseX-70, mouseY-40,40,40);
//image(n3,654,53,20,20);
//image(n4,654,434,20,20);
//image(n5,435,235,20,20);
image(n6,mouseX-230, mouseY-40,40,40);
image(n7,mouseX-260, mouseY-40,40,40);
//image(n8,234,234,20,20);



float x = width/2;      // posición energia
  float y = height/3;
 
  colorMode(RGB,100); // colores energia
   

  for(i=0; i<10;i++){   // variables de la energia
    fill(30*i,10,00);
    noStroke();
    
    stroke(15*i,100,200);
    strokeWeight(15); //ancho lineas energia
    line(x + i*10 *sin(e*i),y + i*10 *cos(e*i),x + (i+1)*10 *sin(e*(i+1)),y + (i+1)*10 *cos(e*(i+1)));   
    line(x - i*10 *sin(e*i),y - i*10 *cos(e*i),x - (i+1)*10 *sin(e*(i+1)),y - (i+1)*10 *cos(e*(i+1)));
    }
  e -= 0.0099;
  if(e < -100){
    e = 100;
  }
  


} 

void keyPressed( ){      //movimiento con teclas de los signos

     if(key=='x'||key=='X'){
        q--;
    }else if(key=='d'||key=='D'){
        q++;
    }else if(key=='a'||key=='A'){
        w--;
    }else if(key=='s'||key=='S'){
        w++;
    }
    
      if(key=='x'||key=='X'){
        a--;
    }else if(key=='q'||key=='Q'){
        a++;
    }else if(key=='w'||key=='W'){
        s--;
    }else if(key=='e'||key=='E'){
        s++;
    }
}




