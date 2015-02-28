
PImage table;
PImage fire;
PImage fire2;
PImage wand;
PImage wheatgrass;
PImage fluxweed;
PImage ingredients;
PImage spoon;
PImage spoon2;

void setup() {
  size(1000, 409);
  table = loadImage("table.png");
  fire = loadImage("fire.png");
  fire2 = loadImage("fire2.png");
  wand = loadImage("wand.png");
  wheatgrass = loadImage("wheatgrass.png");
  fluxweed = loadImage("fluxweed.png");
  ingredients = loadImage("ingredients.png");
  spoon = loadImage("spoon.png");
  spoon2 = loadImage("spoon2.png");

}

void draw() {
  background(255);
  image(table,0,0);
  image(wand,700,320);
  image(wheatgrass,520,300);  
  image(fluxweed,595,320);  
  image(ingredients,395,180);  
  image(spoon,mouseX,mouseY);  

}

void keyReleased (){ 
  if (key == 'f');
  {
   image(fire2,385,250);
  }
}

void keyPressed (){ 
  if (key == 'f');
  {
   image(fire2,385,250);
  }
}

void mouseDragged(){
  image(spoon2,mouseX,mouseY);
}




