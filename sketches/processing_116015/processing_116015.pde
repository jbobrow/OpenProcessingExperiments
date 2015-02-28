
PImage img0, img1, img2 ;
float a = 0;
int copy = 50 ; 

void setup(){
  
  size (800, 500) ;
  background(0);
  img0 = loadImage("0.png");
  img1 = loadImage("1.png");
  for (int i = 0; i < 3; i ++) {
     img2 = loadImage("2.png");
  }  
}

void draw(){
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  image(img0, 0, 0);
  popMatrix();
  
  translate(width/2, height/2);
  rotate(a * -1);
  image(img2, 0, 0);
  image(img1, mouseX, mouseY);
  
  a = a+0.03 ;
  
}


