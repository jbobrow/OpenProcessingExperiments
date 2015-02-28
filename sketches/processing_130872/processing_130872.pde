
int w = 1000;
int h = 600;
int y = int(random(0, h/5));
int x = int(random(-10, -100));

int inc;

//color variables
int grass = color(0, 200, 0);
int yellow = color(255, 255, 0);
int brown = color(139, 69, 19);
int skyblue = color(0, 191, 255);

//sun rotation variables
float px, py, angle;
float px2, py2, angle2;
float frequency = 0.104;
float radius = 150;
float r = 15;

Cloud [] clouds;
//Cloud c, c1, c2, c3, c4, c5, c6;


void setup() {
  size(1000, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  clouds = new Cloud[10];
  inc = -10;
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(inc, int(random(50, h/5)), int(random(1,3)));
    inc = inc - 100;
  }
}

void draw() {
  background(255);
  
  //draw sky
  fill(skyblue);
  rect(width/2, height/2, width, height);
  //end sky
  
  sun();
  house();
  for (int i = 0; i < clouds.length; i ++) {
    clouds[i].display();
    clouds[i].wind();
  }
}

void house() {
  int H = (h/2)+200;
  int windowCenterX1 = width/5*2;
  int windowCenterX2 = (width/5)*3;

  //draw the hill
  fill(grass);
  stroke(grass);
  arc(w/2, H, w, h, PI, TWO_PI);
  rect(w/2, ((h/4)*3)+200, w, 300);

  //draw the house
  fill(brown);
  stroke(brown);
  strokeWeight(10);
  line(width/2-200, height/2+90, width/2, 290);
  line(width/2, 290, width-300, height/2+90);
  /*fill(brown);
   stroke(brown);
   strokeWeight(1);
   triangle(20, h/2-5, w/2, 140, w-20, h/2-5);
   rect(w/2, h/2+25, w-44, 60);*/
   
   clock();

  //draw the windows
  strokeWeight(1);
  fill(222, 184, 135);
  stroke(222, 184, 135);
  rect(windowCenterX1, height/2+100, 30, 30);
  rect(windowCenterX2, height/2+100, 30, 30);
  fill(skyblue);
  stroke(skyblue);
  ellipse(windowCenterX1, height/2+100, 30, 30);
  ellipse(windowCenterX2, height/2+100, 30, 30);
  fill(245, 245, 220);
  stroke(245, 245, 220);
  rect(windowCenterX1, height/2+100, 30, 3);
  rect(windowCenterX1, height/2+100, 3, 30);
  rect(windowCenterX2, height/2+100, 30, 3);
  rect(windowCenterX2, height/2+100, 3, 30);

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

void sun() {
  fill(255, 255, 0);
  px = (width/2) + cos(radians(angle))*(radius*3);
  py = (width/2+100) + sin(radians(angle))*(radius*3.5);
  ellipse(px, py, 50, 50);
  
  angle += frequency;
} //end sun

void clock() {
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse((w/5)*2, (height/2)+65, 30, 30);
  px2 = (w/5)*2 - cos(radians(angle2))*r;
  py2 = (height/2)+65 - sin(radians(angle2))*r;
  fill(0);
  line((w/5)*2, (height/2)+65, px2, py2);
  
  angle2 += frequency;
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
    else if (rand == 2) {
      type = 2;
    }
    else if (rand == 3) {
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
    else if (type == 3) {
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
    if (x <= w) {
      x += 1;
    }
    if (x == w) {
      x = 0;
    }
  }
}

class Sun {
  Sun () {
    
  }
}


