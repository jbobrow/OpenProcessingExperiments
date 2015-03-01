
HScrollbar hs1, hs2, hs3, hs4; //  scrollbars

float diameter;
float diameter2;
float colour = 0;
float angle = 0;
float angle2 = 0;
float slider3 = random(5,150);
float slider4 = random(5,150);
float rand1 = random(5,150);
float rand2 = random(5,150);
float randcolour = random(20,255);
float colourspeed = random(-3,3);


void setup() {
 
  size(1000, 600);
  diameter = 290;
  diameter2= 141;

  hs1 = new HScrollbar(width/2 +40, 20, width/2-80, 20, 1);
  hs2 = new HScrollbar(width/2 +40, 60, width/2-80, 20, 1);
  hs3 = new HScrollbar(width/2 +40, 100, width/2-80, 20, 1);
  hs4 = new HScrollbar(width/2 +40, 140, width/2-80, 20, 1);
  hs1.update();
  hs2.update();
  hs1.display();
  hs2.display();
  //frameRate(30);
  //blendMode(MULTIPLY);
  colorMode(HSB);
  smooth(8);
  background(0);
  noStroke();
 
}

void draw() {
  
  tint(0,10);
  //float sin = (sin(angle); 
  colourspeed = (hs1.getPos()-width/2 -67)/50;
  
  //float angle = (hs3.getPos()-width/2 -30)/3;
  //float angle2 = (hs4.getPos()-width/2 -30)/3;
  float slider3 = (hs3.getPos()-width/2 -30)/3;
  float slider4 = (hs4.getPos()-width/2 -30)/3;
  float circlesize = (hs2.getPos()-width/2 -30)/3;
  float coloursin = (sin(angle*1) * 10 + 55);
  float colourrand = (sin(angle) * randcolour + randcolour);
  float sinw = (sin(angle) * diameter/2) + height/2;
  float sinh = (sin(angle + PI/2) * diameter/2) + height/2;
  float sinw2 = (sin(angle2) * diameter2/2);
  float sinh2 = (sin(angle2 + PI/2) * diameter2/2);
 
   //fill(255, 204);  //white
   fill(colour,255,255);
   ellipse(sinh - sinh2 , sinw + sinw2, circlesize, circlesize);
 //}

colour += colourspeed;

  angle2 += PI/slider3;
  angle += PI/slider4;
 
  if(colour > 255)
{
  colour = 0;
}
  if(colour < 0)
{
  colour = 255;
}
  hs1.display();
  hs2.display();
  hs3.display();
  hs4.display();
  hs1.update();
  hs2.update();
  hs3.update();
  hs4.update();
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
    ypos = yp;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
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
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
//}
 
 //void mousePressed() {
        // background(0);
//rand1 = random(-150,150);
//rand2 = random(-150,150);
//randcolour = random(20,255);
//colourspeed = random(1,4);
   

 }
 
