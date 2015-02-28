
/* @pjs preload="background.png";"serenity.png";"reaverSmall.png";"reaversSmall.png";"reaversBig.png";
"reaverBig.png";"bar1.png";"bar2.png";"bar3.png";"right.png";"wrong.png";*/
PImage back;
PImage firefly;
PImage small;
PImage big;
PImage bigger; 
PImage smaller;
PImage fruity;
PImage oaty;
PImage bar;
PImage right;
PImage wrong;
float x, y;
float x1, y1;
float x2, y2;
float x3, y3;
float x4, y4;
float dim = 45.0;
float dim1 = 45.0;
float dim2 = 35.0;
float dim3 = 35.0;
float a = 50.0;
float b = 0.0;
float c = 100.0;
float d = 50.0;
float e = 75.0;
float f = 200.0;
float g = 10.0;
float h = 300.0;
float i = 0.0;
float j = 200.0;
float k = 0.0;
float l = 0.0;
float m = 0.0;
float n = 100.0;
void setup(){
  size(500,500);
  back = loadImage("background.png");
  firefly = loadImage("serenity.png");
  small = loadImage("reaverSmall.png");
  smaller = loadImage("reaversSmall.png");
  bigger = loadImage("reaverBig.png");
  big = loadImage("reaversBig.png");
  fruity = loadImage("bar1.png");
  oaty = loadImage("bar2.png");
  bar = loadImage("bar3.png");
  right = loadImage("right.png");
  wrong= loadImage("wrong.png");
}
void draw(){
  image(back,0,0);
  image(firefly,mouseX,mouseY);
  
  x = x + 0.8;
  if (x > width + dim) {
    x = -dim;
  } 
  translate(x, dim);
  image(small, b, a);
  if (mouseX == b && mouseY == a){
    image(wrong,250,250);
  }
  
  
  x1 = x1 + 0.8;
  if (x1 > width + dim1) {
    x1 = -dim1;
  } 
  translate(x1, dim1);
  image(big, d, c);
  if (mouseX == d && mouseY == c){
    image(wrong,250,250);
  }
  
  if (x2 > width + dim2) {
    x2 = -dim2;
  } 
  translate(x2, dim2);
  image(smaller, e, f);
  if (mouseX == e && mouseY == f){
    image(wrong,250,250);
  }
  
  
  if (x3 > width + dim3) {
    x3 = -dim3;
  } 
  translate(x2, dim2);
  image(bigger,g,h);
  if (mouseX == g && mouseY == h){
   image(wrong,250,250); 
  }
  
    y3 = y3 + 0.8;
  if (y3 > width + dim3) {
    y3 = -dim3;
  } 
  translate(dim3, y3);
  image(fruity, i,j);
  image(oaty, k, l);
  image(bar, m, n);
  if (mouseX == dim3 && mouseY == y3){
    image(right, 250, 250);
  }
}


