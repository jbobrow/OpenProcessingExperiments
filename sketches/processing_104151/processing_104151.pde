
/* @pjs font="data/Tw Cen MT Bold.ttf"; */


HScrollbar shuffle;


PFont bold;
PFont smallBold;

boolean seattle = true;
boolean nyc = false;
boolean la = false;
boolean hongkong = false;

int demoFrames = 11;
PImage[] imgSeattle = new PImage[demoFrames];
PImage[] imgNYC = new PImage[demoFrames];
PImage[] imgLA = new PImage[demoFrames];
PImage[] imgHongKong = new PImage[demoFrames];


int int01;
int int02;
int int03;
int int04;
int int05;
int int06;
int total; 

int calc01;
int calc02;
int calc03;
int calc04;
int calc05;
int calc06;
int calc07;
int calc08;


void setup() {
  size(630, 800);
  
  bold = createFont("Tw Cen MT Bold", 16);
  smallBold = createFont("Tw Cen MT Bold",14);
  
  for (int i = 0; i < demoFrames; i++) {
    String imageName = "seattle" + nf(i, 2) + ".png";
    imgSeattle[i] = loadImage(imageName); // Load in the screenshots
  }
  
  for (int i = 0; i < demoFrames; i++) {
    String imageName = "nyc" + nf(i, 2) + ".png";
    imgNYC[i] = loadImage(imageName); // Load in the screenshots
  }
  
  for (int i = 0; i < demoFrames; i++) {
    String imageName = "la" + nf(i, 2) + ".png";
    imgLA[i] = loadImage(imageName); // Load in the screenshots
  }
  
  for (int i = 0; i < demoFrames; i++) {
    String imageName = "hongkong" + nf(i, 2) + ".png";
    imgHongKong[i] = loadImage(imageName); // Load in the screenshots
  }
  
  shuffle = new HScrollbar(375, 375, 200, 15, 1);
}

void draw() {
  background(255);
  fill(0);
  stroke(0);
  
  float slider1Pos = shuffle.getPos();
  float per1 = (slider1Pos-405.405)/(200);
  float steps1 = 10;
  float value1 = per1*steps1;
  float demoIndex = (value1);
  int demoInt = int(demoIndex);
  float demo = float(demoInt);
  float display1 = demo/20;
  
  shuffle.update();
  shuffle.display();
 
  
  textFont(bold);
  fill(0);
  text("Shuffle", 375, 360);
  text(demoInt, 375+60,360);
  
  if (seattle) {
    int01 = 41;
    int02 = 34;
    int03 = 12;
    int04 = 8;
    int05 = 3;
    int06 = 2;
    total = int01+int02+int03+int04+int05+int06;
  }
  if (nyc) {
    int01 = 32;
    int02 = 27;
    int03 = 16;
    int04 = 13;
    int05 = 7;
    int06 = 5;
    total = int01+int02+int03+int04+int05+int06;
  }
  if (la) {
    int01 = 25;
    int02 = 26;
    int03 = 16;
    int04 = 15;
    int05 = 9;
    int06 = 9;
    total = int01+int02+int03+int04+int05+int06;
  }
  if (hongkong) {
    int01 = 17;
    int02 = 25;
    int03 = 24;
    int04 = 21;
    int05 = 9;
    int06 = 4;
    total = int01+int02+int03+int04+int05+int06;
  }
 
 
  textFont(bold);
  text(int01 + "%", 40, 165+315);
  text(int02 + "%", 40, 195+315);
  text(int03 + "%", 40, 225+315);
  text(int04 + "%", 40, 255+315);
  text(int05 + "%", 40, 285+315);
  text(int06 + "%", 40, 315+315);
  text(total + "%", 40, 345+315);
  text("Number in Household", 100, 135+315);
  text("Type of Unit", 330, 135+315);
  text("1 Person", 100, 165+315);
  text("2 People", 100, 195+315);
  text("3 People", 100, 225+315);
  text("4 People", 100, 255+315);
  text("5 People", 100, 285+315);
  text("6 People", 100, 315+315);
  text("Total", 100, 345+315);
    
  fill(200);
  noStroke();
  textFont(bold);
  fill(0);
  text("STEP 1: Select Location City for different Demographic Breakdown." , 75, 410+340);
  text("STEP 2: Mouseover data to see Household Size/Unit Type Relationship." , 75, 430+340);
  text("STEP 3: Slide Shuffle Bar to randomize unit placement.", 75, 450+340);
     
  calc01 = round(3*int01/4 + 1*int02/8);
  calc02 = round(1*int01/4 + 4*int02/8);
  calc03 = round(2*int02/8 + 3*int03/8);
  calc04 = round(2*int03/8 + 3*int04/8);
  calc05 = round(1*int02/8 + 2*int03/8);
  calc06 = round(1*int03/8 + 3*int04/8);
  calc07 = round(2*int04/8 + 1*int05/2);
  calc08 = round(1*int05/2 + 1*int06/1);
    
  stroke(0);
  fill(0);
  textFont(bold);
  text(calc01 + "% Studio", 330, 165+315);
  text(calc02 + "% 1 Bed Apartment", 330, 195+315);
  text(calc03 + "% 2 Bed Apartment", 330, 225+315);
  text(calc04 + "% 3 Bed Apartment", 330, 255+315);
  text(calc05 + "% 2 Bed House", 330, 285+315);
  text(calc06 + "% 3 Bed House", 330, 315+315);
  text(calc07 + "% 4 Bed House", 330, 345+315);
  text(calc08 + "% 5 Bed House", 330, 375+315);
  
  if (seattle){
    image(imgSeattle[demoInt], 0, 0, 630, 300);
  }
  if (nyc){
    image(imgNYC[demoInt], 0, 0, 630, 300);
  }
  if (la){
    image(imgLA[demoInt],0, 0, 630, 300);
  }
  if (hongkong){
    image(imgHongKong[demoInt], 0, 0, 630, 300);
  }
  
  noStroke();
    fill(241,90,42);
    rect(550-7.5, 145+315, 15, 25);
    fill(33,107,180);
    rect(550-12.5, 175+315, 25, 25);
    fill(46,44,115);
    rect(550-17.5, 205+315, 35, 25);
    fill(238,59,127);
    rect(550-22.5, 235+315, 45, 25);
    fill(146,200,76);
    rect(550-7.5, 265+315, 15, 25);
    fill(79,196,207);
    rect(550-12.5, 295+315, 25, 25);
    fill(0,159,133);
    rect(550-10, 325+315, 20, 25);
    fill(18,159,73);
    rect(550-12.5, 355+315, 25, 25);

    stroke(0);
    fill(0);
    textFont(smallBold);
    text("1F", 585, 148+15+315);
    text("1F", 585, 178+15+315); 
    text("1F", 585, 208+15+315); 
    text("1F", 585, 238+15+315); 
    text("2F", 585, 268+15+315); 
    text("2F", 585, 298+15+315);
    text("3F", 585, 328+15+315); 
    text("3F", 585, 358+15+315);  
    textFont(bold);
    
    
    fill(200);
    noStroke();
    if(seattle==false){
      rect(50, 325, 15, 15);
    } else{
      fill(255,31,135);
      rect(50, 325, 15, 15);
      fill(200);
    }
    if(nyc==false){
      rect(175, 325, 15, 15);
    } else{
      fill(255,31,135);
      rect(175, 325, 15, 15);
      fill(200);
    }
    if(la==false){
      rect(50, 375, 15, 15);
    } else{
      fill(255,31,135);
      rect(50, 375, 15, 15);
      fill(200);
    }
    if(hongkong==false){
      rect(175, 375, 15, 15);
    } else{
      fill(255,31,135);
      rect(175, 375, 15, 15);
      fill(200);
    }
    
    fill(0);
    textFont(bold);
    text("Seattle", 75, 325+12);
    text("New York City", 200, 325+12);
    text("Los Angeles", 75, 375+12);
    text("Hong Kong", 200, 375+12);
    
    if (mouseX>50 && mouseX<65 && mouseY>325 && mouseY<340) {
      if(seattle==false){
        fill(0,158,255);
        rect(50, 325, 15, 15);
        textFont(bold);
        text(int01 + "%", 40, 165+315);
        text(int02 + "%", 40, 195+315);
        text(int03 + "%", 40, 225+315);
        text(int04 + "%", 40, 255+315);
        text(int05 + "%", 40, 285+315);
        text(int06 + "%", 40, 315+315);
        text(total + "%", 40, 345+315);
      }
    }
    if (mouseX>175 && mouseX<190 && mouseY>325 && mouseY<340) {
      if(nyc==false){
        fill(0,158,255);
        rect(175, 325, 15, 15);
        textFont(bold);
        text(int01 + "%", 40, 165+315);
        text(int02 + "%", 40, 195+315);
        text(int03 + "%", 40, 225+315);
        text(int04 + "%", 40, 255+315);
        text(int05 + "%", 40, 285+315);
        text(int06 + "%", 40, 315+315);
        text(total + "%", 40, 345+315);
      }
    }
    if (mouseX>50 && mouseX<65 && mouseY>375 && mouseY<390) {
      if(la==false){
        fill(0,158,255);
        rect(50, 375, 15, 15);
        textFont(bold);
        text(int01 + "%", 40, 165+315);
        text(int02 + "%", 40, 195+315);
        text(int03 + "%", 40, 225+315);
        text(int04 + "%", 40, 255+315);
        text(int05 + "%", 40, 285+315);
        text(int06 + "%", 40, 315+315);
        text(total + "%", 40, 345+315);
      }
    }
    if (mouseX>175 && mouseX<190 && mouseY>375 && mouseY<390) {
      if(hongkong==false){
        fill(0,158,255);
        rect(175, 375, 15, 15);
        textFont(bold);
        text(int01 + "%", 40, 165+315);
        text(int02 + "%", 40, 195+315);
        text(int03 + "%", 40, 225+315);
        text(int04 + "%", 40, 255+315);
        text(int05 + "%", 40, 285+315);
        text(int06 + "%", 40, 315+315);
        text(total + "%", 40, 345+315);
      }
    }
    
    
    
    
    
    if (mouseX>35 && mouseX<180 && mouseY>460 && mouseY<490) {
      textFont(bold);
      fill(0,158,255);
      text(int01 + "%", 40, 165+315);
      text("1 Person", 100, 165+315);
      text(calc01 + "% Studio", 330, 165+315);
      text(calc02 + "% 1 Bed Apartment", 330, 195+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,165+310,320,165+310);
      line(170,165+310,320,195+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>460 && mouseY<490) {
      textFont(bold);
      fill(0,158,255);
      text(calc01 + "% Studio", 330, 165+315);
      text(int01 + "%", 40, 165+315);
      text("1 Person", 100, 165+315);
      text(int02 + "%", 40, 195+315);
      text("2 People", 100, 195+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,165+310,320,165+310);
      line(170,195+310,320,165+310);
    }
    
    if (mouseX>35 && mouseX<180 && mouseY>490 && mouseY<520) {
      textFont(bold);
      fill(0,158,255);
      text(int02 + "%", 40, 195+315);
      text("2 People", 100, 195+315);
      text(calc01 + "% Studio", 330, 165+315);
      text(calc02 + "% 1 Bed Apartment", 330, 195+315);
      text(calc03 + "% 2 Bed Apartment", 330, 225+315);
      text(calc05 + "% 2 Bed House", 330, 285+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,195+310,320,165+310);
      line(170,195+310,320,195+310);
      line(170,195+310,320,225+310);
      line(170,195+310,320,285+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>490 && mouseY<520) {
      textFont(bold);
      fill(0,158,255);
      text(calc02 + "% 1 Bed Apartment", 330, 195+315);
      text(int01 + "%", 40, 165+315);
      text("1 Person", 100, 165+315);
      text(int02 + "%", 40, 195+315);
      text("2 People", 100, 195+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,165+310,320,195+310);
      line(170,195+310,320,195+310);
    }
    
    if (mouseX>35 && mouseX<180 && mouseY>520 && mouseY<550) {
      textFont(bold);
      fill(0,158,255);
      text(int03 + "%", 40, 225+315);
      text("3 People", 100, 225+315);
      text(calc03 + "% 2 Bed Apartment", 330, 225+315);
      text(calc04 + "% 3 Bed Apartment", 330, 255+315);
      text(calc05 + "% 2 Bed House", 330, 285+315);
      text(calc06 + "% 3 Bed House", 330, 315+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,225+310,320,225+310);
      line(170,225+310,320,255+310);
      line(170,225+310,320,285+310);
      line(170,225+310,320,315+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>520 && mouseY<550) {
      textFont(bold);
      fill(0,158,255);
      text(calc03 + "% 2 Bed Apartment", 330, 225+315);
      text(int02 + "%", 40, 195+315);
      text("2 People", 100, 195+315);
      text(int03 + "%", 40, 225+315);
      text("3 People", 100, 225+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,195+310,320,225+310);
      line(170,225+310,320,225+310);
    }
    
    if (mouseX>35 && mouseX<180 && mouseY>550 && mouseY<580) {
      textFont(bold);
      fill(0,158,255);
      text(int04 + "%", 40, 255+315);
      text("4 People", 100, 255+315);
      text(calc04 + "% 3 Bed Apartment", 330, 255+315);
      text(calc06 + "% 3 Bed House", 330, 315+315);
      text(calc07 + "% 4 Bed House", 330, 345+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,255+310,320,255+310);
      line(170,255+310,320,315+310);
      line(170,255+310,320,345+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>550 && mouseY<580) {
      textFont(bold);
      fill(0,158,255);
      text(calc04 + "% 3 Bed Apartment", 330, 255+315);
      text(int03 + "%", 40, 225+315);
      text("3 People", 100, 225+315);
      text(int04 + "%", 40, 255+315);
      text("4 People", 100, 255+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,225+310,320,255+310);
      line(170,255+310,320,255+310);
    }
    
    if (mouseX>35 && mouseX<180 && mouseY>580 && mouseY<610) {
      textFont(bold);
      fill(0,158,255);
      text(int05 + "%", 40, 285+315);
      text("5 People", 100, 285+315);
      text(calc07 + "% 4 Bed House", 330, 345+315);
      text(calc08 + "% 5 Bed House", 330, 375+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,285+310,320,345+310);
      line(170,285+310,320,375+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>580 && mouseY<610) {
      textFont(bold);
      fill(0,158,255);
      text(calc05 + "% 2 Bed House", 330, 285+315);
      text(int02 + "%", 40, 195+315);
      text("2 People", 100, 195+315);
      text(int03 + "%", 40, 225+315);
      text("3 People", 100, 225+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,195+310,320,285+310);
      line(170,225+310,320,285+310);
    }
    
    if (mouseX>35 && mouseX<180 && mouseY>610 && mouseY<640) {
      textFont(bold);
      fill(0,158,255);
      text(int06 + "%", 40, 315+315);
      text("6 People", 100, 315+315);
      text(calc08 + "% 5 Bed House", 330, 375+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,315+310,320,375+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>610 && mouseY<640) {
      textFont(bold);
      fill(0,158,255);
      text(calc06 + "% 3 Bed House", 330, 315+315);
      text(int03 + "%", 40, 225+315);
      text("3 People", 100, 225+315);
      text(int04 + "%", 40, 255+315);
      text("4 People", 100, 255+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,225+310,320,315+310);
      line(170,255+310,320,315+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>640 && mouseY<670) {
      textFont(bold);
      fill(0,158,255);
      text(calc07 + "% 4 Bed House", 330, 345+315);
      text(int05 + "%", 40, 285+315);
      text("5 People", 100, 285+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,285+310,320,345+310);
    }
    if (mouseX>325 && mouseX<610 && mouseY>670 && mouseY<700) {
      textFont(bold);
      fill(0,158,255);
      text(calc08 + "% 5 Bed House", 330, 375+315);
      text(int05 + "%", 40, 285+315);
      text("5 People", 100, 285+315);
      text(int06 + "%", 40, 315+315);
      text("6 People", 100, 315+315);
      stroke(0,158,255);
      strokeWeight(2);
      line(170,285+310,320,375+310);
      line(170,315+310,320,375+310);
    }
    
   
}

void mouseClicked() {
  if (mouseX>50 && mouseX<65 && mouseY>325 && mouseY<340) {
      seattle=true;
      nyc=false;
      la=false;
      hongkong=false;
  }
  if (mouseX>175 && mouseX<190 && mouseY>325 && mouseY<340) {
      seattle=false;
      nyc=true;
      la=false;
      hongkong=false;
  }
  if (mouseX>50 && mouseX<65 && mouseY>375 && mouseY<390) {
      seattle=false;
      nyc=false;
      la=true;
      hongkong=false;
  }
  if (mouseX>175 && mouseX<190 && mouseY>375 && mouseY<390) {
      seattle=false;
      nyc=false;
      la=false;
      hongkong=true;
  }
  
  
}


class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 1;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(200);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 158, 255);
    } else {
      fill(100, 100, 100);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
  
  




