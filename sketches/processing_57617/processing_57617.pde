
int diam = 10; // diametro
float centX, centY; //tamaño de la elipse
 
void setup() {
 size(500, 500);
  rectMode(CENTER);
  smooth();
  noFill();
 frameRate(50); //fotogramas por segundo
 
 frameRate(50); //fotogramas por segundo
   
   
  
    
centX = width/2; // ancho dividido dos valor250
   
centY = height/2; // alto dividido dos valor 150
 
 
}
 
 
 
int pos = 0;
void draw() {
background(0);
stroke(100, random(200), 200); // color negro
pos++;
   
 
line(pos, 500, pos, 0); //lineas
  line(0, pos, 500, pos);
   
  if (pos==250) // condicional segun posicion
     noLoop();
  
  if (pos==250)
     rect(250, 250, 250, 250);
   
    
   ellipse(centY, centX, diam, diam); //la ellipse
diam +=10;
   
   
 
 ellipse(width/100, 1, 150, 150); //ellipses de los bordes
 ellipse(width/1, 500, 150, 150);
   
       
if(pos > width) {
pos = 50;
     
 
 
}

}

void mousePressed() {

pos++;

if(pos==255) loop();
 
}
