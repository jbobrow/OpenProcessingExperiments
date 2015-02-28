


import processing.video.*;
Capture video;

int ancho = 900;
int alto = 900;

int anchoChica = 45;
int altoChica =45;

void setup() {

  size(1440, 900, P3D);
  frameRate(30);
  video = new Capture(this, ancho, alto, 600);
  
 
ellipseMode( CENTER );
  strokeWeight(2);
  colorMode(HSB);
  


}
void draw() { 

  if (video.available()) {
    
background(0);

    
               PFont font;

// The font must be located in the sketch's 
// "data" directory to load successfully 
font = loadFont("Helvetica.vlw");
// Text to display. The "n" is a "new line" character
String lines = "MUEVETE"; 
textFont(font, 55); 
fill(222);    // Set value to black
textLeading(13);
text(lines, 119, 225);


 
       

    
    video.read();
    PImage imagen = createImage(ancho,alto,HSB);
    PImage chica = createImage(anchoChica,altoChica,RGB);

    imagen.copy(video,0,0,ancho,alto,0,0,ancho,alto);
    chica.copy(imagen,0,0,ancho,alto,0,0,anchoChica,altoChica);

    float tamanio = 30;

    for(int i=10;i<anchoChica;i++){
      for(int j=10;j<altoChica;j++){
        color esteColor = chica.get(i,j);
        stroke(222);
        fill( esteColor );
        float brillo = brightness( esteColor );
        float profundidad = linea( brillo , 5 , 45 ,-440,9); 
        pushMatrix();
        translate( i*tamanio , j*tamanio , profundidad-random(111) );
       
translate(58, 48, 0); 
 rotateY( radians( mouseX ) );
  rotateX( radians( mouseY ) );
box(10, 10, 10);




       
// translate(width/120, height/142);
//rotateY(PI/3.0);
// ellipse(-12, -6, 25, 25);


     popMatrix();
      }
    }

  }
}
float linea( float x , float x1 , float x2 , float y1 , float y2 ){
  return (x-x1)/(x2-x1)*(y2-y1)+y1;
}






