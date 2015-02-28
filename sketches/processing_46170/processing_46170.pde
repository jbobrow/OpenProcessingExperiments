
PImage chameleon;
PImage plantae;
PImage shell;
PImage snail;
PImage galaxy;



void setup(){
  chameleon = loadImage("chameleon.jpg");
  plantae = loadImage("plantae.jpg");
  shell = loadImage("shell.jpg");
  snail = loadImage("snail.jpg");
  galaxy = loadImage("galaxy.jpg");
  size(350, 300);
}

void draw(){
  tint(255, 50);
  image(chameleon, 0, 0, 175, 150);
  image(shell, 0, 150, 175, 150);
  image(snail, 175, 0, 175, 150);
  image(galaxy, 175, 150, 175, 150);
  image(plantae, random(0, 350), random(0, 300), 100, 100);
}

