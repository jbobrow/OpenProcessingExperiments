
/**Assignment 9 (10 pts)
 Load an image and do something with mouse interaction.
 Use at least one of these commands:
 mousePressed
 mouseMoved
 mouseDragged
 mouseReleased
 mouseButton==LEFT
 mouseButton==RIGHT
 mousePressed==true
 */
int i=30;

PImage imgCE;
PImage imgCEb;
PImage img2;
PImage img2b;
PImage img3;
PImage img3b;
PImage imgR;
PImage imgRb;
void setup() {
  size(1350, 800);
  imgCE =loadImage ("elitesCE.png");
  img2 =loadImage ("elites2.png");
  img3 =loadImage ("elites3.png");
  imgR =loadImage ("elitesR.png");
  
  imgCEb =loadImage ("elitesCEb.png");
  img2b =loadImage ("elites2b.png");
  img3b =loadImage ("elites3b.png");
  imgRb =loadImage ("elitesRb.png");
  
}
void draw() {
  frameRate(30);
  background(0);
//   i++;
  image(imgCEb, i, 100);
  image(img2b, i+300, 100);
  image(img3b, i+590, 100);
  image(imgRb, i+920, 100);
  if ((mouseX<=300) && (mouseX>=0) && (mousePressed==true)) {
    background(0);
    image(imgCE, i-30, 70); //
    image(img2b, i+300, 100);
    image(img3b, i+590, 100);
    image(imgRb, i+920, 100);
   }
  if ((mouseX<=600) && (mouseX>=300) && (mousePressed==true)) {
    background(0);
    image(imgCEb, i, 100);
    image(img2, i+270, 70); //
    image(img3b, i+590, 100);
    image(imgRb, i+920, 100);
   }
    if ((mouseX<=900) && (mouseX>=600) && (mousePressed==true)) {
    background(0);
    image(imgCEb, i, 100);
    image(img2b, i+300, 100);
    image(img3, i+560, 70);
    image(imgRb, i+920, 100);
   }
     if ((mouseX<=1200) && (mouseX>=900) && (mousePressed==true)) {
    background(0);
    image(imgCEb, i, 100);
    image(img2b, i+300, 100);
    image(img3b, i+590, 100);
    image(imgR, i+890, 70);
   }


}


