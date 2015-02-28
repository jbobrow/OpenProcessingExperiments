

int numFrames = 6;
int frame = 0;

PImage[] images = new PImage[numFrames];



void setup() {
  size (530, 400);
  frameRate(0.3);

images[0] = loadImage("tumblr_mc7ksl1sYv1rheqrao1_1280.jpg");
images[1] = loadImage("tumblr_mc7ksl1sYv1rheqrao1_1280.jpg");
images[2] = loadImage("1.jpg");
images[3] = loadImage("2.jpg");
images[4] = loadImage("3.jpg");
images[5] = loadImage("4.jpg");

}

void draw() {

frame = (frame+1) % numFrames;
image(images[frame], 0, 0);

}

void mouseReleased(){
noLoop();
}

void mousePressed(){
loop();
}

