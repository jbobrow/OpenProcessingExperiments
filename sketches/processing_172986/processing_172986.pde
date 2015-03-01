
PImage feed;
int time;
float timesince_float;
float xxx;
float yyy;
float zoom;              //Base zoom level. Can only be changed via UP and DOWN arrows.
float z;                 //Actual zoom level, adjusted for distance from centre of screen and whether auto mode is on.
float unitdistance;      //Distance of zoom centre from centre of screen. Used to give illusion of depth.
boolean auto = false;
boolean strokeon = false;
boolean bground = true;
float maxz = 0;
float minz = 10;
int mousexq;
int mouseyq;
int r;
String rs;
int level = 10;
int level2 = height;
int randpos;

//  Controls:
//  UP and DOWN to change zoom level.
//  'A' to go into automatic mode.
//  'S' to toggle between stroke and fill modes.
//  'D' to toggle between placing the ellipses in the foreground or the background.
//  Use the mouse to control zoom centre.

void setup() {
    size(800,800,P2D);
    feed = createImage(width,height,RGB);
    colorMode(RGB, 100, 100, 100);
    time = millis();
    rectMode(CORNERS);
    background(0);
    mouseX = width/2;
    mouseY = height/2;
    zoom = 0.6;
    strokeWeight(1);
    noSmooth();
}
 
void draw() {
    timesince_float = ((millis() - time)*0.01);
    if (strokeon == true) {
      noFill();
      stroke(0, 50*sin(timesince_float)+50, 0);
    }
    else {
      noStroke();
      fill(0, 50*int(sin(timesince_float)-0.5)+50, 0);
    }
      mousexq = int(mouseX/100) * 100;
      mouseyq = int(mouseY/100) * 100;
      xxx = (1-z)*mousexq;
      yyy = (1-z)*mouseyq;
      unitdistance = (dist(mousexq, mouseyq, width/2, height/2))/(dist(width,height,width/2,height/2));
      z = zoom;
      rect(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
      image(feed,xxx,yyy,width*z,height*z);
      feed = get(0,0,width,height);
      r = int((random(10000000, 99999999)));
      rs = str(r);
      fill(0,50,0);
      if (level < width) {
        level = level + 64;
      }
      else {
        level = 10;
        randpos = 10*(int(random(height/10)));
        if (level2 > 0) {
          level2 = level2 - 10;
        }
        else {
          level2 = height;
        }
      }
      pushMatrix();
      translate(10, 10);
      rotate(HALF_PI);
      translate(-10, -width);
      
      text(rs, level, randpos, height + 100, width);
      text(rs, level, randpos, height + 100, width);
      popMatrix();
}

void keyPressed() {
  if (keyCode == UP) {
    zoom = constrain(zoom - 0.002, 0.5, 1);
  }
  else if (keyCode == DOWN) {
    zoom = constrain(zoom + 0.002, 0.5, 1);
  }
  else if (key == 'a') {
    if (auto == true) {
      auto = false;
    }
    else {
      auto = true;
    }
  }
  else if (key == 's') {
    if (strokeon == true) {
      strokeon = false;
    }
    else {
      strokeon = true;
    }
  }
  else if (key == 'd') {
    if (bground == true) {
      bground = false;
    }
    else {
      bground = true;
    }
  }
}
