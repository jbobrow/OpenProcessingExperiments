
//Author: Liliam Rodas
//Purpose: Homework to generate a season greetings card. 
          // The art work is based in emergence patterns appliying fractals
//Functioning: By allowing interaction between green and red circles
              //We can form interesting patterns which can be held by
              //Clicking in the screen and obtainig the phrase "Merry Christmas" 
              //Each time the result is different, obtaining unique season Cards.
//Reference: previous excercises provided in class and processing.


PFont font;
int _numChildren = 7;
int _maxLevels = 4;
Branch _trunk;


void setup() {
  size(700, 700);
  background(255);

  noFill();
  smooth();
  newTree();
  frameRate(7);
}

void draw() {
  background(255);
  _trunk.updateMe(width/2, height-10);

  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 0, width, 50);
}


//CREATING THE OBJECT

class Branch {
  float level, index;
  float x, y;
  float endx, endy, endx1, endy1;
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation

  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float
    ex, float why) {
    level = lev;
    index = ind;
    strokeW = (1/level)*3;
    alph = 255/level;
    len = (1/level)*random(300);
    lenChange = random(30)-5;
    rotChange = random (-PI/2);


    updateMe(ex, why);
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] =
          new Branch(level+1, x, endx, endy);
      }
    }
  }


  void updateMe(float ex, float why)
  {
    x = ex;
    y = why;
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) { 
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));

    endx1 = x+(len*cos(radian)-rotChange);
    endy1 = y+(len*sin(radian)-rotChange);

    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  PFont font;
  void drawMe() {

    if (mousePressed) {

      font= loadFont("Andalus-48.vlw");  
      //textSize(50);  
      fill(9, 28, 1);
      String s= "Merry Christmas";
      textFont (font);
      text(s, 70, height-70, width-70, height-70);
    }

    strokeWeight(strokeW);
    stroke(5, 59, 1, 150);
    //stroke(0, alph);
    //fill(255, alph);
    line(x, y, endx, endy);

    noStroke();

    fill (193, 26, 8, 220);
    ellipse(endx, endy, len/8, len/8);

    fill (193, 26, 8, 100);
    ellipse(endx, endy, len/6, len/6);


    fill (5, 59, 1, 200);
    ellipse(endy1, endx1, len/5, len/5);

    fill (229, 245, 12, 40);
    ellipse(endy1, endx1, len/3, len/3);

    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}


