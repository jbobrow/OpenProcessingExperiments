
PImage bild;

void setup() {
  size (365,325);
  smooth ();
  frameRate (70);
   
  bild = loadImage ("BertPortrait.jpg");
//  image (bild, 0,0,500,375);
}
  
  void draw () {
       color c = bild.get (mouseX,mouseY);
    fill (c);
      noStroke ();
    ellipse (mouseX,mouseY,random (1,30),random(1,30));
  }


