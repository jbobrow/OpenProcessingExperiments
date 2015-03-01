
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

//  Controls:
//  UP and DOWN to change zoom level.
//  'A' to go into automatic mode.
//  'S' to toggle between stroke and fill modes.
//  'D' to toggle between placing the ellipses in the foreground or the background.
//  Use the mouse to control zoom centre.

void setup() {
    size(1000,800,P2D);
    feed = createImage(width,height,RGB);
    colorMode(HSB, 100, 100, 100);
    time = millis();
    ellipseMode(CORNERS);
    background(0);
    mouseX = width/2;
    mouseY = height/2;
    zoom = 0.9;
    strokeWeight(1);
}
 
void draw() {
    timesince_float = ((millis() - time)*0.01);
    if (strokeon == true) {
      noFill();
      stroke(50*sin(timesince_float)+50, 100, 100);
    }
    else {
      noStroke();
      fill(50*sin(timesince_float)+50, 100, 100);
    }
    if (auto == false) {
      xxx = (1-z)*mouseX;
      yyy = (1-z)*mouseY;
      unitdistance = (dist(mouseX, mouseY, width/2, height/2))/(dist(width,height,width/2,height/2));
      z = zoom -0.05 + 0.05*cos(unitdistance*PI/2);
      if (bground == false) {
        image(feed,xxx,yyy,width*z,height*z);
        ellipse(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
      }
      else {
        ellipse(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
        image(feed,xxx,yyy,width*z,height*z);
      }
    }
    else {
      xxx = (1-z)*(width*sin(0.13*timesince_float)/2 + width/2);
      yyy = (1-z)*(height*sin(0.11*timesince_float)/2 + height/2);
      unitdistance = (dist(xxx/(1-z), yyy/(1-z), width/2, height/2))/(dist(width,height,width/2,height/2));
      z = 0.2*(sin(0.02*timesince_float) + sin(0.055*timesince_float) + sin(0.034*timesince_float))/3 + 0.6 + 0.1*cos(unitdistance*PI/2);
      println(z);
      if (bground == false) {
        image(feed,xxx,yyy,width*z,height*z);
        ellipse(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
      }
      else {
        ellipse(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
        image(feed,xxx,yyy,width*z,height*z);
      }
      maxz = max(maxz, z);
      minz = min(minz, z);
      println(maxz, " ", minz);
    }
    feed = get(0,0,width,height);
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
