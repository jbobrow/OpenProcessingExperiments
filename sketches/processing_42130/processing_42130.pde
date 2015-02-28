
int s, m, h;            //time variables  
int pSpace;           //"margin"; the individuals take up
int xmid, ymid;       //middle of width/height of screen
float cS, cM, cH;
int frame;
PImage SW, MW, HW, SM, MM, HM;
boolean swplayed=false;

int imageCount;
Animation sman, mman, hman, swoman, mwoman, hwoman, pop, robot; //each person is a set of images, an individual animation

void setup() {
  frame = 0;
  smooth();
  background(#7DF2C2);
  size(1200, 800);
  int s = second();
  int m = minute();
  int h = hour();

  xmid = width/2;
  ymid = height/2;

  //hwoman = new Animation("hwoman_", 12);
  sman = new Animation("sman_", 51);
  swoman = new Animation("swoman_", 9);


  /*mwoman = new Animation("mwoman_", 17);
   
   
   hman = new Animation("hman_", 17);
   mman = new Animation("mman_", 17);//*/


  HW = loadImage("hwoman_1.png");
  MW = loadImage("mwoman_1.png");
  HM = loadImage("hman_1.png");
  MM = loadImage("mman_1.png");
}



void draw() {
  background(#7DF2C2);
  int s = second();
  int m = minute();
  int h = hour();

  ClockParts(); //builds 60's clock body
  ClockHands(); //updates minute hand

  image(MW, 0, 0);

  swoman.displaySWoman(0, 0);
  sman.displaySMan(0, 0);
  //swoman.ReverseDisplaySWoman(0,0);

  image(HW, 0, height-507);

  image(MM, 0, 0);
  image(HM, 0, 0);
}








//FUNCTIONS---------------------------------------



void ClockParts() {    //makes static 60's clock parts
  int s = second();
  int m = minute();
  int h = hour();

  for (int i=0; i<361; i+=30) {
    pushMatrix();

    translate(xmid, ymid-200);
    rotate(radians(i));

    //clock hour spokes-----------------
    stroke(75);
    strokeWeight(2);
    line (00, 0, 0, 110);
    fill(0);
    stroke(0);
    ellipse(0, 110, 15, 15);
    //end clock spokes--------------------

    popMatrix();
  }

  //clockface, grey ellipse--------------------
  fill(225);
  stroke(175);
  strokeWeight(1);
  ellipse(xmid, ymid-200, 90, 90);
  //end clockface, grey ellipse----------------
}



void ClockHands() {      //makes, updates clock hands on 60' clock
  int s = second();
  int m = minute();
  int h = hour();

  cS = map(s, 0, 60, 0, 360);
  cM = map(m, 0, 60, 0, 360);
  cH = map(h, 0, 24, 0, 360);

  stroke(0);

  pushMatrix();
  translate(xmid, ymid-200);
  rotate(radians(cS+180));
  //hour hand--------------------
  line (0, 0, 0, 80);
  fill(0);
  ellipse(0, 60, 20, 11);
  //end hour hand--------------------
  line(0, -20, 0, 0);
  popMatrix();

  //minute Hand--------------------
  pushMatrix();
  translate(xmid, ymid-200);
  rotate(radians(cM-180));
  //line (0, 0, 0, 80);
  fill(0);
  stroke(0);
  //ellipse(0, 60, 20, 11);
  //line(0,-20,0,0);
  triangle(-5, -5, 5, -5, 0, 60);
  //end minute hand--------------------
  popMatrix();
}





// Class for animating a sequence of GIFs---------------------------------

class Animation {
  PImage[] images;
  int frame;
  int s = second();
  int m = minute();
  int h = hour();

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into desired digits. 0 means no zeroes precede number.
      String filename = imagePrefix + nf(i+1, 0) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    int s = second();
    int m = minute();
    int h = hour();

    if (frame<imageCount) {
      tint(255, 75);
      image(images[frame], xpos, ypos);
      if (frameCount % 12 == 0) {
        frame = (frame+1);
      }
    }

    if (frame==imageCount) {
      tint(255, 75);
      image(images[16], xpos, ypos);
    }
  }

  void ReverseDisplay(float xpos, float ypos) {
    if (frame>0) {
      tint(255, 75);
      image(images[frame-1], xpos, ypos);
      if (frameCount % 12 == 0) {
        frame = (frame-1);
      }
    }

    if (frame==0) {
      image(images[0], xpos, ypos);
    }
  }

  void displaySWoman(float xpos, float ypos) {
    int m = minute();
    int h = hour();
    int s = second();

    if (s>=51 && s<=60) {
      frame=abs(51-s);
    }
    else {
      frame=imageCount;
    }

    if (frame<imageCount) {
      if (s>=51) {
        image(images[frame], 100, 250);
      }
    }

    if (frame==imageCount) {
      image(images[0], 100, 250);
    }
  }

  void ReverseDisplaySWoman(float xpos, float ypos) {
    if (frame>0) {
      image(images[frame-1], xpos, height-300);
      if (frameCount % 12 == 0) {
        frame = (frame-1);
      }
    }

    if (frame==0) {
      image(images[0], xpos, height-300);
      swplayed =false;
    }
  }

  void displaySMan(float xpos, float ypos) {
    int s = second();

    if (s>10) {
      image(images[s-10], width-788, height-579);
    }
    else {
      image(images[0], width-788, height-579);
    }
  }


  int getWidth() {
    return images[0].width;
  }
}


