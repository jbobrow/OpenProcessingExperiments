
int x, y, r, g, b, x1, y1;
Obstacle rect1, rect2;
int r_check=0;
int g_check=0;

boolean check(int r_check, int g_check) {// int r_check, int g_check
  if (r_check==1 && g_check==1) {//r_check==1 && g_check==1
    return (true);
  }
  else {
    return (false);
  }
}


//255 221 153 #ffdd99 white
//136 34 17 #882211 red
Circle small1, small2;
int ellipseCounter=0;
import processing.video.*;
Capture cam;



void setup() {
  rect1=new Obstacle(275, 30);
  rect2= new Obstacle (900, 550);
  small1=new Circle();
  small2=new Circle();
  //check=false;
  // r_check=0;
  //g_check=0;
  b=#ffdd99;
  r=#882211;
background(b);
  size(1200, 801);
  frameRate(30);

  cam = new Capture (this, 1200, 800, "FaceTime HD Camera (Built-in)", 30); 
  cam.start();
  //printArray(Capture.list());
}
void draw() {
      fill (b);
      rect(0, 0, width, height);  

  if (cam.available()) {
    cam.read();
    cam.loadPixels();

    loadPixels();
    if (check(r_check, g_check )) {
      for (int i=0; i<cam.pixels.length; i++) {
        if (brightness(cam.pixels[i])>200) {
          pixels[i]= color (136, 34, 17);
        }
      }
    }
    else {
     
      for (int i=0; i<cam.pixels.length; i++) {
        if (brightness(cam.pixels[i])>200) {
          pixels[i]= color (250, 34, 255);
        }
      }
    }

    updatePixels();

    

    rect2.display();
    rect1.display();

    int[] XpointsTop = new int[width];
    int[] YpointsTop = new int[height/2];
    int[] XpointsBot = new int[width];
    int[] YpointsBot = new int[height];

    for (int i = 0; i < width; i ++) {
      XpointsTop[i] = i;
      for (int j = 0; j < height/2; j ++) {
        YpointsTop[j] = j;
      }
    }
    for (int a = 0; a < width; a ++) {
      XpointsBot[a] = a;
      for (int b = 400; b < height; b ++) {
        YpointsBot[b] = b;
      }
    }

    for (int k = 0; k < XpointsTop.length; k+=40) {
      for (int l = 0; l < YpointsTop.length; l+=40) {
        int x = XpointsTop[k];
        int y = YpointsTop[l];
        if (red(get(x, y))>0 && red(get(x, y))<252) {
          small1.display(x, y);
          //println ("x "+ x);

          if ( (  rect1.zone1(small1) )  ) {    
            rect1.r_test_pass();

            r_check=1;
          } 
          else {
            rect1.r_test_fail();
            r_check=0;
          }
        }


        for (int m = 0; m < XpointsBot.length; m+=40) {
          for (int n = 0; n < YpointsBot.length; n+=40) {

            int x1 = XpointsBot[m];
            int y1 = YpointsBot[n];  

            if (blue(get(x, y))>33 && blue(get(x, y))<252) {
              small2.display(x1, y1);
              if ( (  rect2.zone2(small2) )  ) {    
                rect2.g_test_pass();
                println ("match green");
                g_check=1;
              } 
              else {
                rect2.g_test_fail();
                g_check=0;
                println ("no match");
              }
            }
          }
        }
      }
    }
  }
}
//}





class Circle {
  float x, y, c, w;

  Circle() {
  }

  void display(float _x, float _y) {
    x= _x;
    y = _y;
    w=2;

    noStroke ();
    noFill();
    ellipse (x, y, w, w);
  }
}


class Obstacle {

  float x, y, w, h, r, g;
  int r_check, g_check;


  //constructor
  Obstacle(float _x, float _y) {
    x = _x;
    y = _y;
    w = 100;
    h= 20;
    r_check=0;
    g_check=0;
  }

  void display() {
    noFill();
    stroke(255, 255, 255);
    rect(x, y, w, h);
  }

  Boolean zone1(Circle small0) { 
    float d1= dist (rect1.x, rect1.y, small1.x, small1.y);

    if (d1 < (w) ) {              
      return (true);
    } 
    else { 
      return (false);
    }
  }

  Boolean zone2(Circle small0) { 
    float d2= dist (rect2.x, rect2.y, small2.x, small2.y);
    //  println (d2);


    if (d2 < (w) ) {              
      return (true);
    } 
    else {
      return (false);
    }
  }

  void r_test_pass() {
    r_check= 1;
  }

  void r_test_fail() {    
    r_check = 0;
  }

  void g_test_pass() {
    g_check= 1;
  }

  void g_test_fail() {    
    g_check = 0;
  }
}

