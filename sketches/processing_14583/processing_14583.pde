
PImage naver;

void setup() {
  size(220,220);
  println(naver);
  naver = loadImage("face.jpg");
  println(naver);
}

void draw() {
  background(255);
  for(float a=0; a<360; a=a+15) {
    float x=100+sin(radians(a))*80;
    float y=100+cos(radians(a))*80;
    pushMatrix();
    translate(x,y);
    scale(0.5);
    image(naver,0,0);
    popMatrix();
  }
}

