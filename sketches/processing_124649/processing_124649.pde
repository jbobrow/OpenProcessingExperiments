
int numLines = 21;
String[] imageLines = {
  "0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png", "11.png", "12.png", "13.png", "14.png", "15.png", "16.png", "17.png", "18.png", "19.png", "20.png", "21.png"
};
PImage[] images = new PImage[imageLines.length];
float x;
float y;
int r;


void setup() {
  size(1762, 179);
  for (int i=0; i < imageLines.length; i++) {
    images[i] = loadImage(i + ".png");
  }
}

void draw() {
  background(255);
  println(mousePressed);
  if(mousePressed){
    for(int count = 0; count<10; count ++){
      r = int(random(22));
      image(images[r],0,0);
    }
  }
}



