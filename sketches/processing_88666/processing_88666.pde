
PImage img;
int img_index = 0;
String img_list[] =
{
  "031.JPG",
  "033.JPG",
  "034.JPG",
  "035.JPG",
  "037.JPG",
  "039.JPG",
  "043.JPG",
  "050.JPG",
  "scene-missing.jpg",
  "052.JPG",
};
void setup(){
  size(800, 533);
  img = loadImage(img_list[img_index]);
  resizeMe(img.width, img.height);
}
void draw(){
  image(img, 0, 0);
}
void keyReleased(){
  if( key == ' '){ //press SPACE BAR
    img_index++;
    if( img_index >= img_list.length ) img_index = 0;
    img = loadImage(img_list[img_index]);
    resizeMe(img.width, img.height);
  }
}
public void resizeMe(int size_x, int size_y){
  int dif_x = frame.getWidth()  - width;
  int dif_y = frame.getHeight() - height;
 
  frame.setSize(size_x + dif_x, size_y + dif_y);
  size(size_x, size_y);
}

 



