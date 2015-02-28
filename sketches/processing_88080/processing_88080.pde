
PImage img;
PImage img1;
PImage img2;

float x = 40;
float y = 20;
void setup() {
  background(HSB);
  size(800,800);
  noStroke();
 img = loadImage("Color_icon_red_svg.png"); 
 img1 = loadImage("brutedidifferent64.png"); 
 img2 = loadImage("0904271444ce706c9e312e3d0d.png"); 
}
 
void draw() {
  float g= random(y);
  float h= noise(x);
  color c = HSB;
  int s = second();
  imageMode(CENTER);
  smooth();
  colorMode(HSB);
  
  pushMatrix();
  noStroke();
  alpha (200);
  scale(0.3);
  smooth ();
  translate(1400,1400);
  //shearX(PI/2.0);
  rotate(y/2);
  image(img1,100,100,width,height/60);
  //image(img,y, g*height, g, 100);
  image(img1,x, h, height/2, 1000/width);
  //copy(100, 22, 10, 10, 35, 25, 50, 50);
  x= random(80);
  y= random(30);
  float value = alpha(c);  // Sets 'value' to "0"
  //fill(value);
  popMatrix();
 
 pushMatrix();
  noStroke();
  //fill(0);
  scale(0.2);
  translate(2100,2100);
  rotate(x/2);
  //image(img2,5,random(20),width/20,height/20);
  image(img,600,h*g, 40, 40);
  //image(img1,y, 3*(width), height/2, 50/width);
  x= random(30);
  y= random(30);

  popMatrix();
  
 pushMatrix();
  noStroke();
  fill(0);
  scale(0.4);
  translate(1400,14000);
  rotate(y/2);
  //image(img2,5,random(20),width/20,height/20);
  //image(img1,x,y,x,y, 40, 60,80,100);
  //image(img1,y, 3*(width), height/2, 50/width);
  image(img1,40,40,width,height/60);
  x= random(20);
  y= random(50);

  popMatrix();
  
 }




