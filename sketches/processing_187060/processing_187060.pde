
/* @pjs preload="318456289_00916.jpg, 318456289_00926.jpg, 318456289_00936.jpg, 318456289_00946.jpg,318456289_00956.jpg, 318456289_00966.jpg, 318456289_00976.jpg, 318456289_00986.jpg, 318456289_00996.jpg, 318456289_01006.jpg, 318456289_01016.jpg"; */
int x;
int numFrames = 100;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(1000, 1000);
  frameRate(32);
  
  String url1="http://i.imgur.com/54jvGZs.jpg";
  String url2="http://i.imgur.com/wXcWRRl.jpg";
  String url3="http://i.imgur.com/szV2ifu.jpg";
  String url4="http://i.imgur.com/9sfYKiV.jpg";
  String url5="http://i.imgur.com/giVpmM2.jpg";
  String url6="http://i.imgur.com/uAbF4hr.jpg";
  String url7="http://i.imgur.com/eBnMFCK.jpg";
  String url8="http://i.imgur.com/85m33Ju.jpg";
  String url9="http://i.imgur.com/pvHOMai.jpg";
  String url10="http://i.imgur.com/HUjcI5Y.jpg";
  
  
  images[1]  = loadImage(url1); 
  images[2]  = loadImage(url2);
  images[3]  = loadImage(url3); 
  images[4]  = loadImage(url4);
  images[5]  = loadImage(url5); 
  images[6]  = loadImage(url6);
  images[7]  = loadImage(url7); 
  images[8]  = loadImage(url8);
  images[9]  = loadImage(url9); 
  images[10] = loadImage(url10);
  

} 
 
void draw() { 
  background(0);
  if (x<=100){
    image(images[1],0,-20);}
    if (x<=200 && x>100){
      image(images[2],0,-20);
    }
    if (x<=300 && x>200){
      image(images[3],0,-20);}
          if (x<=400 && x>300){
      image(images[4],0,-20);}
          if (x<=500 && x>400){
      image(images[5],0,-20);}
          if (x<=600 && x>500){
      image(images[6],0,-20);}
          if (x<=700 && x>600){
      image(images[7],0,-20);}
          if (x<=800 && x>700){
      image(images[8],0,-20);}
          if (x<=900 && x>800){
      image(images[9],0,-20);}
          if (x<=1000 && x>900){
      image(images[10],0,-20);}
}

void mouseMoved(){
  x=mouseX;
}

