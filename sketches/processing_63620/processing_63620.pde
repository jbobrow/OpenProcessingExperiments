
PImage img1;
PImage img2;
PImage img3;
float x = random (100);
void setup () {size (500,500);
img1 =loadImage ("fuzzypress.jpg");
img2 =loadImage ("fuzzyleft.jpg");
img3 =loadImage ("fuzzyright.jpg");
image(img1,0,0);
}

  
  
  
  
  void draw () {
    Ranimg ();
  }
  
  void Ranimg () {
if (mousePressed==true) {
  image (img3,0,0);
}
if (mousePressed==false) {
  image (img1,0,0);
}
  }

