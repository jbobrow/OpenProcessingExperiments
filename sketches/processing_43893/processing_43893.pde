
int maxImg = 48;
int imgIndex = 0;
PImage[] img = new PImage[maxImg];

void setup() {
  size(300, 300);
  for (int i=0; i < img.length; i++) {
    img[i] = loadImage("clock" + i + ".jpg");
  }
}
  
  void draw() {
    background(0);
    imageMode(CENTER);
    image(img[imgIndex], width/2, height/2, width/2, height/2);
  }
    void mousePressed() {
      imgIndex = int(random(img.length));
    }
    

