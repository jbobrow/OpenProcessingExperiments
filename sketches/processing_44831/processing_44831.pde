
//image is loaded
PImage img;
//file and images loaded
void setup() {
  img = loadImage("lebanonsunset.jpg");
  size(700, 525);
  image(img, 0, 0);
  smooth();

}
// the line will go around whenever you want
void draw(){
  stroke(#eeaea0,50);

   line(mouseX,mouseY, 360,220);

   
}
//the line is thicker and different colour
void mouseMoved() {
    strokeWeight(2);
     stroke(#b89ea4,30);
    line(mouseX,mouseY, 360,220);
   
  }

