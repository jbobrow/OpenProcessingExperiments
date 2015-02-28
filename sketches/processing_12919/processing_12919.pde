
/*Credits to and Referenced from Pointillism Tutorial 
http://processing.org/learning/basics/pointillism.html
Image taken from 
http://australiawallpaper.info/bulkupload/wallpaper/Sydney%20Harbor%20at%20Dusk.jpg*/

PImage Sydney;
PImage bgBuildings;

int BGboxes = 5; //Basic size of the projected particles
int top, left;

void setup(){
  size(800,600, P3D);
  Sydney = loadImage("Sydney.jpg"); //Projected image
  bgBuildings = loadImage("bgBuildings.jpg"); //Background image of building facade
  noStroke();
  background(bgBuildings);
  smooth();
  frameRate(50);
  left = (width - Sydney.width) / 2;
  top = (height - Sydney.height) / 2;
}

void draw(){ 
  boxes();
}

void boxes(){
  float pointillize = map(0, 0, width, BGboxes, height);
  int x = int(random(Sydney.width));
  int y = int(random(Sydney.height));
  color pix = Sydney.get(x, y);
  fill(pix, 50);
  rect(x,y, pointillize, pointillize);
}


  

