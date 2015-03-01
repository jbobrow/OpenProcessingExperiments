
int frames = 7;
int panel = 0;
int x = 0;
PImage theImage = new PImage[frames];

void setup(){
  size(500,500);
  frameRate(10);
  for(int i=0;i<theImage.length;i++){
    theImage[i]=loadImage(i+".jpg");
  }
}

void draw(){
  panel = (panel+1) % frames;
  image(theImage[panel%frames],0,0);
}


