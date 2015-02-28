

 /** <strong> "ROTACIÓN DE CUBO 3D" </strong> 
*Proyecto Final de II Trimestre de 2009. LCO. Processing 
*Entrega: Martes 25 de Agosto. 
*Por Gabriel Jadue Rivera
*Basado en ejemplo de tutorial de www.openprocessing.org. 
* 
*Sketch interactivo con el mouse(keyPressed ) .
*Una imagen cargada de fondo.
*los radianes estipulados demarcan el recorrido que posteriormente haran las esferas 
* La interacción   nombradas con letras a, s ,r,l,d hacen variar la velocidad y los momentos en los que deben parar.
*la letra r reinicia y se puede comonzar a tabajar nuevamente.
*/ 
 

PGraphics[] cuadrogabo = new PGraphics[10];
PImage gabo;
PImage fondo;
float x, y,r,n,N;
float angulox = 10.0;
float anguloy = 8.0;
int feliz = 0;

void setup() {
  
gabo = loadImage("gabo xoro.png"); 
fondo= loadImage("gabo cool fondo.jpg");
size(556, 552,P3D);
noSmooth();


gabo=loadImage("gabo xoro.png");
for (int i = 0; i < cuadrogabo.length; i+=2)  {
    cuadrogabo[i] = createGraphics(width, height, JAVA2D);
  }  
}

void draw()

{background(fondo);
  fill(0,15);
  rect(0,0,width,height);
  r+=1;
 n+=0.01;
 N=noise(n)*2;
  //  X, Y posiciones que determinan hasta que lugar llegara la imagen cargada.
  x = (width/2)*sin((radians(angulox))*0.09);
  y = (height/2)*cos((radians(anguloy))*1.7);

  //  el ángulo del seno
 
  if (keyPressed ){
        if (key == 'a' || key == 'A'){
    angulox += (PI*2)*N;
    anguloy += (PI*1.5)*N;
  } else if (key == 's' || key == 'S'){
    angulox += PI/2;
  anguloy += PI/2 - 3;
  } 
 else if(key == 'd' || key == 'D'){
     angulox += PI*0.5;
  anguloy += PI*2;
}
  else if(key == 'l' || key == 'L'){
     angulox += PI/16;
  anguloy += PI*8;
  }
 if (key == 'r' || key == 'R'){
    setup();
  }}
  
    
  cuadrogabo[feliz].beginDraw();
 
  cuadrogabo[feliz].image(gabo, x+(width/2)-15, y+(height/2)-15);
  cuadrogabo[feliz].endDraw();           

  image(cuadrogabo[feliz], 0, 0, width, height);

  feliz = (feliz+2) % cuadrogabo.length;

 
}

