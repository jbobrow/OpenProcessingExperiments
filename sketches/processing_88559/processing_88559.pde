
/* @pjs preload="wave0.jpg, wave1.jpg, wave2.jpg, wave3.jpg, wave4.jpg, wave5.jpg, wave6.jpg, wave7.jpg, wave8.jpg, wave9.jpg, wave10.jpg, wave11.jpg"; */

 
int maxImages = 12; 
int imageIndex = 0;
boolean isPlaying = false;

PImage[] images = new PImage[maxImages];
 
void setup() {
  size(400,400);

  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "wave" + i + ".jpg" );
  }
  frameRate(6);
}

void draw() {
   
  background(0);
  image(images[imageIndex],0,0);

  if (keyPressed == true) {
    if (key == '1') {
      imageIndex = 1;
    }
    else if (key == '2') {
      imageIndex = 2;
    }
    else if (key == '3') {
      imageIndex = 3;
    }
    else if (key == '4') {
      imageIndex = 4;
    }
    else if (key == '5') {
      imageIndex = 5;
    }
    else if (key == '6') {
      imageIndex = 6;
    }
    else if (key == '7') {
      imageIndex = 7;
    }
    else if (key == '8') {
      imageIndex = 8;
    }
    else if (key == '9') {
      imageIndex = 9;
    }
    else if (key == '-') {
      imageIndex = 10;
    }
    else if (key == '=') {
      imageIndex = 11;
    }
    else if (key == '`') {
      imageIndex = 12;
    }
  }
   if (isPlaying == true) {
    
    // increment image index by one each cycle
    // use modulo " % "to return to 0 once the end of the array is reached
    imageIndex = (imageIndex + 1) % images.length;
  }

}

void keyReleased() {
  if (key == ' ' && isPlaying == false) {
    isPlaying = true;
  }
  else if (key == ' ' && isPlaying == true) {
    isPlaying = false;
  }
  else if (keyCode == RIGHT) {
    if (imageIndex >= 9) {
      imageIndex = 0;
    }
    else {
      imageIndex += 1;
    }
  }
  else if (keyCode == LEFT) {
    if (imageIndex <= 0) {
      imageIndex = 9;
    }
    else {
      imageIndex -= 1;
    }
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
  else if (mouseButton == RIGHT) {
    isPlaying = false;
  }
}


  
  
   



