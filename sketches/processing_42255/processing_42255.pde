
PImage net;

void setup () {
  size(500,500);
  smooth();
  imageMode(CENTER);
  net= loadImage("vec.gif");
}

void draw () {
  background(#02D393);
  float diameter= map(mouseX,0,width,10,800);
  image(net,250,250,diameter,diameter);
}

