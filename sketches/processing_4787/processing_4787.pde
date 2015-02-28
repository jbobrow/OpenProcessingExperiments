
PImage imagen1 = loadImage("u.jpg");
PImage imagen2 = loadImage("a.jpg");
PImage imagen3 = loadImage("p.jpg");
size(300,200);
imagen2.filter(GRAY);
image(imagen2,100,0);
tint(0,255,0);
image(imagen1,0,0);
tint(255,0,0);
image(imagen3,200,0);


