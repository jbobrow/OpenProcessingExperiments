
// This sketch builds on a prior work, "PAINTING PROGRAMMING", created by Melissa Harris. I just thought that you might like this.
// http://studio.sketchpad.cc/sp/pad/view/ro.9gt6Y-9tjIJt$/rev.889

HScrollbar hs1;//width
HScrollbar hs2;//transparent

int y = 30;
int x = 45;

PGraphics colorchooser;
color current;

void setup () {
    colorchoosersetup();
    current = color(0);
    smooth();
    size (500,500);
    stroke(current);
    background (255);
    image(colorchooser,0,0);
    hs1 = new HScrollbar(0, 110+5, 110, 10, 1,"width");//width
    hs2 = new HScrollbar(0,120+5,110,10,1,"opacity");//transparent
    fill(100);
     noStroke();
    rect(390,0,110,110);
    
   copy(0,0,width,height,500-105,5,100,100);
    noFill();
    
    strokeWeight(hs1.getPos());
    
}

boolean colorchoosermouse(boolean setcolors) {
    if (5<=mouseX && mouseX<=105 && 5<=mouseY && mouseY<=105)
    {
        if (setcolors)
        {
        current = colorchooser.get(mouseX,100-mouseY);
        }
        return true;
    } else
    {
    return false;
    }
}
void colorchoosersetup() {
    
    colorchooser = createGraphics(110,110,P3D);
    
    colorchooser.beginDraw();
    colorchooser.noStroke();
    colorchooser.background(100);
    
    colorchooser.colorMode(HSB, 100);

    for(int i=0; i<=100; i++) {

      for(int j=0; j<=100; j++) {
        colorchooser.saturation(j);
        colorchooser.stroke(i, j*2, (100-j)*2);

        colorchooser.point(i+5, j+5);
        
      }

    }

    colorchooser.endDraw();
}


void mousePressed()
{
    
    //check to see if the mouse clicked in the color change box
    if(!colorchoosermouse(true))
    {
    
    
    //draw the lines
    
    strokeJoin(ROUND);
    Vertex(mouseX,mouseY);
    }
    if (hs1.overEvent())
    {
      hs1.locked = true;
      hs1.update();}
    if (hs2.overEvent()){hs2.locked = true;hs2.update();}
    fill(100);
     noStroke();
    rect(390,0,110,110);
    
   copy(0,0,width,height,500-105,5,100,100);
    noFill();
    
    strokeWeight(hs1.getPos());
}

void mouseReleased()
{
    hs1.locked =false;
    hs2.locked = false;
    fill(100);
     noStroke();
    rect(390,0,110,110);
    
   copy(0,0,width,height,500-105,5,100,100);
    noFill();
    
    strokeWeight(hs1.getPos());
    Vertex(mouseX,mouseY);
    endShape();   
    //fill(current);
    strokeWeight(0);
    beginShape();    
    curveDetail(5);
        fill(100);
     noStroke();
    rect(390,0,110,110);
    
   copy(0,0,width,height,500-105,5,100,100);
    noFill();
    
    strokeWeight(hs1.getPos());
}
void draw () {
      hs1.display();
    hs2.display();
    if(hs1.locked && mousePressed)
    {
     hs1.update(); return;
    }
    if (hs2.locked && mousePressed)
    {hs2.update();return;}
    if(mousePressed && !colorchoosermouse(false) && !hs1.overEvent() && !hs2.overEvent()) {
        noStroke();
        fill(current,hs2.getPos());
        strokeWeight(0);
        noFill();
        stroke(current,hs2.getPos());
        strokeWeight(hs1.getPos());
        Vertex(mouseX,mouseY);
        vertex(mouseX,mouseY);
        endShape();
           
    }
    if(keyPressed) {
        if(key=='p') {
            current = color(150,0,100,2);
        }
    }
    if(keyPressed) {
        if(key=='g') {
            current =  color(40,200,0,2);

        }
    }
    if(keyPressed) {
        if(key=='r') {
            current =  color(200,20,100,2);
        }
    }
    if(keyPressed) {
        if(key=='o') {
            current =  color(250,130,0,2);
        }
    }
    if(keyPressed) {
        if(key=='y') {
            current =  color(200,200,0,2);
        }
    }

    image(colorchooser,0,0);

}


class ColorPicker
{
  int swidth, sheight;    // width and height of bar
  float xpos,ypos;        // x and y position of bar
  color scurrentcolor;    
  ColorPicker(float xp, float yp, int sw, int sh)
  {
    swidth = sw;
    swidth = sh;
    xpos = xp;
    ypos = yp;
    scurrentcolor = color(0);
  }
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
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
  String _Name;

  HScrollbar (float xp, float yp, int sw, int sh, int l,String n) {
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
    _Name = n;
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
      //  fill(255,0,0);
    
    //textMode(SCREEN);
    //text(_Name+" : "+round(spos*ratio),xpos,(ypos+swidth)-1);
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
      fill(0, 0, 0,255);
    } else {
      fill(102, 102, 102,255);
    }
    rect(spos, ypos, sheight, sheight);
    fill(255,0,0);
    textMode(SCREEN);
    text(_Name+" : "+round(spos*ratio),xpos,(ypos+sheight)-1);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
