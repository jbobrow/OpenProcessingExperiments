
//"Klee"; Construido en base a ejemplos de la Unidad 24 (Drawing) de "Processing a programming handbook for visual designers and artists"
PImage foto;
float h,s,b;

void setup() {
 size(700, 500);
 foto= loadImage ("col.png"); 
 background (0);
 colorMode (HSB,255);
 smooth();
}

void draw() {
   if (mousePressed == true) {
   //función loadPixels basada en, 'Interpretes Radiales' (P.Carrasco).
  int x= int(random(foto.width));
  int y=int(random(foto.height));
  int P= x*y; // cantidad de pixeles que va a cargar [P] (ver abajo)
   loadPixels(); 
  h = hue(foto.pixels[P]); 
  s = saturation(foto.pixels[P]); 
  b = brightness(foto.pixels[P]); 

   strokeWeight(random(6)); 
   stroke(h,s,b,random(30,255));
  line(mouseX,mouseY,pmouseX, pmouseY); //pmouseX y pmouseY dan continuidad al trazo, conectando la posición actual del mouse con lo con la ubicación anterior.
  
   }
}

void keyPressed(){
  
  if(key == ' '){
    setup();
  }  


//Para grabar el dibujo
  if((key == 'g') || (key == 'G')){
    save("midibujo.png");
    println ("guardado! :)");
  }

}


