
/* @pjs preload="0.jpg","1.jpg",
"2.jpg","3.jpg","4.jpg","5.jpg",
"6.jpg","7.jpg","8.jpg","9.jpg*/
int total = 9;
int pic = 0;
PImage[] images = new PImage[10];
void setup(){
  size(621,378);
  frameRate(1);
  images[0] = loadImage("0.jpg");
  images[1] = loadImage("1.jpg");
  images[2] = loadImage("2.jpg");
  images[3] = loadImage("3.jpg");
  images[4] = loadImage("4.jpg");
  images[5] = loadImage("5.jpg");
  images[6] = loadImage("6.jpg");
  images[7] = loadImage("7.jpg");
  images[8] = loadImage("8.jpg");
  images[9] = loadImage("9.jpg");
}
void draw(){
  pic = pic + 1;
  image(images[pic],0,0);
  if (pic > frames) {
    pic = 0;
  }
//  image(images[0],0,0);
//  image(images[1],0,0);
//  image(images[2],0,0);
//  image(images[3],0,0);
//  image(images[4],0,0);
//  image(images[5],0,0);
//  image(images[6],0,0);
//  image(images[7],0,0);
//  image(images[8],0,0);
//  image(images[9],0,0);
}


