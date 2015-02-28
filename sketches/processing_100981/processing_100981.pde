
import java.util.ArrayList;
import java.lang.Math;
ArrayList<Resolution> res;
PFont dispFont;
float scale;

// Shows various common resolutions relative to your own (which is highlighted in yellow
// Up to zoom in, Down to zoom out, Left to zoom in a little, Right to zoom out a little


void setup() {
  size(displayWidth, displayHeight);
  background(0);
  noSmooth();
  dispFont = createFont("Segoe UI SemiBold", 48, false);
  textFont(dispFont);
  textAlign(RIGHT, BOTTOM);
  res = new ArrayList<Resolution>();
  scale = 1.0;
  
  // Add resolutions here: Resolution( <width> , <height> , <name>) from largest to smallest
  Resolution YourMom = new Resolution(12000, 12000, "YourMom");
  res.add(YourMom);
  Resolution EightK = new Resolution(7680,4320, "8K");
  res.add(EightK);
  Resolution FourK = new Resolution(3840, 2160, "4K");
  res.add(FourK);
  Resolution IBM_T220 = new Resolution(3840, 2400, "IBM T220");
  res.add(IBM_T220);
  Resolution QHD = new Resolution(2560,1440, "QHD");
  res.add(QHD);
  Resolution iPad = new Resolution(2048, 1536, "iPad");
  res.add(iPad);
  Resolution FHD = new Resolution(1920, 1080, "FHD");
  res.add(FHD);
  Resolution ThisOne = new Resolution(1280,1024,"School Monitor");
  res.add(ThisOne);
  Resolution HD = new Resolution(1280, 720, "HD");
  res.add(HD);
  Resolution iPhone = new Resolution(540, 960, "iPhone");
  res.add(iPhone);
  Resolution SVGA = new Resolution(800, 600, "SVGA");
  res.add(SVGA);
  Resolution VGA = new Resolution(640, 480, "VGA");
  res.add(VGA);
}

void draw() {
  scale(scale);
  stroke(255);
  fill(255);
  background(128);
  for (Resolution r : res) {
    r.visible = true;
    r.show();
  }
  for (Resolution r : res) {
    r.label();
  }
  //text("Your display's resolution is "+displayWidth+"x"+displayHeight, displayWidth-5, displayHeight-5);
}

class Resolution {
  int red;
  int green;
  int blue;
  int alpha;
  String myName;
  int myW;
  int myH;
  public boolean visible = false;

  Resolution(int inW, int inH) {
    myW = inW;
    myH = inH;
    myName = "";
    randColor();
  }

  Resolution(int inW, int inH, String name) {
    myW = inW;
    myH = inH;
    myName = name;
    randColor();
  }

  String getName() {
    return myName;
  }
  int getW() {
    return myW;
  }
  int getH() {
    return myH;
  }

  void show() {
    if (visible) {
      noStroke();
      fill(red,green,blue,alpha);
      rect(0, 0, myW, myH);
    }
  }
  void label(){
    if (visible) {
      fill(255);
      if (myW==displayWidth&&myH==displayHeight)
        fill(255,255, 0);
      text(myName+": "+myW+"x"+myH, myW-10, myH-5);
    }
  }
  void randColor(){
    red = (int)(Math.random()*2)*240+15;
    green = (int)(Math.random()*2)*240+15;
    blue = (int)(Math.random()*2)*240+15;
    alpha = 128;
  }
}
void keyReleased() {
  if (keyCode == UP)
    scale *= 2;
  if (keyCode == DOWN)
    scale /= 2;
  if (keyCode == LEFT)
    scale *= 1.1;
  if (keyCode == RIGHT)
    scale /= 1.1;
}


//This makes the program run in fullscreen 
boolean sketchFullScreen() {
  return true;
}



