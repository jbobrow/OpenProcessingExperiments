
/*
RESOURCE: http://www.openprocessing.org/sketch/41149 - Charlie McDowell
*/

 PImage img;
 
// the twinlking star locations

int[] starX = new int[1000];
int[] starY = new int[1000];
color[] starColor = new color[1000];
int starSize = 1; 
 
void setup() {
  size(700,500);
    img = loadImage("starry.jpg");
  for (int i = 0; i < starX.length; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(100,255));
  }
}
 
void draw() {
  background(img); 
  
  strokeWeight(1);
  for (int i = 0; i < starX.length; i++) {
    fill(random(0,255)); 
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
     
    ellipse(starX[i], starY[i], starSize, starSize);
  }    
      noStroke();
  }



