
PImage img0, img1, img2, img3, img4, img5,img6,img7,img8,img9,img10,img13;
float a;
float b=80;
float c=500;

void setup(){
  size(600,600);

img0 = loadImage("1.png");
img1 = loadImage("2.png");
img2 = loadImage("3.png");
img3 = loadImage("4.png");
img4 = loadImage("5.png");
img5 = loadImage("6.png");
img6 = loadImage("7.png");
img7 = loadImage("8.png");
img8 = loadImage("9.png");
img9 = loadImage("10.png");
img13 = loadImage("14.png");

image(img13,-60,-60,700,700);

}

void draw() {
  
 float r1= random(0,600);
 float r2= random(0,600);
 
 
  
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(a);
  image(img0,0,0,200,200);
  popMatrix();
  
  image(img1, a, a, 200, 200);
  image(img7, mouseX, mouseY,b,b);
  image(img9, r1,r2,150,150);
  image(img5, c,c,200,200);
  image(img6,c,0,150,150);
  image(img8,0,c,150,150);
  image(img2,a,0,150,150);
  image(img3,0,a,150,150);
  

  a = a + 0.1;
  b = b + 0.1;
  c = c - 0.1;
}

void keyPressed(){
  
  saveFrame("img#####.png");
  
}
