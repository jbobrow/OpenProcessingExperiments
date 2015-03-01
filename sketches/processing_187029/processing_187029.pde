
PImage img1;
PImage img2;

void setup(){
  size(900,585);
  String url = "http://s9.postimg.org/ahcuf2jbj/Screen_Shot_2015_02_22_at_10_22_17_PM.png";
img1 = loadImage(url, "png");
image(img1,0,0);
textSize(14);
text("slowly click and release to fly", 75, 72);

}

void draw(){}
void mousePressed(){
  String url1 = "http://s4.postimg.org/h6qbs5dil/Screen_Shot_2015_02_22_at_10_23_24_PM.png";
  img2 = loadImage(url1, "png");
  image(img2,0,0);
}
void mouseReleased(){
  String url = "http://s9.postimg.org/ahcuf2jbj/Screen_Shot_2015_02_22_at_10_22_17_PM.png";
img1 = loadImage(url, "png");
image(img1,0,0);
}
