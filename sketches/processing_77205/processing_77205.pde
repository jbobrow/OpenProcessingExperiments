
PImage img;

void setup() {

  img = loadImage("whfio_okladka.JPG");
  PFont czcionka = 
    loadFont("HelveticaNeue-Medium-48.vlw");
  textFont(czcionka);
  frameRate(8);
  smooth();
  size(500, 500);

  strokeCap(SQUARE);
}

void draw() {
  image(img, 0, 0);
  tint(255, 155);

  int r=255, g=255, b=255;
  float rand = random(6);
  int r2=255, g2=255, b2=255;
  float rand2 = random(7);


  if (keyPressed) {
    if (key =='q') {
      int losowyKolor = int(rand);

      if (losowyKolor ==1) {
        r = 0;
        g= 191;
        b=255;
      }
      else if (losowyKolor==2) {
        r = 0;
        g= 250;
        b=154;
      }
      else if (losowyKolor==3) {
        r =224;
        g= 255;
        b=255;
      }
      else {
        r= 123;
        g= 104;
        b= 238;
      }
    }
  }


  ///drugi blok linii

  if (keyPressed) {
    if (key =='q') {
      int losowyKolor2 = int(rand2);

      if (losowyKolor2 ==1) {
        r2 = 0;
        g2= 191;
        b2=255;
      }
      else if (losowyKolor2==2) {
        r2 = 0;
        g2= 250;
        b2=154;
      }
      else if (losowyKolor2==3) {
        r2 =224;
        g2= 255;
        b2=255;
      }
      else {
        r2= 199;
        g2= 21;
        b2= 133;
      }
    }
  }

  for (int i= 5; i<=(height - 5); i+=5) {

    strokeWeight(2);
    stroke(r, g, b, 255-i);
    line (0, -10+i, width, -10+i);
    stroke(3);
    stroke(r2, g2, b2, 255-i);
    line(0, (height+10-i), width, (height+10-i));
  }







  float rand3 = random (50);
  int losowyText = int(rand3);

  if (keyPressed) {
    if (key =='q') {

      if (losowyText==0) {

        text("WE", width/3, height/3, width, height);
        fill(255);
      }

      else if (losowyText == 1) {

        text("HAVE", width/5, height/5, width, height);
        fill(   152, 251, 152, 150);
      }
      else if (losowyText==2) {
        text("FOUND", width/2, height/2, width, height);
      }
      else if (losowyText ==3) {
        text("IT", width/2, height/2, width, height);
        fill(   245, 255, 250, 170);
      }

      else if (losowyText==4) {
        text("OURSELVES", width/8, height/8, width, height);
      }
      else if (losowyText==5 ) {
        text("KORÉ", width/2, height-100, width, height);
        fill(   0, 206, 209, 190);
      }

      //fill(255);
    }
  }
}



