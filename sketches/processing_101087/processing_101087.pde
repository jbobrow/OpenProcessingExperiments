
PImage regularDad;
PImage funnyDad;
PFont myFont;
HappyFathersDay hfd;
PVector rightEye = new PVector(0, 0);
PVector leftEye = new PVector(0, 0);

void setup() {
  size(600, 600);
  smooth();
  myFont = createFont("Garamond", 40);
  textFont(myFont);
  hfd = new HappyFathersDay();
  regularDad = loadImage("RegularDad.jpg");
  funnyDad = loadImage("FunnyDad.jpg");
}

void draw() {
  background(255);
  hfd.display();
  fill(0);
  textSize(14);
  text("Love 010101000111001001100101011101100110111101110010", 20, 580);
  text("2013", 560, 580);
  textSize(40);
  dadFace();
}

class HappyFathersDay {
  char[] title = {
    'Y', 'A', 'D', ' ', 'S', '\'', 'R', 'E', 'H', 'T', 'A', 'F', ' ', 'Y', 'P', 'P', 'A', 'H'
  };
  color[] titleColor = new color[title.length];
  float[] x = new float[title.length];
  float[] y = new float[title.length];
  float[] xExplode = new float[title.length];
  float[] yExplode = new float[title.length];
  float segLength = 26.5;
  boolean followMouse = true;
  int timer = 0;

  HappyFathersDay() {
    newColors();
    for (int i = 0; i < title.length; i++) {
      xExplode[i] = random(-2, 2); 
      yExplode[i] = random(-2, 2);
    }
  }

  void display() {
    for (int i = 0; i < title.length; i++) {
      if (followMouse) {
        if (i == 0) {
          dragSegment(0, mouseX, mouseY);
        }
        if (i != 0) {
          dragSegment(i, x[i-1], y[i-1]);
        }
      }  
      else {
        explode(i, timer);
      }
    }
    if (mousePressed) {
      followMouse = false;
      newColors();
    }
    if (timer < 400 && followMouse == false) {
      timer++;
    }  
    else {
      followMouse = true;
      timer = 0;
    }
  }

  void newColors() {
    for (int i = 0; i < title.length; i++) {
      titleColor[i] = color(random(0, 200), random(0, 200), random(0, 200));
    }
  }
  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], title[i], titleColor[i], angle);
  }
  void segment(float x, float y, char c, color clr, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    fill(clr);
    text(c, 0, 20);
    popMatrix();
  }
  void explode(int i, int t) {
    float angle = atan2(y[i]-mouseY, x[i]-mouseX)*i; 
    if (t < 200) {
      x[i] += xExplode[i];
      y[i] += yExplode[i];
      segment(x[i], y[i], title[i], titleColor[i], angle);
    }
    if (t >= 200) {
      x[i] -= xExplode[i];
      y[i] -= yExplode[i];
      segment(x[i], y[i], title[i], titleColor[i], angle);
    }
  }
}

void dadFace() {
  boolean showRegular = true;
  if (mousePressed) {
    showRegular = false;
  }  
  else {
    showRegular = true;
  }
  if (hfd.followMouse) {
    regularDad.resize(0, 120);
    image(regularDad, 450, 480);
    fill(255);
    noStroke();
    ellipse(485, 526, 8, 5);
    ellipse(507, 528, 8, 5);
    rightEye.x = mouseX - 485;
    rightEye.y = mouseY - 526;
    rightEye.normalize();
    leftEye.x = mouseX - 507;
    leftEye.y = mouseY - 528;
    leftEye.normalize();
    fill(95, 60, 25);
    pushMatrix();
    translate(485, 526);
    ellipse(rightEye.x, rightEye.y, 5, 5);
    popMatrix();
    pushMatrix();
    translate(507, 528);
    ellipse(leftEye.x, leftEye.y, 5, 5);
    popMatrix();
  }  
  else {
    funnyDad.resize(0, 120);
    image(funnyDad, 430, 480);
  }
}



