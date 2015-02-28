
PImage myImage;
int i = 1;
void setup() {
  size(800,800);
  background(255);
  myImage = loadImage("4751079272_c43c9abd3a_b.jpg");

}

void draw() {
  background(255);
  i++;

  for(int j=1;j<100; j+=1) {
  pushMatrix();
  scale(1/((i%(100)+.01)));
  image(myImage,(800*j),(800*j));
  popMatrix();
  }
}

