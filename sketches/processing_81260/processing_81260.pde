
PImage table;
PImage fire;
PImage fire2;
PImage wand;
PImage wheatgrass;
PImage fluxweed;
PImage spoon;
PImage spoon2;

//Credits for blur trail: http://openprocessing.org/sketch/22600//
int[] xpos = new int[50];
int[] ypos = new int[50];
float theta;

void setup() {
  size(1000, 409);
  smooth();
  noStroke();
  table = loadImage("table.png");
  fire = loadImage("fire.png");
  fire2 = loadImage("fire2.png");
  wand = loadImage("wand.png");
  wheatgrass = loadImage("wheatgrass.png");
  fluxweed = loadImage("fluxweed.png");
  spoon = loadImage("spoon.png");
  spoon2 = loadImage("spoon2.png");

  
  //background(255);
   
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0;
        ypos[i] = 0;
}


}

void draw() {
  background(255);
  image(table,0,0);
  image(wheatgrass,520,300);  
  image(fluxweed,595,320);  

  image(spoon,700,320); 
 
 for (int i = 0; i < xpos.length-2; i ++ ) {
    // Shift all elements down one spot.
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+2];
      ypos[i] = ypos[i+2];
 // rectMode(CENTER);
 // rect(xpos[i],ypos[i],20,20);
 
  fill(255,252,0,75);
   theta = random(TWO_PI);
  noCursor();
}
   xpos[xpos.length-2] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-2] = mouseY;
 for (int i = 0; i < xpos.length; i ++ ) {
    ellipse(xpos[i],ypos[i],8,8);
 }
 
 image(wand,mouseX,mouseY);
 
 
 
 


}

