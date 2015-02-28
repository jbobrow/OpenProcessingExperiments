

PFont F; 
float f1, f2;

HSlider hs1;
HSlider hs2;
HSlider hs3;
HSlider hs4;
HSlider hs5;
HSlider hs6;

Round3ColorDial dial1;
Round3ColorDial[] dials = new Round3ColorDial[4];

void setup(){
  size(800,800);
  smooth();
  background(180);
  
  F = loadFont("AngsanaNew-24.vlw");

  hs1 = new HSlider(0, 10, width/2, 16, 2);
  hs1.SetMapValues(0, 100);
  
  hs2 = new HSlider(0, 30, width/2, 16, 2);
  hs2.SetMapValues(50, 300);
  
  hs3 = new HSlider(0, 50, width/2, 16, 2);
  hs3.SetMapValues(.1, 0.9);
  
  hs4 = new HSlider(0, 70, width/2, 16, 2);
  hs4.SetMapValues(0, 100);
  
  hs5 = new HSlider(0, 90, width/2, 16, 2);
  hs5.SetMapValues(0, 100);
  
  hs6 = new HSlider(0, 110, width/2, 16, 2);
  hs6.SetMapValues(1, 50);


  dial1 = new Round3ColorDial(width/4, height/2+50, 200);
  
  for (int i = 0; i < 4; i++)
  {
    dials[i] = new Round3ColorDial(width/4*3+40, i*(height/4)+120, 160);
    dials[i].setLoose(i*10+10);
  }
}

void draw()
{
 background(180);
 
  textFont(F, 32);
 
  float Pos = hs1.getPos();
  hs1.update();
  hs1.display();
  text("Pos", width/2 + 10, 18);
  text(Pos, width/2 + 50, 18);
  
  float size = hs2.getPos();
  hs2.update();
  hs2.display();
  text("size", width/2 + 10, 38);
  text(size, width/2 + 50, 38);
  dial1.reSize(size);
  
  float Ratio = hs3.getPos();
  hs3.update();
  hs3.display();
  text("Ratio", width/2 + 10, 58);
  text(Ratio, width/2 + 50, 58);
  dial1.innerDialRatio = Ratio;
  
  float b1 = hs4.getPos();
  hs4.update();
  hs4.display();
  text("b1", width/2 + 10, 78);
  text(b1, width/2 + 50, 78);
  dial1.setB1(b1);
  
  float b2 = hs5.getPos();
  hs5.update();
  hs5.display();
  text("b2", width/2 + 10, 98);
  text(b2, width/2 + 50, 98);
  dial1.setB2(b2);
  
  float loos = hs6.getPos();
  hs6.update();
  hs6.display();
  text("loos", width/2 + 10, 118);
  text(loos, width/2 + 50, 118);
  dial1.setLoose(loos);

  //dial2.update(Pos);
  //dial2.display();
  
  dial1.update(Pos);
  dial1.display();
  
  
  for (int i = 0; i < 4; i++)
  {
    dials[i].update(Pos);
    dials[i].display();
  }
}

void mousePressed() {
  hs1.checkMousePress();
  hs2.checkMousePress();
  hs3.checkMousePress();
  hs4.checkMousePress();
  hs5.checkMousePress();
  hs6.checkMousePress();
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  
  hs1.checkMouseWheel(e);
  hs2.checkMouseWheel(e);
  hs3.checkMouseWheel(e);
  hs4.checkMouseWheel(e);
  hs5.checkMouseWheel(e);
  hs6.checkMouseWheel(e);
  
  
  println(e);
}





class HSlider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  
  float minMapped, maxMapped;

  HSlider (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / ((float)widthtoheight + sheight);
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    
    minMapped = sposMin;
    maxMapped = sposMax;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    //if (mousePressed && over) {
    //  locked = true;
    //}
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
  
  void checkMousePress() {
    if (overEvent()) {
      locked = true;
    }
  }
  
  void checkMouseWheel (float val)
  {
    if (overEvent()) {
      newspos += val;
    }
    
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
  
  void SetMapValues(float Min, float Max)
  {
    minMapped = Min;
    maxMapped = Max;
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
    return map(spos * ratio, sposMin, sposMax, minMapped, maxMapped);
    //return spos * ratio;
  }
}

class Round3ColorDial
{
  //////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////
  float dialSize; // Main dial size
  float innerDialRatio;

  float centerEllipseDiameter;

  float dialStart = 150;
  float dialStop  = 390;

  float c = lerp(dialStart, dialStop, .3);
  float d = lerp(dialStart, dialStop, .7);

  float angle, newAngle;

  int xPos, yPos;
  
  int midColorIndexShift;

  float loose = 8;              // how loose/heavy
  //                                      Red      Yellow   Green
  //color[] dialColors = {#190003, #C9DFB7, #FF351B, #E8D819, #33D12E };
  color[] dialColors2 = {#190003, #C9DFB7, #D86851, #EECE52, #99BB5E };
  color[] palette = dialColors2;

  float randX, randY, devNumber;

  //////////////////////////////////////////////////////////////
  //////Constructor/////////////////////////////////////////////
  Round3ColorDial(int xp, int yp, float size)
  {
    xPos = xp;
    yPos = yp;

    dialSize = size;

    innerDialRatio = 0.6;

    centerEllipseDiameter = lerp(0, dialSize, innerDialRatio);
  }
  
  //////////////////////////////////////////////////////////////
  void setLoose(float l)
  {
    loose = l;    
  }
  
  //////////////////////////////////////////////////////////////
  void reSize(float newsize)
  {
    dialSize = newsize;
    centerEllipseDiameter = lerp(0, dialSize, innerDialRatio);
  }
  
  //////////////////////////////////////////////////////////////
  void setB1(float b1)
  {
    b1 /= 100;
    b1 = lerp(dialStart, dialStop, b1);
    if (b1 >= d) b1 = d-4;
    c = b1;
  }
  
  //////////////////////////////////////////////////////////////
  void setB2(float b2)
  {
    b2 /= 100;
    b2 = lerp(dialStart, dialStop, b2);
    if (b2 <= c) b2 = c+4;

     d = b2; 
  }

  //////////////////////////////////////////////////////////////
  void update(float newVal)
  {
    newAngle = map(newVal, 0, 100, dialStart, dialStop);
    angle = angle + (newAngle-angle)/loose;
    
    if      (angle < c) midColorIndexShift = 0;
    else if (angle < d) midColorIndexShift = 1;
    else                midColorIndexShift = 2;
  }
  
  //////////////////////////////////////////////////////////////
  void display()
  {
//    devNumber = angle/300;
//    randX = random(-devNumber, devNumber); 
//    randY = random(-devNumber, devNumber);
//    
    randX = 0;
    randY = 0;
    pushMatrix();
    translate(xPos + randX, yPos + randY);

    //Delet old dial
    noStroke();
    fill(180);
    ellipse(0,0,dialSize,dialSize);

    // Red area
    fill(palette[2]);
    arc(0,0,dialSize,dialSize,radians(dialStart),radians(c));
 
    // Yellow area
    fill(palette[3]);
    arc(0,0,dialSize,dialSize,radians(c),radians(d));
     
    // Green area
    fill(palette[4]);
    arc(0,0,dialSize,dialSize,radians(d),radians(dialStop));
     
    ellipseMode(CENTER);
    // Draw the middle band
    stroke(palette[0]);
    strokeWeight(1);
    fill(palette[1]);
    ellipse(0,0,centerEllipseDiameter,centerEllipseDiameter);

    //Draw the cnter circuli
    fill(palette[2 + midColorIndexShift]);
    ellipse(0,0,centerEllipseDiameter-10,centerEllipseDiameter-10);
      
    // Draw the niddle 
    stroke(palette[0]);
    strokeWeight(1);
    fill(palette[1]);
    rotate(radians(angle+90));
    triangle(-10, -centerEllipseDiameter/1.98, 10, -centerEllipseDiameter/1.98, 0, -dialSize/2.2);
    //rotate(radians(-angle));
    popMatrix();
  }

}


