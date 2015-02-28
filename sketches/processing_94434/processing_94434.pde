
size (200, 200);
background (255);

PImage a = loadImage ("imagem2.JPG");

for ( int x= 0; x<200; x= x+22) {
  for (int y =0; y<200; y=y+22) {
    stroke (220);
    rect (x+2, y+2, 20, 20);
  }
}

image(a, 2, 2, 20, 20);  //* lado esquerdo superior
image(a, 24, 2, 20, 20); 
image(a, 2, 24, 20, 20); 
image(a, 46, 2, 20, 20); 

image(a, 134, 2, 20, 20);  //* lado direito superior
image(a, 156, 2, 20, 20); 
image(a, 178, 24, 20, 20); 
image(a, 178, 2, 20, 20); 


image(a, 134, 178, 20, 20);  //* lado direito inferior
image(a, 156, 178, 20, 20); 
image(a, 178, 178, 20, 20); 
image(a, 178, 156, 20, 20); 

image(a, 2, 178, 20, 20);  //* lado esquerdo inferior
image(a, 2, 156, 20, 20); 
image(a, 24, 178, 20, 20); 
image(a, 46, 178, 20, 20); 

  image(a, 68, 68, 20, 20);  //* florzinha
   image(a, 68, 112, 20, 20); 
   image(a, 112, 68, 20, 20); 
   image(a, 112, 112, 20, 20); 
   image(a, 90,90 , 20, 20); 


