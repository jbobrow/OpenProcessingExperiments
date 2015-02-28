
/* @pjs preload="image_test1.png,image_test2.png,image_test3.png,image_test4.png,image_test5.png"; */

PImage img;
int imageNumber = 1;
 
void setup(){
  size (1280,576);
  getAverage();
}

void draw(){
}

void getAverage(){
  img = loadImage("image_test" + imageNumber + ".png");
  long redBucket = 0;
  long greenBucket = 0;
  long blueBucket = 0;
  
  image(img, 0, 0);
  
  img.loadPixels();   
  int index = 0;
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
    
      color c = img.pixels[index];

      redBucket += red(c);
      greenBucket += green(c);
      blueBucket += blue(c);
      
      index++;      
    }
  }
  
  long redAverage = redBucket / index;
  long greenAverage = greenBucket / index;
  long blueAverage = blueBucket / index;
  color rgbAverage = color(redAverage, greenAverage, blueAverage);
  
  fill(rgbAverage);
  noStroke();
  rect (200, 200, 200, 200);
  println("Image " + imageNumber);
  println("Red = " + redAverage);
  println("Green = " + greenAverage);
  println("Blue = " + blueAverage);
  println("----------");
}

void mousePressed() {
   incrementImage();   
}

void incrementImage(){
  if  (imageNumber < 5) {
    imageNumber++;
  } 
  else {
    imageNumber = 1;
  }
  
  getAverage();
}


