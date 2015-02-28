
//variables for catleft catright blending
PImage source0;     
PImage source1;     
float p = 0;

//variables for convocation bouncing
PImage convocation;
PImage bgconsky;
int a;
float y = 100;
float speed = 0.5;

//variables for singer
int maxImages = 16;
int imageIndex = 0;
PImage [] images = new PImage[maxImages];
PImage bgcloud;

//varibles for flying angels
PImage angels;
PImage bgsky;
float angle = 0.0;

void setup() {
  size(841,595);
  frameRate(20);

  //functions for catleft catright blending
  source0 = loadImage("catleft0.png");
  source1 = loadImage("catright1.png");

  //functions for convocation bouncing
  bgconsky = loadImage("consky.jpg");
  convocation = loadImage ("convocation.png");

  //functions for singer
  bgcloud = loadImage("cloud.jpg");
  for (int i = 0; i < images.length; i++ ) {
    images[i] = loadImage("voice" + i +".png");
  } 

  //functions for flying angels
  bgsky = loadImage("sky.jpg");
  angels = loadImage("angels.png");
}

void draw() {
  // functions for catleft catright blending
  p=(1+sin(frameCount/100.0))/2;
  println(p);

  loadPixels();
  // We are going to look at both image's pixels
  source0.loadPixels();
  source1.loadPixels();

  for (int x = 0; x < source0.width; x++ ) {
    for (int y = 0; y < source0.height; y++ ) {
      int loc = x + y*source0.width;

      color c0 = source0.pixels[loc];
      color c1 = source1.pixels[loc];

      float r0 = red(c0); 
      float g0 = green(c0); 
      float b0 = blue(c0);
      float r1 = red(c1); 
      float g1 = green(c1); 
      float b1 = blue(c1);

      // Combine each image's color
      float r = p*r0+(1.0-p)*r1;
      float g = p*g0+(1.0-p)*g1;
      float b = p*b0+(1.0-p)*b1;

      pixels[loc] = color(r,g,b);

    }
  }

  updatePixels();

  //functions for convocation bouncing
  imageMode(CORNER);
  image (bgconsky,0,0);
  y = y + speed;
  if ((y > 170) || (y < 80)) {
    speed = speed* -1;
  }
  imageMode(CENTER);
  image(convocation,127,y);

  //functions for singer
  imageMode(CORNERS);
  image(bgcloud,509,340,841,595);
  image(images[imageIndex],509,340,841,595);
  imageIndex = (imageIndex + 1) % images.length;

  //functions for flying angels
  imageMode(CORNERS);
  image(bgsky,509,0,841,340);
  translate(673,64);
  rotate(angle);
  angle += 0.01;
  imageMode(CENTER);
  image(angels,0,0);

}









