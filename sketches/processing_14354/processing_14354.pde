



PImage a;
void setup (){
size(800, 600);
 
a = loadImage("portland.jpg");
image(a, 0, 0);

}

void draw(){
    int s = second();
    int h = hour();
  s += map(s, 0, 60, 0, width);
  int m = minute();
  a.filter(POSTERIZE, 4);
  copy(a, s, 0, 28, height, s, 0, 30, height);
updatePixels();
}

