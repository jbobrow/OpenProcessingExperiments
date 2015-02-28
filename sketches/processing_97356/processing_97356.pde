
private PImage img;
private int counter = 0;
private color[] pixelsOrig;

private int w = 429;
private int h = 379;

void setup() {
  size(w, h);
  if(frame != null) {
    frame.setResizable(true);
  }
  img = loadImage("hydromedusa.png");
  pixelsOrig = new color[img.pixels.length];
  arrayCopy(img.pixels, pixelsOrig);
  //noLoop();
}

void draw() {
  if(counter < 2) {
    image(img, 0, 0);
    //test1();
    //test2();
    //test3();
    //test4();
    test5();
    //test6();
  }
  else if(counter == 2) {
    PImage newImg = createImage(w, h, RGB);
    newImg = img.get();
    newImg.save("img1.png");
  }
  counter++;
}

void test1() {
  color c;
  
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      c = pixelsOrig[(img.width - x) * (img.height - y) - 1];
      //c = pixelsOrig[10000];
      img.set(x, y, c);
    }
  }
}

void test2() {
  color c;
  int j = 0;
  
  for(int i = 0; i < img.pixels.length; i++) {
    if(i < img.pixels.length / 4) {
      j = img.pixels.length - img.pixels.length / 4 + i;
    }
    else {
      j = i - img.pixels.length / 4;
    }
    c = pixelsOrig[j];
    img.pixels[i] = pixelsOrig[j];
  }
  img.updatePixels();
}

void test3() {
  color c = color(255);
  
  for(int i = 0; i < img.pixels.length / 2; i++) {
    img.set(i % img.width, int(i/img.width), c);
  }
}

void test4() {
  color c;  
  
  for(int i = 0; i < img.pixels.length; i++) {
    c = img.get(int(random(img.width)), int(random(img.height)));
    img.set(int(random(img.width)), int(random(img.height)), c);
  }
}

void test5() {
  color c;
  int x1, y1;
  
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      x1 = int(noise(x) * x);
      y1 = int(noise(y) * y);
      c = pixelsOrig[(img.width - x1) * (img.height - y1) - 1];
      img.set(x, y, c);
    }
  }
}

void test6() {
  color c;
  int ind;
  
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      // mit dem random spielen, gibt schoene effekte
      ind = int(random(30) + (x % img.width + img.width * y));
      if(ind >= pixelsOrig.length) {
        ind = ind - pixelsOrig.length;
      }
      if(ind < 0) {
        ind = 0;
      }
      c = pixelsOrig[ind];
      img.set(x, y, c);
    }
  }
}



