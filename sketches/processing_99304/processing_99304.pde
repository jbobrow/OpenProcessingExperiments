
//SOMA2607: Week 6 Homework_Animation
//tutorial group: Fri 2-5pm
//z3430312,DongniLi

int frame = 0;
int numFrames = 19;
PImage[ ] images = new PImage[numFrames];


void setup() {
  size(950, 600);
  frameRate(10); 
  for(int i=1;i<19;i++){

    String imageName = i+".png";

    images[i] = loadImage(imageName); 
  }  
}

void draw() { 
  frame ++;
  if (frame >= numFrames) {
    frame = 1;
  }
  image(images[frame], -1, -1);
}



