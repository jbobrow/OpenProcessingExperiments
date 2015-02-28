





PImage[] img = new PImage[46];


void setup() {
  size(484, 504);
  smooth();
  for (int i=1; i<46; i++){
  img[i] = loadImage(i + ".png");
  }
  noLoop();
}

void draw() {
background(255); //80,120,255
for (int b=1; b<46; b++){
 image(img[b], random(0, (width-img[b].width)), random(0, (height-img[b].height)));
}
 /*save("europa.tif");
 println("saved");
 noLoop();
 */
}
  



void mousePressed(){
 redraw();
}




