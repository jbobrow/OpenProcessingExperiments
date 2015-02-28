

PImage photo_1;
PImage photo_2;
PImage photo_3;
PImage photo_4;
PImage photo_5;
PImage photo_6;
PImage photo_7;
PImage photo_8;
PImage photo_9;
PImage photo_10;
PImage photo_11;
PImage photo_12;
PImage photo_13;
PImage photo_14;
PImage photo_15;
PImage photo_16;
PImage photo_17;
PImage photo_18;
PImage photo_19;
PImage photo_20;
PImage photo_21;
PImage photo_22;
PImage photo_23;
PImage photo_24;
PImage photo_25;
PImage photo_26;
PImage photo_27;
PImage photo_28;
PImage photo_29;
PImage photo_30;
PImage photo_31;

 
void setup() {
  smooth();
  size(700,700);
  colorMode(HSB, 360, 100, 100);
  
  imageMode(CENTER);
  //call images 
  frameRate(240);
  photo_1 = loadImage("photo_1.jpg");
  photo_2 = loadImage("photo_2.jpg");
  photo_3 = loadImage("photo_3.jpg");
  photo_4 = loadImage("photo_4.jpg");
  photo_5 = loadImage("photo_5.jpg");
  photo_6 = loadImage("photo_6.jpg");
  photo_7 = loadImage("photo_7.jpg");
  photo_8 = loadImage("photo_8.jpg");
  photo_9 = loadImage("photo_9.jpg");
  photo_10 = loadImage("photo_10.jpg");
  photo_11 = loadImage("photo_11.jpg");
  photo_12 = loadImage("photo_12.jpg");
  photo_13 = loadImage("photo_13.jpg");
  photo_14 = loadImage("photo_14.jpg");
  photo_15 = loadImage("photo_15.jpg");
  photo_16 = loadImage("photo_16.jpg");
  photo_17 = loadImage("photo_17.jpg");
  photo_18 = loadImage("photo_18.jpg");
  photo_19 = loadImage("photo_19.jpg");
  photo_20 = loadImage("photo_20.jpg");

  

  photo_21 = loadImage("photo_21.jpg");
  photo_22 = loadImage("photo_22.jpg");
  photo_23 = loadImage("photo_23.jpg");
  photo_24 = loadImage("photo_24.jpg");
  photo_25 = loadImage("photo_25.jpg");
  photo_26 = loadImage("photo_26.jpg");
  photo_27 = loadImage("photo_27.jpg");
  photo_28 = loadImage("photo_28.jpg");
 

 
  
  
}
  
void draw() {
  
  //color map from week 4 demo
  float r = map(mouseX, 0, width, 230,27);  
  float g = map(mouseX, 0, width, 30,22);
  float b = map(mouseX, 0, width, 20,216);
  background(r,g,b);
  
  

  float a = random (10,90);
  float bb = random (55,75);
  float c = random (21,40);
  float d = random(100, 300);
  float e = random(200,400);
  float f = random(100,200);
  float gg = random(100,150);
  float h = random (20,95);
  float i = random (40,60);
  float j = random (10,100);
  float k = random (90,200);
  float l = random (10,100);
  float m = random (150, 200);
  float n = random (95,100);
  float o = random (60,200);
  float p = random (20,90);
  float q = random (40,50);
  float rr = random (20,400);
  float s = random (90, 200);
  float t = random (100,400);
  float u = random (400,600);
  float v = random (10,60);
  float w = random (40,80);
  float x = random (90,200);
  float y = random (20,600);
  float z = random (110,235);
  
  

image(photo_20, width/2, height/2, u,u);
image(photo_28, 200, 200, e, e);
image(photo_1, width/2, height/2, a, a );
image(photo_2, width/2, height/2, bb,bb);
image(photo_3, width/2, height/2, c, c);
image(photo_4, width/2, height/2, d,d);
image(photo_5, width/2, height/2, f,f);
image(photo_6, width/2, height/2, gg,gg);
image(photo_7, width/2, height/2, h,h);
image(photo_8, width/2, height/2, i,i);
image(photo_9, width/2, height/2, j,j);
image(photo_10, width/2, height/2, k, k);
image(photo_11, 50, 50, l, l);
image(photo_12, 300, 300, a, a);
image(photo_13, 400, 400, d, d);
image(photo_14, width/2, height/2, o, o);
image(photo_15, 10, 300, p, p);
image(photo_16, 200,200, q, q);
image(photo_17, 90, 90, rr, rr);
image(photo_18, 400, 400, s, s);
image(photo_19, width/2, height/2, t, t);
 


image(photo_21, width/2, height/2, v,v);
image(photo_22, width/2, height/2, w,w);
image(photo_23, 10, 400, x, x);
image(photo_24, 20, 20, y, y);

image(photo_25, 100, 100, z, z);
image(photo_26, 40, 90, a, a);
image(photo_27, 30, 30, b, a);




}



