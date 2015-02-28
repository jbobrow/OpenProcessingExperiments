
PImage fire_1;
PImage fire_2;
PImage hope;
PImage hope2;


float x = 10;
float y = 10;
float a = 0;
float b = 0;

float c =0;
float d =600;
void setup() {
  size(600, 600);
  fire_1 = loadImage("fire_1.jpg");
  fire_2 = loadImage("fire_2.jpg");
  hope = loadImage("hope.jpeg");
  hope2 = loadImage("hope copy.jpeg");

  frameRate(60);
}

void draw() {
  background(223, 182, 103);

  x = height/2;
  y = width /2;
  c = c+1;
  d = d-1;
  float x2 = sin(a) * 20;
  float y2 = cos(a) * 20;

  float x3 = sin(b) * 20;
  float y3 = cos(b) * 20;


  image(fire_1, x + x2+ x3, y + y2 +y3, 300, 300);
  image(fire_2, x + x2 +x3 -200, y + y2 +y3-200, 300, 300);

  a= a+0.1;
  b=b+0.01;
  //for (c=0; c<=width; c=c+20) {
    //for (d=600;d>=0; d = d-20) {
      image(hope, c, d, 200, 386);
      image(hope2, c-600, d+200, 200, 386);

 // }
  println(+1);
}


