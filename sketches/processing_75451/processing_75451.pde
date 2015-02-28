
PImage[] img = new PImage[12];
int index;

void setup() {
  size(640,427);
  for (int i =0; i <img.length; i++){
  img[i] = loadImage(i+".JPG");
  frameRate(10);
}
}
void draw() {
  image(img[index], 0, 0);
  println(index);
}

void mouseReleased(){
    index = index+1;
    index= index%12;
}

