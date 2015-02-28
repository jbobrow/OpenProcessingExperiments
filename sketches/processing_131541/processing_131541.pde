
int y = int(random(0, height/5));
int x = int(random(-10, -100));

int inc;

//color variables
int grass = color(0, 200, 0);
int yellow = color(255, 255, 0);
int brown = color(139, 69, 19);
int skyblue = color(0, 191, 255);
int darkblue = color(25, 25, 112);
int purple = color(148, 0, 211);
int red = color(175, 0, 0);
int orange = color(255, 69, 0);
int sunrise_blue = color(135, 206, 250);
int green = color(34, 139, 34);

//sun rotation variables
float px, py, angle;
float frequency = 0.104;
//clock rotation variables
float px2, py2, angle2, px3, py3, angle3;
float frequency2 = 1.56;
//moon rotation variables
float px4, py4, angle4;
float frequency3 = 0.15;

float radius = 150;
float r = 15;

PFont font;

Cloud [] clouds;


void setup() {
  size(1000, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  clouds = new Cloud[10];
  inc = -10;
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(inc, int(random(50, height/5)), int(random(1, 4)));
    inc = inc - 100;
  }
  font = loadFont("TimesNewRomanPSMT-48.vlw");
  textFont(font, 32);
}

void draw() {
  background(255);
  
  moon();
  sky(timeY());

  sun(timeX(), timeY());
  house();
  for (int i = 0; i < clouds.length; i ++) {
    clouds[i].display();
    clouds[i].wind();
  }
  
  tree(width/4, (height/4)+100);
  tree(3*(width/4), (height/4)+100);
  tree(width/2, (height/4)+50);
  //text("y = " + py, width/4, height/4);
}

void house() {
  int H = (height/2)+200;
  float windowCenterX1 = (width/5)*1.75;
  float windowCenterX2 = (width/5)*3.25;
  float windowHeight = (height/2)+60;

  //draw the hill
  fill(grass);
  stroke(grass);
  arc(width/2, H, width, height, PI, TWO_PI);
  rect(width/2, ((height/4)*3)+200, width, 300);

  //draw the house
  fill(brown);
  stroke(brown);
  strokeWeight(10);
  line(width/2-200, height/2+50, width/2, 290);
  line(width/2, 290, width-300, height/2+50);
  /*fill(brown);
   stroke(brown);
   strokeWeight(1);
   triangle(20, h/2-5, w/2, 140, w-20, h/2-5);
   rect(w/2, h/2+25, w-44, 60);*/

  clock();

  //draw the windows
  strokeWeight(1);
  fill(brown);
  stroke(brown);
  rect(windowCenterX1, windowHeight, 30, 30);
  rect(windowCenterX2, windowHeight, 30, 30);
  fill(skyblue);
  stroke(skyblue);
  ellipse(windowCenterX1, windowHeight, 30, 30);
  ellipse(windowCenterX2, windowHeight, 30, 30);
  fill(245, 245, 220);
  stroke(245, 245, 220);
  rect(windowCenterX1, windowHeight, 30, 3);
  rect(windowCenterX1, windowHeight, 3, 30);
  rect(windowCenterX2, windowHeight, 30, 3);
  rect(windowCenterX2, windowHeight, 3, 30);

  //draw the door
  fill(brown);
  stroke(brown);
  ellipse(width/2, (height/2)+74, 150, 150);
  fill(yellow);
  stroke(yellow);
  ellipse(width/2, (height/2)+74, 140, 140);
  fill(0);
  stroke(0);
  ellipse(width/2, (height/2)+74, 15, 15);
  //line(w/2, 149, w/2, 299);
} //end house

float timeX() {
  px = (width/2) + cos(radians(angle))*(radius*3);
  return px;
} //end timeX

float timeY() {
  py = (width/2+100) + sin(radians(angle))*(radius*3.5);
  return py;
} //end timeY

void sky(float time) {
  int t = int(time);
  //normal daytime
  if (t < 300) {
    fill(skyblue);
  }
  else if (t > 300 && t < 400) {
    fill(sunrise_blue);
  }
  else if (t > 400 && t < 500) {
    fill(orange);
  }
  else if (t > 500 && t < 600) {
    fill(red);
  }
  else if (t > 600 && t < 700) {
    fill(purple);
  }
  //night heading into morning
  else if (t > 700 && t < 900) {
    fill(darkblue);
  }
  //dead of night
  else {
    fill(25);
  }
  rect(width/2, height/2, width, height);
}

void sun(float x, float y) {
  fill(255, 255, 0);
  //px = (width/2) + cos(radians(angle))*(radius*3);
  //py = (width/2+100) + sin(radians(angle))*(radius*3.5);
  ellipse(x, y, 50, 50);

  angle += frequency;
} //end sun

void clock() {
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse((width/5)*2, (height/2)+55, 30, 30);
  //hour hand
  px2 = (width/5)*2 + (cos(radians(angle2))*r)/2;
  py2 = (height/2)+55 + (sin(radians(angle2))*r)/2;
  //minute hand
  px3 = (width/5)*2 + (cos(radians(angle3))*r);
  py3 = (height/2)+55 + (sin(radians(angle3))*r);
  fill(0);
  line((width/5)*2, (height/2)+55, px2, py2);
  line((width/5)*2, (height/2)+55, px3, py3);

  //increment the second and minute hands
  angle2 += frequency;
  angle3 += frequency2;
  
  fill(255);
  //text("y = " + py3, width/4, height/4);
  //text("x = " + px3, width/4, height/4-25);
}

void moon() {
  fill(255);
  px4 = (width/2) + cos(radians(angle4))*(radius*3);
  py4 = (width/2) + sin(radians(angle4))*(radius*3);
  
  ellipse(px4, py4, 25, 25);
  
  angle4 += frequency3;
}

void tree(int x, int y) {
  fill(brown);
  rect(x, y, 25, 45);
  fill(green);
  triangle(x-30, y-10, x, y-50, x+30, y-10);
  triangle(x-30, y-30, x, y-70, x+30, y-30);
}

class Cloud {
  int x, y;
  int type;
  
  //constructor
  Cloud(int myX, int myY, int Type) {
    x = myX;
    y = myY;
    type = Type;
    
  } //end constructor
  
  /*int cloudType () {
    int rand = int(random(1,3));
    if (rand == 1) {
      type = 1;
    }
    else if (rand == 2 || rand == 3) {
      type = 2;
    }
    else if (rand == 4) {
      type = 3;
    }
    return type;
  }*/

  void display() {
    fill(225);
    noStroke();
    if (type == 1) {
      cloud1(x, y);
    }
    else if (type == 2) {
      cloud2(x, y);
    }
    else if (type == 3 || type == 4) {
      cloud3(x, y);
    }
  } //end display
  
  void cloud1(int i, int j) {
    fill(225);
    noStroke();
    beginShape();
    vertex(i, j);
    vertex(i, j+50);
    vertex(i+20, j+45);
    vertex(i+50, j+40);
    vertex(i+50, j+10);
    vertex(i+25, j);
    //vertex(i-25, j-50);
    endShape();
  } //end cloud1
  
  void cloud2(int i, int j) {
    fill(225);
    noStroke();
    ellipse(i, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i+10, j, 20, 20);
    ellipse(i+10, j+5, 20, 20);
    ellipse(i+10, j+10, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i, j-15, 20, 20);
  } //end cloud1
  
  void cloud3(int i, int j) {
    fill(175);
    noStroke();
    ellipse(i, j, 20, 20);
    fill(225);
    noStroke();
    ellipse(i+10, j, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i-5, j+5, 20, 20);
    ellipse(i+20, j, 20, 20);
    ellipse(i-20, j, 20, 20);
    ellipse(i+10, j+5, 20, 20);
    ellipse(i-10, j+5, 20, 20);
  } //end cloud2

  void wind() {
    if (x <= (width+100)) {
      x += 1;
    }
    if (x == (width+100)) {
      x = 0;
    }
  }
}



