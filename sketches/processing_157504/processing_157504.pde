
HScrollbar hs1, hs2, hs3;  // Two scrollbars

PFont myFont;
float w, h;
float clockTime; // 24 hours
float sleepTime; // 0 - 10 hours
float busy; // 5,,, 0-2 small, 2-3 medium, 3-5 big
float circleX, circleY;
float diam;
Boolean pressed=false;
boolean bt = true;
PImage img1, img2, img3, img4, img5;
float x;
float y;
int button=0;
int flex=1;

void setup() {
 size(800, 600);
   //size(displayWidth, displayHeight);
  noStroke();


  //font
  myFont = createFont("Avenir-Blackw", 48);
  textFont(myFont);
  img1 = loadImage("cup.png");
  img2 = loadImage("nap.png");
  img3 = loadImage("dont.png");
  img4 = loadImage("sleep_re.png");
  img5 = loadImage("coffee.png");

  // scrollbar(x position, y position, bar width, bar height, speed)
  hs1 = new HScrollbar(width/2, height/2-55, width/2-40, 16, 15);
  hs2 = new HScrollbar(width/2, height/2+8, width/2-40, 16, 8);
  hs3 = new HScrollbar(width/2, height/2+69, width/2-40, 16, 8);
  //  textAlign(CENTER, CENTER);
  w = width/2+50;
  h= height/2+120;
}
void draw() {
  background(#0a2e42);
  fill(255);
  clockTime = hs1.getResult()*24;
  sleepTime = hs2.getResult()*11;
  busy = hs3.getResult()*6;

  //Sky day&night
  if (clockTime> 5 && clockTime<18) {
    //    for (int i=30; i<80; i=i+5) {
    //      for ( int j=0; j<80; j=j+5) {
    //        stroke(255);
    //        point (i, j);
    //    color currColor = #b4def3;
    //    currColor = #b4def3;
    //    currColor = lerpColor(#0a2e42, #b4def3, 8.0);
    //    fill(currColor);
    //    rect(0, 0, width, height);
    background(#b4def3);
  }
  //    }
  //  }

  println (mouseX, mouseY);
// Smoke
      if (pressed==true) {
        float time = millis()/5;
        float sine = sin(time/90);
        circleX = map (sine, 1, -1, 100, 300);
        circleY-=6;
        if (circleY < 0) {
          circleY = 200;
        }
        diam = random(1, 50);
        if (frameCount %1 == 0) {

          ellipse(circleX, circleY, diam, diam);
          //println ("x:" + circleX + " y:" + circleY);
        }
      }
  //Button
  fill(#6c9ab2);
  ellipse (w, h, 55, 55);
  
  //Pattern
  int w=0;
  if (pressed==true) {
  for (int i=1; i<width/2; i+=50) {
    for (int j=1; j<height/3; j+=15) {
      w+=1;
      fill(255, 1);
      stroke(255, 25);
      if (bt) {
        x=cos(millis())*20;
        y=mouseY;
      }
      if (w % 3==0) {
        ellipse(i*2+40, j*2+50, abs(flex*(x-100)), abs(flex*(y-100)));
      } else {
        ellipse(i*2+40, j*2+50, abs(flex*(y-100)), abs(flex*(x-100)));
      }
    }
  }
  }
  //fill(255, 10);
  //rect(50, 0, 300, height);

  //Cup
  noStroke();
  fill(255);
  image(img1, 120+ 50, 240);
  rect(110, 220, 180, 210);
  ellipse(200, 220, 180, 30);
  ellipse(200, 430, 180, 30);
  //result button

  fill(#6c9ab2);

  // Text display
  textSize(18);
  text("What time is it ? - " + (int)clockTime + " : 00", width/2, 220 );
  text("How much time do you have ? - " + (int)sleepTime + " hr.", width/2, 280 );
  text("Are you busy ? - " + (int)busy, width/2, 340 );

  textSize(30);
  if (pressed==true) {
    if (true) {
      textSize(13);
      text("RETRY", width/2+30, 466 );
    }
      if (sleepTime >= 4 && sleepTime <= 19 && busy<=3  && clockTime>= 20) {
      //    background(0,0,200);
      fill(0);
      image(img4, 120+ 5, 230);//just sleep
    } else if (sleepTime >= 4 && busy<3 && clockTime <= 4 && clockTime>= 20) {
      //    background(0,0,200);
      fill(0);
      image(img2, 120+ 3, 230);//coffee
    } else  if (sleepTime <= 4 && clockTime>2  && busy>3) {
      
      //    background(0,0,200);
      fill(0);
      image(img2, 120+ 3, 220);//nap
      //println("this is happening!");
    } else  if (sleepTime >= 4 && sleepTime<= 18 && busy>=4 && clockTime <= 18) {
      //    background(0,0,200);
      fill(0);
      image(img3, 120+ 1, 237);// dont sleep
    } else { // coffee
      image(img5, 120+ 3, 230);
    }
  }

  //  print( " clockTime " + clockTime);
  //println( " , something else");

  hs1.update();
  hs2.update();
  hs3.update();
  hs1.display();
  hs2.display();
  hs3.display();
}

void mouseReleased() {
  if (pressed==false) {

    float distance = dist(w, h, mouseX, mouseY);
    if (distance < 28) {
      pressed=true;
      button=255;
    }
  } else {
    if (pressed==true) {
      float distance = dist(w, h, mouseX, mouseY);
      if (distance < 28) {
        pressed=false;
        distance=0;
      }
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
    fill(255);
    rect(xpos, ypos, swidth-10, 1);
    if (over || locked) {
      fill(#1f3947);
    } else {
      fill(#0f567d);
    }
    ellipse(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  
  float getResult(){
    float result = map(spos, sposMin, sposMax, 0, 1.0);
    return result;
  }
}

//void mousePressed() {
//
//  float distance = dist(x, y, mouseX, mouseY);
//  if (distance < 28) {
//    pressed=false;
//  }
//}

