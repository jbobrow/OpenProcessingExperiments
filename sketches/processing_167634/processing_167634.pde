
/* @pjs preload = "fruit.jpg" */
int i;
PImage img;

void setup (){
  size (300, 300);
  smooth ();
  img = loadImage ("fruit.jpg");
 frameRate (30);



}

void draw (){

  int ix = int (random (img.width));
  int iy = int (random (img.height));
  color c = img.get (ix, iy);
  noStroke ();
  fill (0, 10);
  rect (0, 0, 300, 300);
  stroke (c, 10);
  

  for (int i = 0; i < 500; i++){
  line (mouseX + i, mouseY + i, random (200), random (200));
  line(mouseY -i*i, mouseX -i*i, random (200), random (200));
  
}
}



