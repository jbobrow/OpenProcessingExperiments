
PImage webImg;

void setup() {
  size(860,540);
  String url = "http://images5.fanpop.com/image/photos/30100000/Guilty-Crown-guilty-crown-30182115-1920-1080.jpg";
  // Load image from a web server
  webImg = loadImage(url, "jpg");
}

void draw() {
  background(36,41,40);
  webImg.resize(810,490);
  image(webImg, 25,25 );
}


