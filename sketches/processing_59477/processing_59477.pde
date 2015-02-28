
PImage img1, img2, img3;
float x;
 
void setup () {
  size (600,371);
  img1 = loadImage ("kandinsky1.png");
  img2 = loadImage ("kandinsky2.png");
  img3 = loadImage ("kandinsky3.png");
  
  imageMode (CENTER);
}
 
void draw () {
  float x = mouseX-300;
  translate (width/2,height/2);
 
  image (img3, x/70, 0);
  image (img2, x/30, 0);
  pushMatrix ();
  translate (-16,0);
  image (img1, x/15, 0);
  popMatrix ();
  }


