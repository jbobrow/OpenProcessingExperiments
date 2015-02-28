
//"Hello!"
//Talk to the bricks to make 'em move!

import processing.opengl.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
PImage brickwall;
PImage picture;
PImage[] movingbricks = new PImage[83];

//assigning coordinates for the bricks
int[] x = {131,359,641,397,79,767,602,209,307,
           842,434,0,430,323,887,193,650,583,695,
           173,877,707,610,0,460,178,815,416,626,
           275,37,872,842,155,893,64,287,758,900,7,451,91,790,
           445,521,214,33,343,582,4,77,470,695,491,252,568,721,2,140,
           241,384,542,856,64,382,460,551,280,695,425,488,559,
           710,851,255,393,545,605,757,360,505,667,371};
int[] y = {34,72,121,282,283,223,226,388,231,436,580,
           582,436,486,579,676,673,22,327,130,
           166,535,387,439,726,489,76,181,483,582,676,264,717,
           226,376,85,24,27,27,34,1,1,1,31,84,84,133,133,
           183,229,229,238,225,135,288,286,279,343,340,346,345,345,333,
           396,393,391,444,441,445,496,496,486,483,489,543,541,540,
           580,578,639,639,632,678};             

void setup() {
size(1024, 768, OPENGL);
frameRate(100);

//loading images
picture = loadImage("backgroundpicture.jpg");
brickwall = loadImage("brickchange.png");
for(int i=0; i<83; i++) {
 String imageName = "brick" + nf(i, 2) + ".jpg";
 movingbricks[i] = loadImage(imageName);
}
//getting sound input
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  //placing images
image(picture,0,0);
image(brickwall, 0, 0);
for (int i=0;i<83;i++){
  for(int j = 0; j < in.bufferSize(); j=j+1000) {
for (int k = 0; k < in.bufferSize(); k=j+1000) { 
  float randomiser = random(1,75);
   float motionx = random(in.left.get(j)*randomiser,in.left.get(j)*randomiser);
   float motiony = random(in.right.get(k)*randomiser,in.right.get(k)*randomiser);
  image(movingbricks[i],x[i]+motionx,y[i]+motiony);     
}
}
}
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}



