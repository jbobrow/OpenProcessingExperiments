
PFont font;
int h,m,s;
int dia, mes, anno;
String[] meses = new String[12];

float angulo;
float angulo2;
float angulo3;

engraner r1;
engraner r2;
engraner r3;
engranern r4;
engraner r5;
engranern r6;
engranet r7;
engrane r8;
engrane r9;
engranet r0;



int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;


void setup(){
  size(480,320);
  frameRate(25);
  smooth();
  
  font = createFont("Valerius", 24, true);
   // meses
   meses[0] = "Enero";
   meses[1] = "Febrero";
   meses[2] = "Marzo";
   meses[3] = "Abril";
   meses[4] = "Mayo";
   meses[5] = "Junio";
   meses[6] = "Julio";
   meses[7] = "Agosto";
   meses[8] = "Septiembre";
   meses[9] = "Octubre";
   meses[10] = "Noviembre";
   meses[11] = "Diciembre";
  
  
  //Manecillas de Reloj
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  cx = width / 2;
  cy = height / 2;
  
  //----ENGRANES------
  r1 = new engraner(-73,-90,160);
  r2 = new engraner(73,-90,160);
  r3 = new engraner(110,40,160);
  r4 = new engranern(-19,106,120);
  r5 = new engraner(-105,50,160);
  r6 = new engranern(0,0,160);
  r7 = new engranet(0,0,100);
  r8 = new engrane(0,0,340);
  r9 = new engrane(-100,-100,220);
  r0 = new engranet(-60,-60,120);
  
  
  
}

void draw(){
  background(125,102,80);

      // accede a Hora, Minutos, Segundos
  s = second();  // valores entre 0 - 59
  m = minute();  // valores entre 0 - 59
  h = hour();    // valores entre 0 – 23

  //----ENGRANES------
  //--//
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angulo));
  //
  r8.display();
  r6.display();
  r7.display();
  r1.display();
  r2.display();
  r3.display();
  r4.display();
  r5.display();
  //  
  popMatrix();
  rectMode(CORNER);
  //--//
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angulo2));
  r9.display();
  popMatrix();
  rectMode(CORNER);
  //--//
    pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angulo3));
  r0.display();
  popMatrix();
  rectMode(CORNER);
  //--//

   colorMode(RGB,255,255,255);
  noStroke();
  fill(255);
  ellipse(240,160,40,40);
    //Manecillas de Reloj
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;


  
  stroke(0);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(8);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  colorMode(RGB,255,255,255);
  noStroke();
  fill(0);
  ellipse(240,160,15,15);
  
    angulo -=.1;
    angulo2 += s*2;
    angulo3 -= s*2 ;
    

  
  // la fecha
  dia = day();   // 1 > 31
  mes = month(); // 1 > 12
  anno = year();
  
  // escribe los textos
  textos();
  
}

void textos(){
  // escribe la Hora 
  fill(0);
  textAlign(CENTER,CENTER);
  textFont(font, 30);
  String hora = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  text(hora, 75, 290); 
  
  // escribe la Fecha
  fill(0);
  textFont(font, 28);
  text(dia + " " + meses[mes-1] + " " + anno, 380, 290);
}

class engranern{
  
  float ex,ey,ew;
  float a, i;
  float angulo;

  //Engrane R, DE 40 dientes
engranern(float x, float y, float w){
  ex = x;
  ey = y;
  ew = w;
  angulo = 0;
}


  void display(){
    
    colorMode(HSB,360,100,100);
    fill(0);
    noStroke();
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(ex, ey);
    rotate(radians(angulo));
  // Engrane R  
  fill(40,80,80);
  ellipse(0,0,ew/1.5,ew/1.5);
  fill(0,0,99);
  ellipse(0,0,ew/4,ew/4);
  fill(40,80,80);
 //-----Engrane 1-R-------------------------   
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 2-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
   //Engrane 3-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 4-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 5-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 6-E   
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 7-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
   //Engrane 8-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 9-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 10-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
       //Engrane 10-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  
  popMatrix();
  rectMode(CORNER);
  angulo -=.3;
  }  
}
//-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
class engrane{
  
  float ex,ey,ew;
  float a, i;
  float angulo;

  //Engrane E, DE 20 dientes
engrane(float x, float y, float w){
  ex = x;
  ey = y;
  ew = w;
  angulo = 0;
}


  void display(){
    
    colorMode(HSB,360,100,100);
    fill(0);
    noStroke();
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(ex, ey);
    rotate(radians(angulo));
  // Engrane E  
  fill(40,90,50);
  ellipse(0,0,ew/1.5,ew/1.5);
  fill(0,0,99);
  ellipse(0,0,ew/4,ew/4);
  fill(40,90,50);
 //Engrane 1-E   
  rect(0,0-ew/3,ew/18,ew/10);
  rect(0,0+ew/3,ew/18,ew/10);
  rect(0-ew/3,0,ew/10,ew/18);
  rect(0+ew/3,0,ew/10,ew/18);
  //Engrane 2-E
  rotate(radians(18));
  rect(0,0-ew/3,ew/18,ew/10);
  rect(0,0+ew/3,ew/18,ew/10);
  rect(0-ew/3,0,ew/10,ew/18);
  rect(0+ew/3,0,ew/10,ew/18);
   //Engrane 3-E
  rotate(radians(18));
  rect(0,0-ew/3,ew/18,ew/10);
  rect(0,0+ew/3,ew/18,ew/10);
  rect(0-ew/3,0,ew/10,ew/18);
  rect(0+ew/3,0,ew/10,ew/18);
     //Engrane 4-E
  rotate(radians(18));
  rect(0,0-ew/3,ew/18,ew/10);
  rect(0,0+ew/3,ew/18,ew/10);
  rect(0-ew/3,0,ew/10,ew/18);
  rect(0+ew/3,0,ew/10,ew/18);
     //Engrane 5-E
  rotate(radians(18));
  rect(0,0-ew/3,ew/18,ew/10);
  rect(0,0+ew/3,ew/18,ew/10);
  rect(0-ew/3,0,ew/10,ew/18);
  rect(0+ew/3,0,ew/10,ew/18);
  popMatrix();
  rectMode(CORNER);
  angulo +=.35;
  }  
}
//-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
class engraner{
  
  float ex,ey,ew;
  float a, i;
  float angulo;

  //Engrane R, DE 40 dientes
engraner(float x, float y, float w){
  ex = x;
  ey = y;
  ew = w;
  angulo = 0;
}


  void display(){
    
    colorMode(HSB,360,100,100);
    fill(0);
    noStroke();
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(ex, ey);
    rotate(radians(angulo));
  // Engrane R  
  fill(40,80,80);
  ellipse(0,0,ew/1.5,ew/1.5);
  fill(0,0,99);
  ellipse(0,0,ew/4,ew/4);
  fill(40,80,80);
 //-----Engrane 1-R-------------------------   
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 2-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
   //Engrane 3-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 4-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 5-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 6-E   
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  //Engrane 7-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
   //Engrane 8-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 9-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
     //Engrane 10-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
       //Engrane 10-R
  rotate(radians(9));
  rect(0,0-ew/3,ew/30,ew/10);
  rect(0,0+ew/3,ew/30,ew/10);
  rect(0-ew/3,0,ew/10,ew/30);
  rect(0+ew/3,0,ew/10,ew/30);
  
  popMatrix();
  rectMode(CORNER);
  angulo +=.3;
  }  
}
//-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
class engranet{
  
  float ex,ey,ew;
  float a, i;
  float angulo;

  //Engrane T, DE 20 dientes
engranet(float x, float y, float w){
  ex = x;
  ey = y;
  ew = w;
  angulo = 0;
}


  void display(){
    
    colorMode(HSB,360,100,100);
    fill(0);
    noStroke();
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(ex, ey);
    rotate(radians(angulo));
  // Engrane T  
  fill(40,90,60);
  ellipse(0,0,ew/1.5,ew/1.5);
  fill(0,0,99);
  ellipse(0,0,ew/4,ew/4);
  fill(40,90,60);
 //-----Engrane 1-T-------------------------   
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
  //Engrane 2-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
   //Engrane 3-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 4-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 5-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
  //Engrane 6-T  
  rotate(radians(6)); 
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
  //Engrane 7-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
   //Engrane 8-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 9-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 10-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
       //Engrane 11-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
    //Engrane 12-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
   //Engrane 13-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 14-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
     //Engrane 15-T
  rotate(radians(6));
  rect(0,0-ew/3,ew/60,ew/20);
  rect(0,0+ew/3,ew/60,ew/20);
  rect(0-ew/3,0,ew/20,ew/60);
  rect(0+ew/3,0,ew/20,ew/60);
  
  popMatrix();
  rectMode(CORNER);
  angulo +=2;
  }  
}
