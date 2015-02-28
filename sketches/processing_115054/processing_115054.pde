
/* @pjs preload= "worldmap.png"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 2;


void setup() {
  size(480, 310);
  img = loadImage("worldmap.png");
  image(img, 0, 0);
  imageMode(CENTER);
  noStroke();
}

void draw() { 
//image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  
  for (y = 0; y < img.height; y+=4) {
    for (x = 0; x < img.width; x+=4) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
        

      if (dist(mouseX, mouseY, x, y) <= 1.5) {
         pointillize=20;
       }
       else {
         pointillize=0;
       }
        
 ellipse( x, y, pointillize, pointillize);
        
        
      }
    }
  }
}



