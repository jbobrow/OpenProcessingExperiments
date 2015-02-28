


PImage img1, img2, img3, img4;
float a = 0;
int i;

void setup(){
  size(1000,800);
  background(0);
  img1 = loadImage("cat_2.png");
  img2 = loadImage("flower.png");
  img3 = loadImage("lego_image.png");
  img4 = loadImage("simpson.png");
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  
  image(img1, 100, 100);
  image(img2, 200,400);
  
  for (int i = 0; i < 10; i++) {
    image(img3, mouseX * i, mouseY * i);
  }
  popMatrix();
  a += 0.2;
}

void keyPressed(){
  
  if(keyCode == ENTER){
    save("image01.png");
  }
  
  if(keyCode == UP) {
    image(img4, random(10,200), height/2);
    a += 0.5;
  }
    
}

  
  
  


