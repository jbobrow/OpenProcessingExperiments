
//Maria Cioffi
//copyright aksjaslkjfd

float x = 0;
float y = 0;
float xCount;
float yCount;
PImage cat;

void setup() {
 size(400,400);
 cat = loadImage("cat.jpg");
 xCount = random(1,4); 
 yCount = random(1,4); 
}

void draw(){
  if (x>200 || x<0){
    xCount = xCount*(-1);
  }
  if (y>240 || y<0) {
    yCount = yCount*(-1);
  }
  background(23, 65, 100);
  y = y+yCount;
  x = x+xCount;
  image(cat, x, y, 200, 160);
}


