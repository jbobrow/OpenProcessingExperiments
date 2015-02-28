
/* @pjs preload= "chinnychin.png"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;
  
void setup() {
  size(1000, 1200);
   img = loadImage("chinnychin.png");
  
  noStroke();
}
  
void draw() {
  //background(0);
  
 imageMode(CORNER);
  //image(img,0,0,width, height);
  for (y = 0; y < height; y+=10) {
    for (x = 0; x < width; x+=10) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
          if (dist(mouseX, mouseY, x, y) <= 10) {
         pointillize=25;
       }
       else {
          pointillize=0;
      }
 
         
        noStroke();
        fill(pix);
        ellipse( x*2, y*2, pointillize, pointillize);
      }
    }
  }
}



