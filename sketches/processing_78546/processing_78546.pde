
PImage foto;
background(0);
size(800,800);
foto=loadImage("lena.png");

image(foto, 0,0);

pushMatrix();
scale(-1,1);

image(foto, -800,0);
popMatrix();

pushMatrix();
scale(1,-1);

image(foto,0,-800);
popMatrix();

pushMatrix();
scale(-1,-1);

image(foto,-800,-800);
popMatrix();


