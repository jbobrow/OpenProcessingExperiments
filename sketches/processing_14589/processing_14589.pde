
PImage naver;

void setup() {
  size(300,300);
  naver = loadImage("naver.jpg");
  colorMode(HSB);
}

void draw() {
  noStroke();
  for(int y=0; y<height; y=y+3) {
    for(int x=0; x<width; x=x+3) {
      color c= naver.get(x,y);
      fill(c);
      ellipse(x+random(5),y+random(5),random(7),random(7));
    }
  }
}


