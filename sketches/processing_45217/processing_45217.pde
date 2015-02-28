
PImage baskettexture; 
PImage hounds;
PImage koch;

void setup() {
  size(700,700);
  baskettexture = loadImage("textures-108-l.jpg");
  hounds = loadImage("Hundtandsrutor.png");
  koch = loadImage("Koch 4.png");
}


void draw() {
  tint(mouseX,40,200, 15);
  image(baskettexture, mouseX, mouseY, 500, 350);
  image(hounds, 0, 0, 700, 700);
  rect(0, 0, mouseX, 100);
  rect(200, 0, mouseX, 100);
  rect(400, 0, mouseX, 100);
  rect(600, 0, mouseX, 100);
  
  rect(0, 200, mouseX, 100);
  rect(0, 400, mouseX, 100);
  rect(0, 600, mouseX, 100);
  
  rect(200, 400, mouseX, 100);  
  rect(200, 200, mouseX, 100);
  rect(200, 600, mouseX, 100);
   
  rect(400, 400, mouseX, 100);
  rect(400, 200, mouseX, 100);
  rect(400, 400, mouseX, 100);
  rect(400, 600, mouseX, 100);
  
  rect(600, 200, mouseX, 100);
  rect(600, 400, mouseX, 100);
  rect(600, 600, mouseX, 100);
 
  rect(600, 0, mouseX, 100);
  

  rect(600, 600, mouseX, 100);
}

