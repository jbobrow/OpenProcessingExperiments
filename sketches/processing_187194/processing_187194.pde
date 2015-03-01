

void setup(){
  frameRate(0.3);
  size(200,200);
}
int z = 0;

void draw(){
  z++;
  background(10);
  textSize(32);
  text("zahl:",10,30);
  text(int(random(1,7)), 85, 30);
  text("zähler:",10,70);
  text(z,115,70);
}


