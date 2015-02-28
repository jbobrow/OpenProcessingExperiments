
PFont fuente;
PImage imagen;
background(255);
size(300,250);
//no olvides crear tu fuente primero
//utiliza el opción "Create Font" en el menu de "Tools"
fuente = loadFont("Stencil-28.vlw");
imagen = loadImage("mano.jpg");
image(imagen,0,0);
textFont(fuente);
fill(255,0,0);
text("presos",140,160);
text("politicos",120,190);
text("libertad!",120,220);






