
/*
(float [] myArray = new float[10]; //make an emty array with 10 places

for(int i = 0; i < myArray.length; i++){
  myArray[i] = random(100);
}

for(int i = 0; i < myArray.length; i++){
  println(myArray[i]);
}
*/

PImage myImg;

void setup(){
  size(800, 600);
  myImg = loadImage("IMAG0288edit.jpg");
  colorMode(HSB, 360, 100, 100, 100);
  photoFilter();
}

//void draw(){
//}

void photoFilter(){
  myImg.loadPixels(); //without myImg, will load screen
  int myImgSize = myImg.width * myImg.height; //# of pixels
  for(int i = 0; i < myImgSize; i = i+5){
    color cp = myImg.pixels[i];
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness(cp);
    int y = i/myImg.width;
    int x = i%myImg.width;
    if(b > 50){ //increases contrast by 15
      b = b+20;
    } else if(b < 50){
      b = b-20;
    }
   /* if(h % 2 != 0){
      if(h < 180){ //inverts colors
        h = h+180;
      } else if(h > 180){
        h = h-180;
      } */
  myImg.pixels[i] = color(h, s, b);
  fill(h, s, b, 50);
  noStroke();
  ellipse(x, y, 7, 7);
 }
}
/*  myImg.updatePixels();
  image(myImg, 0, 0);
} */

