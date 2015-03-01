
PImage webImg;
  void setup(){
  size(490,557);
 String url = "http://s18.postimg.org/w9ovmuzh5/maze1.png";
  webImg = loadImage(url);
    image(webImg, 0, 0);
}
void draw(){}
void mouseDragged(){
  noStroke();fill(54,137,194,80);
    ellipse(mouseX,mouseY,10,10);
  }
void mouseReleased(){
  image(webImg, 0, 0);
}
  
    

