
int i=0; 
int h=0;

void setup() {

  size (400, 400);
  colorMode(HSB);
  //background(#6ACEEB);
  noFill(); 
  stroke(255,100);
  frameRate(30);
  smooth();
}

void draw() {

  
  
 //primer animacion
 ellipse(width/2, height/2 + cos(h), 100 + tan(i*4), 100 - (i*1.5*cos(h)));
 i++;
 h++;
 
 
 
 //cambiar numero, mas grande numero, mas grande la animacion
 if( i > 50) {
 
   i=0;
   colorMode(RGB);
   stroke(random(255),random(255),random(255));
 
 }
 

 
 




}
