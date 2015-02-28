
PImage img1, img2, img3, img4;
float theta;
float x, y;
int r;

void setup(){
  size(800,680);
  smooth();
  
  img1 = loadImage("ppp.png");
  img2 = loadImage("earth.png");
  img3 = loadImage("boy.png");
  img4 = loadImage("utyuu.png");
  
  
  //ぶるぶるーーーーーーーーーーーーー
  theta = 0;
  r = 2;
}


void draw(){
  background(47,62,72);
  
  image(img4, 0,0);
  
  //地球
  image(img2, 0, 480);
  
  //ぶるぶるーーーーーーーーーーーーー
  
  if (mouseY > 200 && mouseX < 500 && mouseX > 200){
    theta += 1;
    x = r*sin(theta);
 }
  image(img3,x+380,415);
  
 //UFOーーーーーーーーーーーーーーー
  //image(mouseX, mouseY, 10, 10);
  image(img1, mouseX, mouseY);
  
}
  


