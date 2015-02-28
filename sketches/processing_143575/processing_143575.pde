
int x, y, x1, y1, r, g, b;
int r1_check;
int r2_check;
float counter;

//255 221 153 #ffdd99 white   b=#ffdd99;
//136 34 17 #882211 red   r=#882211;

Obstacle rect1, rect2;
Circle small1, small2;
Capture cam;
import processing.video.*;
boolean check(int r1_check, int r2_check) {// int r_check, int g_check
  if (r1_check==1 && r2_check==1) {//r_check==1 && g_check==1
    return (true);
  }
  else {
    return (false);
  }
}
PFont font;
void setup() {
  font=loadFont("Baskerville-70.vlw");
  counter=0;
  background(72, 63, 63);
  size(1200, 801);
  frameRate(30);
  rect1=new Obstacle(200, 300);
  rect2= new Obstacle (900, 550);
  r=43;
  g=35;
  b=35;
  cam = new Capture (this, 1200, 800, "FaceTime HD Camera (Built-in)", 30); 
  cam.start();
  //printArray(Capture.list());
}

void draw() {
  fill (r, g, b, random(50));
  rect(0, 0, width, height);  

  if (cam.available()) {
    cam.read();
    cam.loadPixels();

    loadPixels();
    if (r1_check==1 && r2_check==1) {//(state==1);//
      for (int i=0; i<cam.pixels.length; i++) {
        if (brightness(cam.pixels[i])>150) {
          pixels[i]= color (0, 227, 43 );
          r=255;
          g=int(random(150, 255)); 
          b=int(random(150, 255));
          rect1.switch_color();           
          rect2.switch_color();
          r1_check=0;
          r2_check=0;
        }
      }
    }
    else {
      for (int i=0; i<cam.pixels.length; i++) {
        if (brightness(cam.pixels[i])>150) {
          // pixels[i]=color(0,143,143);
          pixels[i]= color (0, 168, 227);
          r=43;
          g=35;
          b=35;
          rect1.return_color();
          rect2.return_color();
        }
      }
    }

    updatePixels();

    rect1.display();
    rect2.display();

    int[] XpointsTop = new int[width];
    int[] YpointsTop = new int[height/2];
    int[] XpointsBot = new int[width];
    int[] YpointsBot = new int[height/2];


    for (int i = 0; i < width; i ++) {
      XpointsTop[i] = i;
      for (int j = 0; j < height/2; j ++) {
        YpointsTop[j] = j;
      }
    }

    //top pixels
    for (int k = 0; k < XpointsTop.length; k+=60) {
      for (int l = 0; l < YpointsTop.length; l+=60) {
        x = XpointsTop[k];
        y = YpointsTop[l];

        small1=new Circle(x, y, 180);


        if (red(get(x, y))>0) {
          small1=null;
        }

        else if (blue(get(x, y))>0) {

          small1.display();
          if ((small1.zone1(rect1))) {    
            r1_check=1;
            //println (r1_check);
          }
          else if (blue(get(x, y))<0) {
            r1_check=0;
          }

          // bottom pixels
          for (int m = 0; m < XpointsTop.length; m+=60) {
            for (int n = 0; n < YpointsTop.length; n+=60) {

              x1 = XpointsTop[m] ;
              y1 = YpointsTop[n] +400; 

              small2=new Circle(x1, y1, 220);//, 0

                if (red(get(x1, y1))>0) {
                small2=null;
              }

              else if (blue(get(x1, y1))>0) {
                small2.display();
                if ((small2.zone2(rect2))) {    
                  r2_check=1;
                } 
                else if (blue(get(x1, y1))<0) {
                  r2_check=0;
                  // println ("r2 fail");
                }
              }
            }
          }
        }
      }
    }
  }


  if (r!=43) {
    counter+=(.0333);
    float move= random(-width, width);
    stroke(255);
    noFill();
    strokeWeight(1);
    rect(200+ move, 300, 165, 2);
     rect(900 + move,550, 165, 2);
    textFont(font);
    textSize(25);
    fill (255);
    text("Acquainted", 200+ move, 300);
        text("Acquainted", 900 + move, 550);
    if (counter> 60) {
      saveFrame("/Users/student/Desktop/save/line-######.png");
      counter=0;
    }
  }
}



class Circle {
  float x, y, w, c;

  Circle(float _x, float _y, float _c) {
    x= _x;
    y = _y;
    w=1;
    c=_c;
  }

  void display() {
    noStroke ();
    fill(c);
    ellipse (x, y, w, w);
  }

  Boolean zone1(Obstacle rect1) { 
    float d1= dist (small1.x, small1.y, rect1.x, rect1.y);
    //println (d1); 
    if (d1 < (w*100) ) {  


      return (true);
    } 
    else { 
      return (false);
    }
  }


  Boolean zone2(Obstacle rect2) { 
    float d2= dist (small2.x, small2.y, rect2.x, rect2.y);
    //println (d2);
    if (d2 < (w*100) ) {   

      return (true);
    } 
    else { 
      return (false);
    }
  }
}

class Obstacle {
  float x, y, w, h, r, g, b;


  Obstacle(float _x, float _y) {
    x = _x;
    y = _y;
    r=255;
    g=255;
    b= 255;
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(r, g, b, 15);
    ellipseMode (CENTER);
    //ellipse (x, y, 100, 100);
    ellipse (x, y, 50, 50);
    ellipse (x, y, 25, 25);
    line (x-20, y, x+ 20, y);
    line (x, y+20, x, y-20);
  }

  void switch_color () {
    r=255;
    g=255;
    b= 255;
    stroke (r, g, b);
  }

  void return_color() {
    r=0;
    g=0;
    b= 0; 
    stroke (r, g, b);
  }
}

