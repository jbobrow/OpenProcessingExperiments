
int w = 1000;
int h = 600;
int y = int(random(0, h/5));
int x = int(random(-10, -100));
int w1 = -10;
int w2 = 510;
int grass = color(0, 200, 0);
int yellow = color(255, 255, 0);
int brown = color(139, 69, 19);
int skyblue = color(0, 191, 255);

ArrayList<Cloud> clouds;
Cloud c, c1, c2, c3, c4, c5, c6;


void setup() {
  size(1000, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  clouds = new ArrayList<Cloud>();
  /*if (keyPressed == true) {
    if (key == 'a') {
      c = new Cloud(w1, int(random(0, 20)));
      clouds.add(c);
    }
  }*/
  c = new Cloud(-10, int(random(0, h/5))-20);
  c1 = new Cloud(-60, int(random(0, h/5)-20));
  c2 = new Cloud(-110, int(random(0, h/5))-20);
  c3 = new Cloud(-160, int(random(0, h/5))-20);
  c4 = new Cloud(-210, int(random(0, h/5))-20);
  c5 = new Cloud(-260, int(random(0, h/5))-20);
  c6 = new Cloud(-310, int(random(0, h/5))-20);
  clouds.add(c);
  clouds.add(c1);
  clouds.add(c2);
  clouds.add(c3);
  clouds.add(c4);
  clouds.add(c5);
  clouds.add(c6);
}

void draw() {
  background(255);
  house();
  c.dispay(2);
  c.wind();
  c1.dispay(1);
  c1.wind();
  c2.dispay(3);
  c2.wind();
  c3.dispay(1);
  c3.wind();
  c4.dispay(3);
  c4.wind();
  c5.dispay(2);
  c5.wind();
  c6.dispay(3);
  c6.wind();
}

void house() {
  int H = (h/2)+100;
  int windowCenterX1 = w/5*2;
  int windowCenterX2 = (w/5)*3;
  fill(skyblue);
  rect(w/2, h/2, w, h);

  //draw the hill
  fill(grass);
  stroke(grass);
  arc(w/2, H, w, h, PI, TWO_PI);
  rect(w/2, ((h/4)*3)+100, w, 300);

  //draw the house
  fill(brown);
  stroke(brown);
  strokeWeight(10);
  line(w/2-200, h/2-10, w/2, 190);
  line(w/2, 190, w-300, h/2-10);
  /*fill(brown);
   stroke(brown);
   strokeWeight(1);
   triangle(20, h/2-5, w/2, 140, w-20, h/2-5);
   rect(w/2, h/2+25, w-44, 60);*/

  //draw the windows
  strokeWeight(1);
  fill(222, 184, 135);
  stroke(222, 184, 135);
  rect(windowCenterX1, h/2, 30, 30);
  rect(windowCenterX2, h/2, 30, 30);
  fill(skyblue);
  stroke(skyblue);
  ellipse(windowCenterX1, h/2, 30, 30);
  ellipse(windowCenterX2, h/2, 30, 30);
  fill(245, 245, 220);
  stroke(245, 245, 220);
  rect(windowCenterX1, h/2, 30, 3);
  rect(windowCenterX1, h/2, 3, 30);
  rect(windowCenterX2, h/2, 30, 3);
  rect(windowCenterX2, h/2, 3, 30);

  //draw the door
  fill(brown);
  stroke(brown);
  ellipse(w/2, (h/2)-26, 150, 150);
  fill(yellow);
  stroke(yellow);
  ellipse(w/2, (h/2)-26, 140, 140);
  fill(0);
  stroke(0);
  ellipse(w/2, (h/2)-26, 15, 15);
  //line(w/2, 149, w/2, 299);
}

class Cloud {
  int x, y, type;
  int savedTime = millis();
  int timeCheck = savedTime/100;

  //constructor
  Cloud(int myX, int myY) {
    x = myX;
    y = myY;
  }
  
  int cloudType () {
    int rand = int(random(1,3));
    if (rand == 1) {
      type = 1;
    }
    else if (rand == 2) {
      type = 2;
    }
    else if (rand == 3) {
      type = 3;
    }
    return type;
  }

  void dispay(int type) {
    fill(225);
    noStroke();
    if (type == 1) {
      cloud1(x, y);
    }
    else if (type == 2) {
      cloud2(x, y);
    }
    else if (type == 3) {
      cloud3(x, y);
    }
  }
  
  void cloud1(int i, int j) {
    fill(225);
    noStroke();
    ellipse(i, j, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i, j-10, 20, 20);
    ellipse(i+10, j, 20, 20);
    ellipse(i, j+10, 20, 20);
  }
  
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
  }
  
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
  }

  void wind() {
    if (x <= w) {
      x += 1;
    }
    if (x == w) {
      x = 0;
    }
  }
}



