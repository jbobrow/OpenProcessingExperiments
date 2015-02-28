
PImage[] imgs;
int imgCount = 12;
float imgX[] = new float[imgCount];
float imgY = 0;
float imgZ[] = new float[imgCount];
float imgWidth;
float imgHeight;
float Distance;

void setup() {
  size(900, 300, P3D);
  setupImages();
}

void draw () {
  background(0);
  for(int i = 0; i < imgCount; i++){
    calcImagePos(i);
    displayImages(i);
  }
}

void setupImages() {
  imgs = new PImage[imgCount];
  for (int i = 0; i < imgCount; i++) {
    imgs[i] = loadImage("data/img" + nf(i, 3) + ".JPG");
  }
  imageMode(CENTER);
}

void calcImagePos(int i) {
  imgX[i] = map(i, 0, 11, 0, width);
  Distance = dist(imgX[i], imgY, mouseX, mouseY);
  imgZ[i] = -Distance;
  imgWidth = 400;
  imgHeight = imgWidth * 0.75;
}

void displayImages(int i) {
  pushMatrix();
  translate(imgX[i], height/2, imgZ[i]);
  image(imgs[i], 0, 0, imgWidth, imgHeight);
  popMatrix();


}  


