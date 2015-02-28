
//setting up the array.
int numFrames = 9;
int frame = 0;
int count = 0;
PImage[] images = new PImage[numFrames];

//setting up image size and indicating frame rate for the entire sketch.
void setup() {
size(400, 267);
frameRate(4);
noLoop();

//putting the images in the sequence. 
images[0] = loadImage("turn1.jpg");
images[1] = loadImage("turn2.jpg");
images[2] = loadImage("turn3.jpg");
images[3] = loadImage("turn4.jpg");
images[4] = loadImage("turn5.jpg");
images[5] = loadImage("turn4.jpg");
images[6] = loadImage("turn3.jpg");
images[7] = loadImage("turn2.jpg");
images[8] = loadImage("turn1.jpg");

}

//determining that the frames need to follow eachother and once they reach the max. number of frames it returns back to frame 0. 
void draw () {
frame++;
if (frame == numFrames) {
frame = 0;
}

//image positioning. 
image(images[frame], 0, 0);

}

//pausing and playing the frames by pressing a mouse. 
void mousePressed()
{
if (count==0){
loop();
count=1;
}
else if(count==1){
noLoop();
count=0;
}
}

