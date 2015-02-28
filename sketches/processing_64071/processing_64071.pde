
PImage img_01, img_02, img_03, img_04, img_05, img_06, img_07, img_08, img_09, img_010, img_10, img_11, img_12;
int count;

void setup() {
  smooth();
  size(528, 800);
  colorMode(HSB, 360, 100, 100);

  imageMode(CENTER);
  // change this vaule to change the speed of animation
  frameRate(3);
  img_01 = loadImage("img_01.jpg");
  img_02 = loadImage("img_02.png");
  img_03 = loadImage("img_03.png");
  img_04 = loadImage("img_04.png");
  img_05 = loadImage("img_05.png");
  img_06 = loadImage("img_06.png");
  img_07 = loadImage("img_07.png");
  img_08 = loadImage("img_08.png");
  img_09 = loadImage("img_09.png");
  img_10 = loadImage("img_10.png");
  img_11 = loadImage("img_11.png");
  img_12 = loadImage("img_12.png");
}

void draw() {
  background(255);

  image(img_01, width/2, height/2);
  /*
  A conditional statement to keep track of time
   Think of this as the timeline and keyframe in
   Aftereffects, now the count is updating itself
   by adding one everyframe, the speed of animation
   can be adjusted by changing the frameRate in setup()  
   */

  if (count > frameRate && count < frameRate*2) {      // this line of code is saying between second 1 and 2, I want to display this image
    image(img_02, width/2, height/2);
  }
  if (count > frameRate*2 && count < frameRate*3) {    // this line of code is saying between second 2 and 3, I want to display this image
    image(img_03, width/2, height/2);
  }
  if (count > frameRate*3 && count < frameRate*4) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_04, width/2, height/2);
  }
  if (count > frameRate*4 && count < frameRate*5) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_05, width/2, height/2);
  }
  if (count > frameRate*5 && count < frameRate*6) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_06, width/2, height/2);
  }
  if (count > frameRate*6 && count < frameRate*7) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_07, width/2, height/2);
  }
  if (count > frameRate*7 && count < frameRate*8) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_08, width/2, height/2);
  }
  if (count > frameRate*8 && count < frameRate*9) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_09, width/2, height/2);
  }
  if (count > frameRate*9 && count < frameRate*10) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_10, width/2, height/2);
  }
  if (count > frameRate*10 && count < frameRate*11) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_11, width/2, height/2);
  }
  if (count > frameRate*11 && count < frameRate*12) {    // this line of code is saying between second 3 and 4, I want to display this image
    image(img_12, width/2, height/2);
  }
  /*
  if you choose to extend the program, consider adding the
   similar structure above and change some numbers in the conditional
   statmet
   
   if( count > frameRate*4 && count < frameRate*5){
   // display a different image
   }
   
   */



  // a variable that will update itself by adding one every frame
  count++;
}


