
PImage webImg;

void setup() {
  String url = "http://cdn.bloguin.com/wp-content/uploads/sites/51/2013/10/usf_bulls";
  // Load image from a web server
  webImg = loadImage(url, "gif");
  size(450, 475);
  stroke(255, 255, 255);
  noFill();
}

void draw() {
  ellipse(225, 237.5, mouseX, mouseY);
}
void mousePressed() {
       background(0);
       image(webImg, 0, 0);
    }
