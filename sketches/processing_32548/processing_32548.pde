
PImage online;

void draw() {
  
}

void mouseReleased() {
  println(mouseX + "," + mouseY);
}

void setup() {
  size(95,204);
  String url = "http://www.kaaneryilmaz.com/bootcamp/code/11.jpg";
  online = loadImage(url, "png");
  image(online, 0, 0);
//  noLoop();
}
