
PImage webImg;

void setup() {
  size(1000,1000);
  String url = "http://www.hdwallpapersinn.com/wp-content/uploads/2013/09/20829205916-lovely-dogvn801.com_.jpg";
  // Load image from a web server
  webImg = loadImage(url);
}

void draw() {
  background(0);
  image(webImg, 0, 0);
}


