
/**********************
 *
 *  R = Fixed cirlce           - UP/DOWN
 *  r = Moving cirlce          - LEFT- RIGHT
 *  O = Moving cirrlce offset  - o - l
 *      Inside or outside      ]
 *
 *  r, g, b = increase the values of colors by ten
 *
 ***********************/

float R, r, O;
float t;
float x, y, x_, y_;
int red_, green_, blue_;
boolean stop;
boolean inside;
PFont f;
int rectX, rectY, textX, textY;
int rectWidth, rectHeight;
String txt;

void setup() {
  size(500, 500);
  smooth();

  R = 120;
  r = 5;
  O = 80;
  t = 1;

  red_ = 45;
  green_ = 230;
  blue_ = 230;

  x = 0;
  y = 0;
  background(0);

  stop = false;
  inside = false;

  f = createFont("Arial", 10, true);
  rectX = 2;
  rectY = height-30;
  rectWidth = 40;
  rectHeight = 30;

  textX = 4;
  textY = height-12;
  txt = "Stop";
}

void draw() {  
  if (! stop) {
    x_ = x;
    y_ = y;

    if (!inside) {
      // moving circle outisde fixed circle
      x = (R+r)*cos(t) - O*cos(((R+r)/r)*t);
      y = (R+r)*sin(t) - O*sin(((R+r)/r)*t);
    }
    else {
      // moving cirle inside fixed circle
      x = (R-r)*cos(t) + O*cos(((R-r)/r)*t);
      y = (R-r)*sin(t) - O*sin(((R-r)/r)*t);
    }

    pushMatrix();
    translate(width/2, height/2);
    stroke(red_, green_, blue_);
    if (x_ != 0)
      line(x_, y_, x, y);

    popMatrix();

    // Stop-Start button
    pushMatrix();
    fill(125);
    noStroke();
    //rect(0, 0, 20, 20);
    rect(rectX, rectY, rectWidth, rectHeight);
    textFont(f);
    fill(0);
    text(txt, textX, textY);
    popMatrix();

    t += 1;

    if ((t % 100) == 0) {
      fill(0, 30);
      noStroke();
      pushMatrix();
      rect(0, 0, width, height);
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      R += 1;
    }
    if (keyCode == DOWN) {
      R -= 1;
    }
    if (keyCode == LEFT) {
      r -= 1;
    }
    if (keyCode == RIGHT) {
      r += 1;
    }
    background(0);
  }
  if (key == 'o') {
    O += 1;
    background(0);
  }
  if (key == 'l') {
    O -= 1;
    background(0);
  }
  // Inside or out
  if (key == ']') {
    inside = !inside;
    background(0);
  }

  // Colors
  if (key == 'r') {
    red_ = (red_+10) % 255;
  }
  if (key == 'g') {
    green_ = (green_+10) % 255;
  }
  if (key == 'b') {
    blue_ = (blue_+10) % 255;
  }


  println("Fixed=" + R + " Moving=" + r + " Offset=" + O + " Inside=" + inside);
  println(red_ + " " + green_ + " " + blue_);
}

void mouseReleased() {

  if (mouseX >= rectX && mouseX <= rectX+rectWidth
      && mouseY >= rectY) {
    stop = !stop;
    if (txt == "Stop") {
      txt = "Start";
    }
    else {
      txt = "Stop";
    }

    pushMatrix();
    fill(125);
    rect(rectX, rectY, rectWidth, rectHeight);
    fill(0);
    noStroke(); 
    text(txt, textX, textY);
    popMatrix();
  }
}


