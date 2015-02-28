

int numFrames = 4;
int frame = 0;

PImage[] images = new PImage[numFrames];


void setup() {
  size (336, 450);


images[0] = loadImage("5.jpg");
images[1] = loadImage("5.jpg");
images[2] = loadImage("6.jpg");
images[3] = loadImage("7.jpg");


}

void draw() {

//frame = (frame+1) % numFrames;
image(images[frame], 0, 0);
}

void mouseReleased(){

}

void mousePressed(){
frame = frame+1; 
}

