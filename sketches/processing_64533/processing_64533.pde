
int numFrames = 25;
float easing = 0.5;
float angle = 0.3;
int frame = 0; //frame to display
PImage[] images = new PImage [numFrames]; //image array

void setup(){
size(200,200);
angle += 0.1;
float fr = map(cos(angle),0,1, 5,32);
frameRate(fr); //max frames/sec

//

images[0] = loadImage("lo-01.png");
images[1] = loadImage("lo-02.png");
images[2] = loadImage("lo-03.png");
images[3] = loadImage("lo-04.png");
images[4] = loadImage("lo-05.png");
images[5] = loadImage("lo-06.png");
images[6] = loadImage("lo-07.png");
images[7] = loadImage("lo-08.png");
images[8] = loadImage("lo-09.png");
images[9] = loadImage("lo-10.png");
images[10] = loadImage("lo-11.png");
images[11] = loadImage("lo-12.png");
images[12] = loadImage("lo-13.png");
images[13] = loadImage("lo-14.png");
images[14] = loadImage("lo-15.png");
images[15] = loadImage("lo-16.png");
images[16] = loadImage("lo-17.png");
images[17] = loadImage("lo-18.png");
images[18] = loadImage("lo-19.png");
images[19] = loadImage("lo-20.png");
images[20] = loadImage("lo-21.png");
images[21] = loadImage("lo-22.png");
images[22] = loadImage("lo-23.png");
images[23] = loadImage("lo-24.png");
images[24] = loadImage("lo-25.png");


}

//

void draw (){
  //background(255);
  noStroke();
  fill(255,50);
  rect(0,0,200,200);
  
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
  imageMode(CENTER);
  image (images[frame],width/2+15,height/2-15);
  
}

