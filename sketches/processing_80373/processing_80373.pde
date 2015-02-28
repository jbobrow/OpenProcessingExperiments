
/* @pjs preload="torre_reduced.jpg"; */

PImage img;
color[][] imageColors;
int counter=0;


void setup() {
  background(0);
  colorMode (HSB,360,100,100,100);
  frameRate(25);
  smooth();
  noFill();
  img = loadImage("torre_reduced.jpg");
  imageColors = new color[img.width][img.height];
  
  //size((img.width)*4, (img.height)*4);
  size (400,676);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      imageColors[x][y] = img.get(x, y);
      color i = imageColors [x][y];
    }
  }

}

void draw() {
  fill (0,15);
  noStroke();
  rect (0,0, width, height);

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      if (int (brightness (imageColors[x][y])) == counter) {
        fill (360);
        pushMatrix ();
        //translate ((width/2)-(img.width/2),0); 
        scale (4);
        ellipse (x, y, 1, 1);
        popMatrix ();
      }
    }
  }

  counter++;
  if (counter >100) {
    //noLoop();
    counter = 0;
  }
}











