
PImage img1;

 
float x = 10;
float y = 20;

void setup() {
background(255,50,150);
  size(500,500);
 img1 = loadImage("pic1.png");
// img2 = loadImage("pic_2.png");

imageMode(CENTER);
}
  
void draw() {
  smooth();
  colorMode(HSB);

  float a= noise(x);
  float b= noise(y);
   x= random(40);
  y= random(40);
 

  
  pushMatrix();
  noStroke();
  scale(0.4);
  translate(600,600);
  rotate(x/2);

image(img1,a, b,450,450); //middle
image(img1,a*width-50,b*height-50, 100, 100);//out

   
  popMatrix();
  

   
 }



