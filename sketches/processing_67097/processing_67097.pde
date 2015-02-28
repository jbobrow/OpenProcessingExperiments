
PImage myPhoto;
int myPhotoWidth, myPhotoHeight;

size (709, 843);
colorMode(HSB);
myPhoto = loadImage("four-colors_01.jpg");
myPhotoWidth = myPhoto.width;
myPhotoHeight = myPhoto.height;
noStroke();
smooth();
background(255);
rectMode(CENTER);

for (int i = 0; i < 4000; i++) {
  myPhoto.loadPixels();
  int x = int(random(myPhotoWidth));
  int y = int(random(myPhotoHeight));
  color myPhotoColor = myPhoto.pixels[y*width+x];
  
   fill(myPhoto.pixels[y*width + x],50);
  
    float d = random(1, 65);
    rect(x, y, d, d);
}

