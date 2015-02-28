
HScrollbar hs1, hs2, hs3, hs4;

PImage top, bottom, middletop, middlebottom, back;       
int topWidth, bottomWidth, middletopWidth, middlebottomWidth;  // The width of the top and bottom images


void setup()
{
  size(600, 600);
  noStroke();
  back = loadImage("Image5.png");
  hs1 = new HScrollbar(0, 20, width, 10, 3*5+1);
  hs2 = new HScrollbar(0, height-20, width, 10, 3*5+1);
  hs3 = new HScrollbar(0, 50, width, 10, 3*5+1);
  hs4 = new HScrollbar(0, height-50, width, 10, 3*5+1);
  top = loadImage("Image1.png");
  topWidth = top.width;
  bottom = loadImage("Image4.png");
  bottomWidth = bottom.width;
  middletop = loadImage("Image7.png");
  middletopWidth = middletop.width;
  middlebottom = loadImage("Image8.png");
  middlebottomWidth = middlebottom.width;
}

void draw()
{
  background(255);
  image(back,0,0);
  
  // Get the position of the top scrollbar
  // and convert to a value to display the top image 
  float topPos = hs1.getPos()-width/2;
  fill(255);
  image(top, width/2-topWidth/2 + topPos*2, 0);
  
   // Get the position of the bottom scrollbar
  // and convert to a value to display the bottom image
  float middletopPos = hs3.getPos()-width/2;
  fill(255);
  image(middletop, width/2-middletopWidth/2 + middletopPos*2, 150);
 
  // Get the position of the bottom scrollbar
  // and convert to a value to display the bottom image
  float middlebottomPos = hs4.getPos()-width/2;
  fill(255);
  image(middlebottom, width/2-middlebottomWidth/2 + middlebottomPos*2, height/2);
   
  // Get the position of the bottom scrollbar
  // and convert to a value to display the bottom image
  float bottomPos = hs2.getPos()-width/2;
  fill(255);
  image(bottom, width/2-bottomWidth/2 + bottomPos*2, height/2+150);
    
  hs1.update();
  hs2.update();
  hs3.update();
  hs4.update();
  hs1.display();
  hs2.display();
  hs3.display();
  hs4.display();
 
}


class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;  // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
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
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  
  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255,100);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(155, 80, 20);
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
}


