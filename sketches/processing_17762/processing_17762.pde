
int xpos, imageXPos, imageYPos;
int imageNo; //scaled number correlating to day no.
PImage [] images = new PImage [364]; 

boolean isLandscape;

void setup() {
size(300, 200);
fill(0);

for (int i=0; i<363; i++){
    images[i] = loadImage(i+1+"-365.jpeg");
}

}

void draw () {
xpos = mouseX;
imageNo = int(map(xpos, 0, 300, 0, 364));
//println (imageNo);


orientation ();
quad (0,0,300,0,300,200,0,200);
image(images[imageNo], imageXPos, imageYPos);

}


void orientation () {        //checks to see whether the image is landscape or portrait and ensures image is centered.
  if(images[imageNo].height >= images[imageNo].width){
     //println ("portrait");
     isLandscape = false;     
     imageXPos = 150-(images[imageNo].width/2);
     imageYPos = 0;
  } else {
    //println ("landscape");
    isLandscape = true;
    imageXPos = 0;
    imageYPos = 100-(images[imageNo].height/2);
  }
}

