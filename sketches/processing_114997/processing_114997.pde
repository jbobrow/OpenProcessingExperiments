
/* @pjs preload= "chinnychin.png"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;
 
void setup() {
  size(500, 593);
  img = loadImage("chinnychin.png");
  imageMode(CENTER);
  image(img, width/2, height/2);
  noStroke();
}
 
void draw() {
  background(0);
  for (y = 0; y < img.height; y+=4) {
    for (x = 0; x < img.width; x+=4) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
          if (dist(mouseX, mouseY, x, y) <= 1.9) {
         pointillize=100;
       }
       else {
          pointillize=4;
      }

        
        noStroke();
        fill(pix);
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
}



