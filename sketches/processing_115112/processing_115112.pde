
/* @pjs preload= "royals.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 2;
 
 
void setup() {
  size(600, 300);
  img = loadImage("royals.jpg");
  image(img, 0, 0);
  imageMode(CENTER);
  noStroke();
}
 
void draw() {
//image(img,width, height); // We don't need this anymore becayse we are drawing our own pixels
   
  for (y = 0; y < img.height; y+=1) {
    for (x = 0; x < img.width; x+=1) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
         
 
      if (dist(mouseX, mouseY, x, y) <= 10.5) {
         pointillize=90;
       }
       else {
         pointillize=0;
       }
         
 rect( x, y, pointillize, pointillize);
         
         
      }
    }
  }
}


