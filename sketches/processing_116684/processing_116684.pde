
PImage img; //mostrando los pixels de la imagen

void setup (){
  size (400, 400); 
  img= loadImage ("pajarovector-01.png"); 
  img.resize (400, 400); 
}

void draw (){
  loadPixels (); // para acceder a los pixeles de la imagen 
  img. loadPixels (); 

  
  //declaración. estos dos loops permiten que se analicen los pixeles tanto en el eje x como y
  for (int y= 0; y< img .height; y++) {
  for (int x=0; x< img.width; x++) {
  int loc= x+y*width; 
  //Se obtienen los valores RGB de la imagen
  float r= red (img.pixels [loc]);
  float g= green (img.pixels [loc]); 
  float b= blue (img.pixels [loc]); 
  
  //cambiar el brillo en relación con el ratón 
  float adjustBrightness= ((float) mouseY/height)* 11.0; 
  r*= adjustBrightness;
  g*= adjustBrightness;
  b*= adjustBrightness;
  
  r = constrain(r,0,255); //los valores RGB se limitan entre 0 y 255, antes de que se estableza como color nuevo
  g = constrain(g,0,255);
  b = constrain(b,0,255);

      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  
  updatePixels();  
}


