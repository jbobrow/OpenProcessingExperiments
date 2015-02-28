
PImage naver;
void setup() {
  size(1000,1000);

  println(naver);
  naver = loadImage("naver.jpg");
  println(naver);
  
}
void draw() {

  for(int x=0; x<1000; x=x+naver.width) {
    for(int y=0; y<1000; y=y+naver.height) {
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount));
      
      image(naver,-10,-10);
      popMatrix();
    }
  }
}


