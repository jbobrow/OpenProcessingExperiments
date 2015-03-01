
//Maria Cioffi
//copyright aksjaslkjfd

float x;
float y;
float count;
PImage cat;

void setup() {
 size(400,400);
 cat = loadImage("cat.jpg");
 count = random(1,4); 
}

void draw(){
  if (x>200 || x<0){
    count = count*(-1);
  }
  background(23, 65, 100);
  y = 150;
  x = x+count;
  image(cat, x, y, 200, 160);
}


