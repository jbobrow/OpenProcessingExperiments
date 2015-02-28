
//Assignment 7: Season's Greetings
//N76014087  TePang Chiang
//Branchs with colorful fruits in the depths of winter.
//Like the end of old days ,and the new life in new year. 

int num = 0;
PImage imgA;
int _numChildren = 2;
int _maxLevels = 4;
Branch _trunk;

void setup() {
  size(650, 650);
  imgA = loadImage("image14.jpg");
  //background(255);
  noFill();
  newTree();
  image(imgA, 0, 0);
  frameRate(2);
}

void draw() {
  num++;
  if (num > 21) {
    num=1;
  }
  switch(num) {
  case 0: 
    noFill();
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe();
    break;
  case 1: 
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe();
    break;
  case 2: 
    _trunk.updateMe(650, random(height));
    _trunk.drawMe3();
    break;
  case 3: 
    _trunk.updateMe(random(width), 650);
    _trunk.drawMe3();
    break;
  case 4: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe2();
    break;
  case 5: 
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe3();
    break;
  case 6: 
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe();
    break;
  case 7: 
    _trunk.updateMe(650, random(height));
    _trunk.drawMe3();
    break;
  case 8: 
    _trunk.updateMe(random(width), 650);
    _trunk.drawMe();
    break;
  case 9: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe();
    break;
  case 10: 
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe2();
    break;
  case 11: 
    _trunk.updateMe(random(width), 0);
    _trunk.drawMe3();
    break;
  case 12: 
    _trunk.updateMe(650, random(height));
    _trunk.drawMe2();
    break;
  case 13: 
    _trunk.updateMe(random(width), 650);
    _trunk.drawMe2();
    break;
  case 14: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe();
    break;
  case 15: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe2();
    break;
  case 16: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe();
    break;
  case 17: 
    _trunk.updateMe(random(width), 650);
    _trunk.drawMe3();
    break;
  case 18: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe2();
    break;
  case 19: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe3();
    break;
  case 20: 
    _trunk.updateMe(0, random(height));
    _trunk.drawMe2();
    break;

  case 21: 
    noFill();
    image(imgA, 0, 0);
    break;
  }

float S=second();
  fill(255, 168, 8, 125*(S%2));
  textSize(50);
  text("2014", 275, 300);
  text("HAPPY NEW YEAR", 120, 375);
  noFill();
}

/*void mouseReleased() {
 //num+=random(2);
 
 }*/

void newTree() {
  _trunk = new Branch(1, 0, width/2, 0);

  _trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, 
  float ey) {
    level = lev;
    index = ind;
    updateMe(ex, ey);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int i=0; i<_numChildren; i++) {
        children[i] = new Branch(level+1, 
        i, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    endx = x+(level*(random(-80, 80))*(325-x)/abs(325-x));
    endy = y+((level*(random(abs(y-random(250, 400))/8, abs(y-random(250, 400))/3)))*(325-y)/abs(325-y));

    for (int i=0; i<children.length; i++)
    {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    strokeWeight(_maxLevels+3-level);
    stroke(0, 200);
    line(x, y, endx, endy);
    stroke(x%250, y%250, ((x+y)/2)%250, (((x+y)/2)%50)+150);
    ellipse(x, y, 10, 10);

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }

  void drawMe2() {
    strokeWeight(_maxLevels+6-(level*2));
    stroke(0, 200);
    line(x, y, endx, endy);
    stroke(x%250, y%250, ((x+y)/2)%250, (((x+y)/2)%50)+190);
    ellipse(x, y, 10, 10);

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe2();
    }
  }

  void drawMe3() {
    strokeWeight(_maxLevels+10-(level*3));
    stroke(0, 220);
    line(x, y, endx, endy);
    stroke(x%250, y%250, ((x+y)/2)%250, (((x+y)/2)%50)+150);
    ellipse(x, y, 10, 10);

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe3();
    }
  }
}



