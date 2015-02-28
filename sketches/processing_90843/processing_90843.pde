
size(600, 750);
PImage a;

a= loadImage("green.jpg");
image(a, 0, 0);

 

  int ancho = int (random(600));
  int alto = int (random(750));
  int cont = ancho + 15;
  int cont1 = alto +15;
 int rojo=int (random(255)); 
int verde=int (random(255)); 
int azul=int (random(255)); 
color cp= color(rojo, verde, azul);

 
for (int i=ancho; i< cont; i++) {
  for (int j=alto; j< cont1; j++) {
    set(i, j, get(i, j) + cp); 
   save("green.jpg");

   
}

}
  


