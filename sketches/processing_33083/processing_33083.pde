
PImage f;
int img_x5= 0;
int img_y5= 0;
float img_w5 = 600;
float img_h5= 600;


PImage b;
int img_x= 0;
int img_y= 0;
float img_w = 50;
float img_h= 50;
int img_speed = 5;

PImage c;
int img_x1= 0;
int img_y1=0;
float img_w1=50;
float img_h1=60;
int img_speed1 = 3;

PImage d;
int img_x2= 0;
int img_y2=0;
float img_w2=50;
float img_h2=50;
int img_speed2 = 7;

PImage a;
int img_x3= 0;
int img_y3=0;
float img_w3=50;
float img_h3=50;
int img_speed3 = 4;

PImage e;
int img_x4= 0;
int img_y4=0;
float img_w4=50;
float img_h4=50;
int img_speed4 = 3;

void setup() {
  size(600, 600);
  b = loadImage("apple.png");
  c = loadImage("li.png");
  d = loadImage("banana.png");
  a = loadImage("prange.png");
  e = loadImage("basket.png");
  f = loadImage("star.jpg");
}
 
void draw() {
  background(255);
  image(f, 0, 0, 600, 600);
  image(b, 400, img_y, img_w, img_h);
  img_y = img_y + img_speed;
  image(c, 200, img_y1, img_w1, img_h1);
  img_y1 = img_y1 + img_speed1;
  image(d,10,img_y2,img_w2,img_h2);
  img_y2 = img_y2 + img_speed2;
  image(a, 500, img_y3, img_w3, img_h3);
  img_y3 = img_y3 + img_speed3;
  image(e, img_x4, 550, img_w, img_h);
  img_x4 = img_x4 + img_speed4;
  if (img_y1 + img_h1 > 600){
  img_y1 = 0 ;
  }
  if (img_y + img_h > 600){
  img_y = 0 ;
}
  if (img_y2 + img_h2 > 600){
    img_y2 = 0 ;
}
  if (img_y3 + img_h3 > 600){
    img_y3 = 0 ;
}
  if (img_x4 + img_w4 > 600){
    img_speed4=img_speed4*-1 ;
}
  if (img_x4 + img_w4 < 0){
    img_speed4=img_speed4*-1;
 }
  };


