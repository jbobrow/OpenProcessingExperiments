
/* @pjs preload = "img.jpg"; */
PImage img;
Ripple ripple;
PFont f;
String message = "You are nothing.";
 
void setup() {
  img = loadImage("img.jpg");
  size(img.width, img.height);
  f = createFont("Arial",20,true);
  ripple = new Ripple();
  frameRate(60);
}
 
void draw() {
  
  
  loadPixels();
  img.loadPixels();
  for (int loc = 0; loc < width * height; loc++) {
    pixels[loc] = ripple.col[loc];
  }
  updatePixels();
  ripple.newframe();
}
 
class Ripple {
  int i, a, b;
  int oldind, newind, mapind;
  short ripplemap[]; // the height map
  int col[]; // the actual pixels
  int riprad;
  int rwidth, rheight;
  int ttexture[];
  int ssize;
 
  Ripple() {
    // constructor
    riprad = 3;
    rwidth = width >> 1;
    rheight = height >> 1;
    ssize = width * (height + 10) * 10;
    ripplemap = new short[ssize];
    col = new int[width * height];
    ttexture = new int[width * height];
    oldind = width;
    newind = width * (height + 3);
  }
 
 
 
  void newframe() {
    // update the height map and the image
    i = oldind;
    oldind = newind;
    newind = i;
 
    i = 0;
    mapind = oldind;
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        short data = (short)((ripplemap[mapind - width] + ripplemap[mapind + width] +
          ripplemap[mapind - 1] + ripplemap[mapind + 1]) >> 1);
        data -= ripplemap[newind + i];
        data -= data >> 5;
        if (x == 0 || y == 0)
          ripplemap[newind + i] = 0;
        else
          ripplemap[newind + i] = data;
        data = (short)(1024 - data);

        a = ((x - rwidth) * data / 1024) + rwidth;
        b = ((y - rheight) * data / 1024) + rheight;
 
        //bounds check
        if (a >= width)
          a = width - 1;
        if (a < 0)
          a = 0;
        if (b >= height)
          b = height-1;
        if (b < 0)
          b=0;
 
        col[i] = img.pixels[a + (b * width)];
        mapind++;
        i++;
      }
    }
  }
}
 
 
void mouseDragged() {
  for (int j = mouseY - ripple.riprad; j < mouseY + ripple.riprad; j++) {
    for (int k = mouseX - ripple.riprad; k < mouseX + ripple.riprad; k++) {
      if (j >= 0 && j < height && k>= 0 && k < width) {
        ripple.ripplemap[ripple.oldind + (j * width) + k] += 512;
        loop();
      }
    }
  }
  
  
  
  textFont(f);         
  int x = 10;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(12,36));
    text(message.charAt(i),x,height/2);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
    loop();  
}

  
}


