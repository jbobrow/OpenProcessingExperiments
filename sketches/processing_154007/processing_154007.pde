
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
 x = -250; 
}

void draw(){
  if (x>400){
    x=-250;
  }
  background(23, 65, 100);
  y = 150;
  x = x+count;
  image(cat, x, y, 200, 160);
}
  
  


