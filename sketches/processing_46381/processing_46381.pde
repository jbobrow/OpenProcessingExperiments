
PImage img0; 
PImage img1;
PImage img2;
PImage img3;
float xpos = 300;
float ypos = -300;
float zpos = 300;


void setup() {
  size(628, 600);
  img0 = loadImage("oh.png");
  img1 = loadImage("mj.png");
  img2 = loadImage("mj2.png");
  img3 = loadImage("mj3.png");
}


void draw() {
  background (#3E3939);
  

  image(img3, zpos, 10);
  zpos = zpos - 3;
  if (zpos < -300) {
    zpos = 700;
  }
  
 
  image(img2, ypos, 100);
  ypos = ypos + 5;
  if (ypos > 500) {
    ypos = -400;
  }
  
  
  image(img1, xpos, height/5+100);
  xpos = xpos - 8;
  if (xpos < - 800) {
    xpos = 800;
  }
  image(img0,10,0);
  
  
}




