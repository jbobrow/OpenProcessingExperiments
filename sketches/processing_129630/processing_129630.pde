
Ovni alf;
/* @pjs preload="farm1.png"; */
PImage cs;

void setup(){
  size(1000,650);
  alf = new Ovni();
  cs = loadImage("farm1.png");
  }

void draw(){
  image(cs, 0, 0,1000,700);
  alf.ovalo();
  alf.luces();
}

class Ovni{
  //variables ovalo
  float xOv;
  float yOv;
  color cOv;
  float led;
  float xSheep;
  float ySheep;
  //variables luces rotativas
  float c0 = 0;
  float c1 = 12;
  float c2 = 25;
  float c3 = 37.5;
  float c4 = 50;
  float c5 = 62;
  float c6 = 75;
  float c7 = 87.5;
  //posicion de la x
  float xPos = 500;
  float vel = 0;
  
  Ovni(){
    xOv = width/2;
    yOv = height;
    xSheep = width/2;
    ySheep = height/2;
    cOv = color(#19FC22);
  }
  

  void ovalo(){
    //PLATILLO
    stroke(0);
    strokeWeight(5);
    fill(#676767);
    ellipse(xPos, 40, 575,100);
     
      }
      
      
   void luces(){
     /*Aquí le estoy pasando un rango de del 0 al 100 al map para que me devuelva el equivalente a la dicisión de dos PI 
     y luego lo multiplique por el valor del la primera posición de map quedando asi: n*(primerValor/segundoValor)*/
      float s0 = map(c0, 0, 100, 0, TWO_PI) - HALF_PI; c0 = c0 + 0.5;
      float s1 = map(c1, 0, 100, 0, TWO_PI) - HALF_PI; c1 = c1 + 0.5;
      float s2 = map(c2, 0, 100, 0, TWO_PI) - HALF_PI; c2 = c2 + 0.5;
      float s3 = map(c3, 0, 100, 0, TWO_PI) - HALF_PI; c3 = c3 + 0.5;
      float s4 = map(c4, 0, 100, 0, TWO_PI) - HALF_PI; c4 = c4 + 0.5;
      float s5 = map(c5, 0, 100, 0, TWO_PI) - HALF_PI; c5 = c5 + 0.5;
      float s6 = map(c6, 0, 100, 0, TWO_PI) - HALF_PI; c6 = c6 + 0.5;
      float s7 = map(c7, 0, 100, 0, TWO_PI) - HALF_PI; c7 = c7 + 0.5;

      
      strokeWeight(5);
      stroke(#FFB41F);
      /*El valor de c se incrementa hasta cien. (Una vuelta entera) Cuando ya a dado la vuelta entera entoces el valor deve
      volver a situarse a 0 para comenzar a incrementar de nuevo*/
      if(c0 > 100) c0 = 0;
      if(c1 > 100) c1 = 0;
      if(c2 > 100) c2 = 0;
      if(c3 > 100) c3 = 0;
      if(c4 > 100) c4 = 0;
      if(c5 > 100) c5 = 0;
      if(c6 > 100) c6 = 0;
      if(c7 > 100) c7 = 0;
      
      fill(#39F21D);
      ellipse(cos(s0) * 220 + xPos, sin(s0) * 35 + 40, 40, 18);
      ellipse(cos(s1) * 220 + xPos, sin(s1) * 35 + 40, 40, 18);
      ellipse(cos(s2) * 220 + xPos, sin(s2) * 35 + 40, 40, 18);
      ellipse(cos(s3) * 220 + xPos, sin(s3) * 35 + 40, 40, 18);
      ellipse(cos(s4) * 220 + xPos, sin(s4) * 35 + 40, 40, 18);
      ellipse(cos(s5) * 220 + xPos, sin(s5) * 35 + 40, 40, 18);
      ellipse(cos(s6) * 220 + xPos, sin(s6) * 35 + 40, 40, 18);
      ellipse(cos(s7) * 220 + xPos, sin(s7) * 35 + 40, 40, 18);
        if(keyPressed){
           if(key == 'f' || key == 'F')xPos = xPos - 3.5;
           if(key == 'h' || key == 'H')xPos = xPos + 3.5;
           if(key == ' '){
             fill(#FAFF00);
             noStroke();
             //HAZ DE LUZ DESCENDENTE
             rectMode(CORNER);
             rect(xPos - 75, 40,150,600);
             ellipse(xPos, 40, 150, 30);
             ellipse(xPos, 640, 150, 30);
           }
         }}
     }


