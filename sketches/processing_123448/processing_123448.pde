
// RELOJ ORBITA HSB

//Reloj inspirado en los movimientos terrestres, la luz y su relación con la 
// percepción del tiempo, mezclando la representación de magnitudes de forma
// digital y análoga. Adjunto PDF indicativo. 




PFont font;
int cx, cy; 
float clockDiameter;
float minutesRadius;
float segRadius;
int h,m,s;



void setup(){
  
  size(600,600);
  stroke(255);
  smooth();
  
  
  int radius= min(width,height)/2;
  minutesRadius = radius * 0.57;
  segRadius= minutesRadius * 0.24;
  clockDiameter= radius * 1.6;
  
  cx = width/2;
  cy = width/2;
  
  
  font= createFont("Lucida", 24, true);
  
}
  
  


void draw() {
  background(#FEFFF7);  
 

 
 
 //comandos hora minuto y segundos

 h= hour();
 s= second();
 m= minute();
 
 //movimiento de las horas
 
  float m= map(minute()+norm(second(),0,60), 0, 60, 0, HALF_PI) - PI;
  float s = map(second(), 0, 60, 0, PI)- HALF_PI;
 
 
 //sombra
 
 stroke(#646464,90);
 strokeWeight(height/20);
 noFill();
 ellipse(cx+1,cy+1,clockDiameter,clockDiameter);
 
 //reloj circulo 3
 stroke(0);
 strokeWeight(height/20);
 fill(#FEFFF7);
 ellipse(cx,cy,clockDiameter+6,clockDiameter+6);
 
  //reloj circulo1
 stroke(240,80);
 strokeWeight(height/30);
 fill(#FEFFF7);
 ellipse(cx,cy,clockDiameter+2,clockDiameter+2);
 
 //reloj circulo2
 stroke(240,80);
 strokeWeight(height/40);
 fill(#FEFFF7);
 ellipse(cx,cy-8,clockDiameter-1,clockDiameter-1);
 
 
 

 
 textos();
 
}

void textos(){
 
 //horas
 
 colorMode(HSB, 360, 100, 100);
 
 float miBrillo = map(h, 0, 23, 100, 0);
 float miTono = map(m,0,59,0,360);
 
 color miColor = color(miTono,90,miBrillo);
 fill(miColor);
 
 textAlign(CENTER,CENTER);
 textFont(font, height/5);
 String hora = nf(h,2);
 text(hora, width/2, height/2);
 
 //minutos
 
 colorMode(HSB, 360, 100, 100);
 

 color miColor2 = color(miTono, 90,90);
 fill(miColor2);
 textFont(font, height/15);
 String minuto= nf(m,2);
 text(minuto, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
 
 //segundos

colorMode(HSB, 360, 100, 100);
 
 float miSat = map (s, 0, 59, 0, 100);
 color miColor3 = color (miTono, miSat, 100);
 fill (miColor3);
 textFont (font, height/40);
 String segundo = nf (s,2);
 
 float aM = m* 6;  // angulo de los minutos
 float aMR = radians(aM); // angulo de los minutos en radianes
 
 float xM, yM, xS, yS;
 
  
 
 xM=  cx + cos(m) * minutesRadius;
 yM= cy + sin(m) * minutesRadius;
 xS= (xM+ cos(s) * segRadius);
 yS= (yM  + sin(s) * segRadius);
 
 
 text(segundo, xS, yS);
 
 
}
 
 
 


