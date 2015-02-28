
PImage bild;

float a = random(100.0) ;


void setup() {
  size(640, 480);
  smooth();
  frameRate(60);
  
  bild = loadImage("box.jpg");
  //image(bild,0,0);
  background(0);
}

 
void draw() {
//  background(0);
  noStroke();
  float cs = 80;

  stroke(bild.get(mouseX,mouseY));
  line(pmouseX, pmouseY, mouseX +a,mouseY + a);
  
 
  if (key == 's') {
   saveFrame("bild.jpg"); 
  }
  


}

