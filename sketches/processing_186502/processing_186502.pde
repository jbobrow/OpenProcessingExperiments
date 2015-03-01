
/* Soraya I. Perez Rodriguez
Practica 5 - Taller de Creacion de Videojuegos
Grado en Comunicacion Audiovisual
Universidad Pompeu Fabra
Febrero 2015 */


/* Precarga de imagenes */
  /* @pjs preload="Nina1.png", "Nina2.png", "Nina3.png", "Nina4.png", "Nina5.png", "Nina6.png", "Nina7.png", "Nina8.png", "Nina9.png", "Nina10.png", "Nina11.png", "Nina12.png", "Rus1.png", "Rus2.png", "Rus3.png", "Rus4.png", "Rus5.png", "Rus6.png", "Rus7.png", "Rus8.png", "Rus9.png", "Rus10.png", 
  "puerta_fondo.png", "puerta1.png", "puerta2.png", "puerta3.png", "puerta4.png", "puerta5.png", "barco.png", "small_world_logo.png"; */    

// Musica

// Variables para audio (Solo Java)
/*import ddf.minim.*;
AudioPlayer player;
Minim minim;*/


// Variables 

  // -- Color 
  
    color black = color(0);
    color blue = color(125,211,255);
    color darkblue1 = color(1,143,165);
    color darkblue2 = color(0,110,185);
    color darkgreen = color(29,110,67);
    color darkorange = color(242,103,34);
    color green = color(124,186,15);
    color orange = color(255,142,0);
    color pink = color(236,24,75);
    color purple = color(109,32,112);
    color red = color(255,0,0);
    color softblue = color(115,194,201);
    color softblue2 = color(154,213,243);
    color softbrown = color(202,153,101);
    color softgreen = color(219,246,141);
    color softorange = color(255,204,159);
    color softpink = color(255,185,211);
    color softpurple = color(172,114,172);
    color softturquoise = color(136,230,203);
    color turquoise = color(0,170,170);
    color white = color(255);
    color yellow = color(255,219,1);

    // --- Color fondo

      color sky = color(23,22,43);


  // -- Numericas 

    int numOlasGrandes = 9;
    int numOlasPeques = 18;


  // -- Imagenes
  
    PImage Logo;
    PImage PuertaFondo;
  
  
  // -- Objetos
  
    Nube Nube1;
    Nube Nube2;
    Nube Nube3;
    Nube Nube4;
    
    Barco barco;
    
    Puerta puerta;
    
    Personaje p;
    
    Ola O1;
  
  // -- Arrays
  
    Doll[] dolls = new Doll[12];
    
    Ola[] OlasGrandes = new Ola[numOlasGrandes];
    Ola[] OlasPeques = new Ola[numOlasPeques];
  


void setup(){

  size(900,450);

  // Inicializacion Objetos  
  initNubes();
  initPersonaje();  
  initPuerta(); 
  
  barco = new Barco(0,0,70,72,0,0.005, 0.05);
  
  // Carga Logo
  Logo = loadImage("small_world_logo.png");
  
  // Inicializacion Arrays  
  initDolls();
  initOlas();  
    
  // Audio
  //initAudioJava();
  initAudioJavascript();
}

void draw(){

  background(sky);
   
  // Cielo
  paintSky();   
    
  // Nubes
  paintNubes();
  
  // Torres  
  torrereloj();
  torreABCD();
  torrearcos();
  torrerect();
  torrelineas();
  torrecuadrados();
  
  // Suelo  
  suelo();
    
  // Olas + Barco
  paintOlasBarco();
     
  // Munecos (Nines)
  paintDolls();
  
  // Puerta
  image(PuertaFondo,width-45,height-160,90,60);
  puerta.paint();
  
  // Personajes
  p.paint(); 
  p.x=(minute()-2)*15+5;
  
  // Logo
  image(Logo,50,130,400,91);
  
}


///////////////////////////// FUNCIONES /////////////////////////////

// Parada Musica

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

/*
// Inicializacion de audio solo para Java
void initAudioJava(){
  minim = new Minim(this);
  player = minim.loadFile("small_world.mp3", 2048);
  player.play();
}*/

void initAudioJavascript(){
  Audio audio = new Audio();
  float vol = 1;

  audio.setAttribute("src","small_world.mp3");
  audio.play();
  audio.volume=constrain(vol,0,1);
}

void initNubes(){
  Nube1 = new Nube(30,40,30,"asc");
  Nube2 = new Nube(300,80,30,"desc");
  Nube3 = new Nube(150,230,30,"desc");
  Nube4 = new Nube(700,40,25,"asc"); 
}
  
void initPersonaje(){
  p = new Personaje(0,height-168,55,80,10,2);
  
  // Carga de los SpriteSheets de Russel
  for(int i=0;i<10;i++){
    p.addSprite(i, loadImage("Rus" + (i+1) + ".png"));  
  }
}

void initPuerta(){
  puerta = new Puerta(width-45,height-160,90,60,5,6);
  
  // Carga de los SpriteSheets de la puerta
  for(int i=0;i<5;i++){
    puerta.addSprite(i, loadImage("puerta" + (i+1) + ".png"));  
  }
  
  PuertaFondo = loadImage("puerta_fondo.png");
}

void initDolls(){
 
  dolls[0] = new Doll(width-298,35,38,50, loadImage("Nina1.png"));
  dolls[1] = new Doll(width-398,105,38,50, loadImage("Nina2.png"));
  dolls[2] = new Doll(width-124,94,38,50, loadImage("Nina3.png"));
  dolls[3] = new Doll(width-225,154,38,50, loadImage("Nina4.png"));
  dolls[4] = new Doll(width-333,64,38,50, loadImage("Nina5.png"));
  dolls[5] = new Doll(width-95,34,38,50, loadImage("Nina6.png"));
  dolls[6] = new Doll(width-261,35,38,50, loadImage("Nina7.png"));
  dolls[7] = new Doll(width-157,154,38,50, loadImage("Nina8.png"));
  dolls[8] = new Doll(width-65,33,38,50, loadImage("Nina9.png"));
  dolls[9] = new Doll(width-360,67,38,50, loadImage("Nina10.png"));
  dolls[10] = new Doll(width-191,154,38,50, loadImage("Nina11.png"));
  dolls[11] = new Doll(width-35,37,38,50, loadImage("Nina12.png"));

}
 
void initOlas(){
 
  OlasGrandes[0] = new Ola(50,height,150,150,PI,TWO_PI);
  OlasGrandes[1] = new Ola(150,height,150,150,PI,TWO_PI);
  OlasGrandes[2] = new Ola(250,height,150,150,PI,TWO_PI);
  OlasGrandes[3] = new Ola(350,height,150,150,PI,TWO_PI);
  OlasGrandes[4] = new Ola(450,height,150,150,PI,TWO_PI);
  OlasGrandes[5] = new Ola(550,height,150,150,PI,TWO_PI);
  OlasGrandes[6] = new Ola(650,height,150,150,PI,TWO_PI);
  OlasGrandes[7] = new Ola(750,height,150,150,PI,TWO_PI);
  OlasGrandes[8] = new Ola(850,height,150,150,PI,TWO_PI);  
  
  OlasPeques[0] = new Ola(30,height,70,70,PI,TWO_PI);
  OlasPeques[1] = new Ola(80,height,70,70,PI,TWO_PI);
  OlasPeques[2] = new Ola(130,height,70,70,PI,TWO_PI);
  OlasPeques[3] = new Ola(180,height,70,70,PI,TWO_PI);
  OlasPeques[4] = new Ola(230,height,70,70,PI,TWO_PI);
  OlasPeques[5] = new Ola(280,height,70,70,PI,TWO_PI);
  OlasPeques[6] = new Ola(330,height,70,70,PI,TWO_PI);
  OlasPeques[7] = new Ola(380,height,70,70,PI,TWO_PI);
  OlasPeques[8] = new Ola(430,height,70,70,PI,TWO_PI);
  OlasPeques[9] = new Ola(480,height,70,70,PI,TWO_PI);
  OlasPeques[10] = new Ola(530,height,70,70,PI,TWO_PI);
  OlasPeques[11] = new Ola(580,height,70,70,PI,TWO_PI);
  OlasPeques[12] = new Ola(630,height,70,70,PI,TWO_PI);
  OlasPeques[13] = new Ola(680,height,70,70,PI,TWO_PI);
  OlasPeques[14] = new Ola(730,height,70,70,PI,TWO_PI);
  OlasPeques[15] = new Ola(780,height,70,70,PI,TWO_PI);
  OlasPeques[16] = new Ola(830,height,70,70,PI,TWO_PI);
  OlasPeques[17] = new Ola(880,height,70,70,PI,TWO_PI);

 }

void torrereloj(){

  // Bloque central
   
   fill(darkblue2);
   rect(width-90,80,90,270);
   
   fill(softturquoise);
   
   fill(softturquoise);
   triangle(width-90,170,width-90+22.5,170+40,width-90+45,170);
   triangle(width-90+45,250,width-90+22.5+45,210,width,250);
   
   rect(width-90+45,170,45,40);
   rect(width-90,210,45,40);
   
   fill(darkblue2);
   triangle(width-90+45,170,width-90+22.5+45,170+40,width,170);
   triangle(width-90,170+80,width-90+22.5,170+40,width-90+45,170+80);
   
   fill(yellow);
   rect(width-90,80,90,90);
   
   fill(pink);
   triangle(width-90,80,width-90+45,30,width-90+90,80);
   
   // Cara
   
   fill(white); 
   stroke(darkblue2);
   strokeWeight(2);
   ellipse(width-90+45,80+45,80,80);
   
   fill(softturquoise);
   strokeWeight(1);
   triangle(width-90+5,80+45,width-90+45,85,width-90+85,80+45);
   
   fill(turquoise);
   ellipse(width-90+43-15/2,80+45+15/2,13,13);
   ellipse(width-90+48+15/2,80+45+15/2,13,13);
  
   noStroke();
   fill(white);
   ellipse(width-90+43-15/2,80+45+15/2,3,3);
   ellipse(width-90+48+15/2,80+45+15/2,3,3);
   
   
   stroke(darkblue2);
   fill(yellow);
   rect(width-90+5+38,80+45,4,30);

}


void torreABCD(){
 
 noStroke();

 fill(darkorange);
 rect(width-120,170,30,180);
 
 fill(softorange);
 rect(width-120,140,30,30);

 fill(orange);
 triangle(width-120,140,width-120+15,100,width-120+30,140); 


  textAlign(CENTER);
  textSize(30);
  fill(white);
  text("A",width-120+15,200); 
  text("B",width-120+15,245); 
  text("C",width-120+15,290); 
  text("D",width-120+15,335); 

}


void torrearcos(){

 stroke(yellow);
 strokeWeight(3);
 fill(pink); 
 rect(width-222,200,100,153);
 
 noStroke();
 fill(yellow);
 arc(width-222+50,355,100,100,PI,TWO_PI);
 arc(width-222+50,200,100,100,0,PI);
 
 ellipse(width-222+50,277.5,50,50);
 
}


void torrerect(){
  
  int x = width-298;
  int y = 80;
  int w = 15;
  int h = 30;
  
  color[] colores = new color[3];
  
  colores[0] = purple;
  colores[1] = softblue2;
  colores[2] = softpurple;

 
  for(int i = 0; i<5; i++){
    for(int j = 0; j<9; j++){
      fill(colores[(i+j)%3]);
      rect(x+(i*w),y+(j*h),w,h);
    }
  }

}


void torrelineas(){

  int x = width-358;
  int y = 110;
  int w = 15;
  int h = 60;
  
  color[] colores = new color[2];
  
  colores[0] = yellow;
  colores[1] = red;
   
  for(int i = 0; i<4; i++){
    for(int j = 0; j<4; j++){
      fill(colores[i%2]);
      rect(x+(i*w),y+(j*h),w,h);
    }
  }
}


void torrecuadrados(){
  
  int x = width-400;
  int y = 149;
  int w = 40;
  int h = 40;
  
  strokeWeight(3);
  stroke(darkblue1);
  
  color[] colores = new color[3];
  
  colores[0] = blue;
  colores[1] = softpink;
  colores[2] = green;
 
  for(int i = 0; i<1; i++){
    for(int j = 0; j<5; j++){
      fill(colores[(i+j)%3]);
      rect(x+(i*w),y+(j*h),w,h);
    }
  }
  
  noStroke();
  fill(darkblue1);
  triangle(x,y-w/2,x+w/2,y-w,x+w,y-w/2);
  triangle(x,y-w/2,x+w/2,y,x+w,y-w/2);
  stroke(darkblue1);
  
}
  

void suelo(){
 
  noStroke();
  fill(yellow);
  rect(0,height-100,width,height-100);
  
  fill(darkblue2);
  rect(0,height-85,width,height-100);
  
  for(int i = 0; i<60; i++){
    switch(i%3){
      case 0:
        fill(softgreen);
        break;
      case 1:
        fill(green);
        break;
      case 2:
        fill(darkgreen);
        break;
      default:break;  
    }
    
    rect(15*i,height-95,15,15);
  }
}

void sky_gradient(int transparency) {
  noStroke();
  beginShape(QUADS);
  fill(30,156,215,transparency);
  vertex(0,0);
  vertex(width,0);
  fill(204,224,244,transparency);
  vertex(width,height);
  vertex(0,height);
  endShape();
}

void paintSky(){
  int diff = abs(hour() - 12);
  float initial_alpha = (255*0.2);
  float alpha = initial_alpha + (0.8/12)*(12-diff)*255;    
  sky_gradient(int(alpha));  
}

void paintNubes(){
  Nube1.paint();
  Nube2.paint();
  Nube3.paint();
  Nube4.paint();   
}
void paintOlasBarco(){
  for(int i = 0; i<numOlasGrandes; i++){
    OlasGrandes[i].paint();
  }
  
  barco.paint();
  
  for(int i = 0; i<numOlasPeques; i++){
    OlasPeques[i].paint();
  } 
}

void paintDolls(){
  int horas = hour();
  if(horas>12){
    horas-=12;
  }else if(horas==0){
    horas=12; 
  }
  
  for (int i = 0; i<horas; i++){
    dolls[i].paint();
  }
}

////////////////// CLASES //////////////////

class Barco{
  int w;
  int h;
  int x;
  int y;
  PImage img; 
  float angle;
  float angleIncrement;
  float maxAngle;
  
  Barco(int _x, int _y, int _w, int _h, float _initialAngle, float _angleIncrement, float _maxAngle){
    img = loadImage("barco.png");
    
    // Creacion del Vaiven del Barco
    
    angle = _initialAngle;
    angleIncrement = _angleIncrement;
    maxAngle = _maxAngle;
  }

  void girar(){
    if(angle > maxAngle || angle < -maxAngle){
       angleIncrement = -angleIncrement; 
    }
    
    angle += angleIncrement;
  }
  
  void paint(){
    girar();
     
    pushMatrix();
      translate(((second()+1)*15)+5,height-50);
      rotate(angle);
      image(img,-35,-36,70,72);
     popMatrix(); 
  }
}


class Ola{

  float x;
  int y;
  int w;
  int h;
  float start;
  float stop;
  
  Ola(float _x, int _y, int _w, int _h, float _start, float _stop){
  
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    start = _start;
    stop = _stop;

  }
 
  void paint(){
   
   fill(softturquoise);
   arc(x,y,w,h,start,stop); 
   
   fill(softblue);
   arc(x,y,w-20,h-20,start,stop);
   
   fill(darkblue1);
   arc(x,y,w-40,h-40,start,stop);
    
  }  
}


class SpriteSheet{
  
  int numSprites;
  PImage[] sprites;
  int currentFrame;
  int currentSprite;
  int numFramesToWait;
  boolean playing;
  boolean loop;
  
  SpriteSheet(int _numSprites, int _numFramesToWait, boolean _loop){
    numSprites = _numSprites; 
    numFramesToWait = _numFramesToWait;
    loop = _loop;
    
    sprites = new PImage[numSprites];
    playing = true;
    
    restart();
  }
  
  void addSprite(int position, PImage sprite){
     sprites[position] = sprite;
  }
  
  int getNext(){
    if(playing){
      
      currentFrame++; 
      if(currentFrame >= numFramesToWait){
        currentFrame = 0;
        currentSprite++;  
      }
      
      if(currentSprite >= numSprites){
         if(loop){
           restart();
         }else{
           currentSprite--;
           pause();
         }
      }
      
    } 
    
    return currentSprite;
  } 
  
  void pause(){
    playing = false;
  }
  
  void play(){
    playing = true;
    
    if(loop){
      restart();  
    }
     
  }
  
  void restart(){
    currentFrame = 0; 
    currentSprite = 0;
  }
}


class Puerta extends SpriteSheet{
   
  int x;
  int y;
  int h;
  int w;
  
  Puerta(int _x, int _y, int _w, int _h, int _numSprites, int _numFramesToWait){    
    super(_numSprites, _numFramesToWait, false);
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
  void paint(){
    int sprite;
    
    if(minute() == 59 && second() == 59){
      sprite = getNext();
    }else{
      sprite = 0;  
    }
    
    image(sprites[sprite],x,y,w,h); 
  }
}


class Personaje extends SpriteSheet{
  int x;
  int y;
  int h;
  int w;
  String estado;

  Personaje(int _x, int _y, int _w, int _h, int _numSprites, int _numFramesToWait){ 
    super(_numSprites, _numFramesToWait, true);
 
    x = _x;
    y = _y;
    w = _w; 
    h = _h;
    
    estado = "run";
  }
 
 // El estado jump lo cree para otro posible reloj que plantee en un inicio. Con el keyPressed() el munequito saltaba
 
  void paint(){
    int sprite = getNext(); 
    
    if(estado == "run"){
      image(sprites[sprite],x,y,w,h); 
    }else{
      image(sprites[sprite],x,y-50,w,h); 

    }
  }

  void jump(){
    estado = "jump"; 
  }

  void run(){
    estado = "run";
  }
} 


class Doll{
 
  int x;
  int y;
  int w;
  int h;
  PImage img;
  
  Doll(int _x, int _y, int _w, int _h, PImage _img){
     
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    img = _img;
       
  }
    
  void paint(){
    image(img,x,y,w,h);
   }  
}


class Nube{

  int x;
  int y;
  int radio;
  String type;
  
  Nube(int _x, int _y, int _radio, String _type){
    
    x = _x;
    y = _y;
    radio = _radio;
    type = _type;
   
  }
  
  void paint(){
    
    if(type=="desc"){
      noStroke();
    fill(white);  
    ellipse(x+14,y+24,radio,radio);
    ellipse(x+30,y+14,radio,radio);
    ellipse(x+35,y+30,radio,radio);
    ellipse(x+50,y+17,radio,radio);
    ellipse(x+57,y+30,radio,radio);
    }else if(type=="asc"){
     noStroke();
    fill(white);  
    ellipse(x+57,y+24,radio,radio);
    ellipse(x+50,y+14,radio,radio);
    ellipse(x+35,y+30,radio,radio);
    ellipse(x+30,y+17,radio,radio);
    ellipse(x+14,y+30,radio,radio); 
    }
  }
}



