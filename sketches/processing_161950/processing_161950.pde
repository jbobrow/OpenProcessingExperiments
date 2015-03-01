
PImage img, img2, img3;
int count = 0;

void setup() {
  size(800,800);
  background(#FFFFFF);
  // Images must be in the "data" directory to load correctly
  img = loadImage("pug.png");
  img2 = loadImage("sarah.png");
  img3 = loadImage("bird.png");
  String s = "Happy Birthday, Sarah!";
  fill(50);
  textSize(50);
  text(s, width/2.5, height/2.5, 300, 1000); 
}

void draw() {
  if (frameCount % 30 == 0){
    if (count % 3 == 0) {
      image(img, random(10, 790), random(10, 790), width/5, height/5);
    } else if (count % 3 == 1) {
      image(img2, random(10, 790), random(10, 790), width/2, height/2);
    } else {
      image(img3, random(10, 790), random(10, 790), width/5, height/5);
    }
    count++;
  }
}


