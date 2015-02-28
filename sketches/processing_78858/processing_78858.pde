

PImage myImg;
float elleSize, size2;
float diam;


void setup(){
  size (875,500);
  myImg = loadImage ("sloth4.jpg");
  colorMode(HSB,360,100,100,100); 
  photoFilter();
}

  
void draw(){
}


void photoFilter(){
  myImg.loadPixels(); //without myImg, will load screen
  int myImgSize = myImg.width * myImg.height; // # of pixels
 for(int i = 0; i < myImgSize; i++){
    color cp = myImg.pixels[i];
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness(cp);
    myImg.pixels[i] = color (45,h,s);
  }
  myImg.updatePixels();
  image(myImg,0,0);
  
}


