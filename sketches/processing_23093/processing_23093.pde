
int pics = 7;
int pic = 0;
int count = 0;
PImage[] images = new PImage[pics];
 
void setup() {
  size(600, 400);
  frameRate(3);
  noLoop();
   
  images[0] = loadImage("adv4.jpg");
  images[1] = loadImage("1.jpg");
  images[2] = loadImage("2.jpg");
  images[3] = loadImage("3.jpg");
  images[4] = loadImage("4.jpg");
  images[5] = loadImage("5.jpg");
  images[6] = loadImage("6.jpg");
 
}
 
void draw () {
 pic++;
  if (pic == pics) {
    pic = 0;
  }
     
   image(images[pic], 0, 0);
   
   loop();
}


  void mousePressed () {
  save("_mirror.png");
}


  

   
 



