
/* @pjs preload="Acqua.jpg, fuoco.jpg, maschera.jpg"; */
size (950, 480);

PImage sfondo = loadImage ("Acqua.jpg");
background (sfondo);

PImage fuoco = loadImage ("fuoco.jpg");

PImage maschera = loadImage ("maschera.jpg");
fuoco.mask (maschera);
image (fuoco, 0, 0);






