
//copy information from another image
//the images are not loaded here so this code will not work, it is for reference only
PImage myImg, myMask;
//It takes the w and h parameters of myImg
int w;
int h;

void setup(){
//image
myImg = loadImage("landscape.jpg"); //this is the image to be masked
myMask = loadImage("mask.jpg"); //this is the image that will make the mask
//image MUST be the same size
myImg.mask(myMask); //this is a behavior

int w = myImg.width;
int h = myImg.height;

//size takes the w and h parameters of the myImg
size(w,h);
}

void draw(){
    background(0);
  image(myImg, 0, 0);
}
