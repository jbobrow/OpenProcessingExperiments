
/* @pjs preload= "rave.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 2;
  
void setup() {
  size(700, 600);
  
  img = loadImage("rave.jpg");
  imageMode (CENTER);
 
  noStroke();
}
  PFont font;
//font = loadFont("Optima-Regular-40.vlw");
//textFont(Optima-Bold-24, 24);
//text("word", 10, 50);
     
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
          pointillize=2;
      }
      
  textSize(48);
text("eat", 10, 30); 
fill(random (255), random (255), random (255));
text("sleep", 10, 60);
fill(random (255), random (255), random (255));
text("rave", 10, 90); 
fill(random (255), random (255), random (255));
text ("repeat", 10, 120);
fill(random (255), random (255), random (255));
         
        noStroke();
        fill(pix);
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
}


