

PImage foto; 

void setup() { 

  size(257, 322); // tamaño de la foto 
  foto = loadImage("fotito.jpg"); //cargamos la foto
  } 

void draw() { 
  for (int i = 0; i <= width; i++) { 
    color theColor = foto.get(mouseX, i); 
    stroke(theColor); 
    line(i, 0, i, height);
  } 

  if (mousePressed) { 
    image(foto, 0, 0);
  }
} 



