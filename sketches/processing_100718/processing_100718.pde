

PFont font;

PImage img;
Animation animation1, animation2, animation3, animation4, animation5;
Bunny n1;
Bananas t1, t2;
DogBones g1, g2;
Mushrooms m1, m2;
Frogs f1, f2;
//MovingMushrooms;


float xpos = 100;
float ypos = 100;
float bx;
float by;
float speed = 3;

int bad = 0;
int good = 0;

void setup() {
  size(255, 173);
  frameRate(24);
  img = loadImage("levelExample.png");
  animation1 = new Animation("up", 2);
  animation2 = new Animation("left", 2);
  animation3 = new Animation("right", 2);
  animation4 = new Animation("down", 4);
  animation5 = new Animation("restFrame", 2);
  t1 = new Bananas("banana.svg", 10, 40, 50);
  t2 = new Bananas("banana.svg", 10, 60, 30);
  n1 = new Bunny("bunny.svg", 10, 80);
  m1 = new Mushrooms("mushroom.svg", 10, 50);
  m2 = new Mushrooms("mushroom.svg", 20, 30);
  g1 = new DogBones("bone.svg", 10, 20); 
  g2 = new DogBones("bone.svg", 10, 45);
  f1 = new Frogs("frog.svg", 10, 10, 20, 50);
  f2 = new Frogs("frog.svg", 10, 10, 10, 100);
  
}

void draw() {
  background(255);
  image(img, bx, by);
  character();
  println("bx =" + bx);
  println("by =" + by);
  g1.display();
  g2.display();
  m1.display();
  m2.display();
  t1.display();
  t2.display();
  m1.bounce();
  n1.bounce();
  f1.display();
  f2.bounce();
  
}

void character() {
  if (keyPressed) {
    if (key == 'w') {
      animation1.display(xpos, ypos);
      if (by <= -3) {
        by += speed;
      }
      else {
        by = by;
        ypos -= speed;
      }
      
    } 
    else if (key == 'a') {
      animation2.display(xpos, ypos);
      if (bx <= -3) {
        bx += speed;
      }
      else {
        bx = bx;
        xpos -= speed;
      }
    }
    else if (key == 'd') {
      animation3.display(xpos, ypos);
      if (bx >= -255) {
        bx -= speed;
      }
      else {
        bx = bx;
        xpos += speed;
      }
    }
    else if (key == 's') {
      animation4.display(xpos, ypos);
      if (by >= -173) {
        by -= speed;
      }
      else {
        by = by;
        ypos += speed;
      }
    }
  }
  else {
    animation5.display(xpos, ypos);
  }
}



// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
class Bananas {
  PShape j;
  float jxpos;
  float jypos;
  int timer = 0;
  float respawn;

  Bananas(String svgName, float tempX, float tempY, int tempTime) {
    j = loadShape("banana.svg");
    jxpos = tempX;
    jypos = tempY;
    respawn = tempTime;
  }


  void display() {
    fill(0);
    textSize(12);
    text("Treats =" + good, 10, 30);
    
    timer++;
    if(timer >=respawn) {
      jxpos = random(width);
      jypos = random(height);
      timer = 0;
    }
    
    
    
    float jDist = dist(xpos, ypos, jxpos, jypos);
    if (jDist < 20) {
      good = 1 ;
    } 
    else if (jDist > 20 && good != 1) {
      jxpos += random(0, 0.9);
      if (xpos >width + ypos) {
        xpos = ypos;
      }
      shapeMode(CENTER);
      shape(j, jxpos, jypos, 20, 20);
    }
  }
}

class Bunny {
  PShape n;
  float nxpos;
  float nypos;
  
  int nradius = 30; // bones bounce off wall
  float nX = 110;
  float nspeed = 0.9;
  int ndirection = 1;


  Bunny(String svgName, float tempX, float tempY) {
    n = loadShape("bunny.svg");
    nxpos = tempX;
    nypos = tempY;
  }


  void display() {
    fill(0);
    textSize(12);
    text("Danger =" + bad, 10, 50);
    float nDist = dist(xpos, ypos, nxpos, nypos);
    if (nDist < 20) {
      bad = 1;
    } 
    else if (nDist > 20 && bad != 1) {
      nxpos += random(0, 2.0);
      if (xpos >width + ypos) {
        xpos = ypos;
      }
      shapeMode(CENTER);
      shape(n, nxpos, nypos, 30, 30);
    }
  }
  void bounce() {

    float nDist = dist(xpos, ypos, nX, nradius); //collide
    if (nDist < 20) {
      bad = 1;
    } 
    else if (nDist > 20 && bad != 1) {
      nX += nspeed * ndirection;
      if (( nX > width-nradius) || (nX < nradius)) {
        ndirection = -ndirection; //flip
      }
      if (ndirection == 1) {
        //shapeMode(RADIUS);
        shape(n, nX, nradius, nradius, nradius); //face right
      } 
      else {
        shape(n, nX, nradius, nradius, nradius); // face left
      }
    }
  }
}


class DogBones {
  PShape g;
  float gxpos;
  float gypos;



  DogBones(String svgName, float tempX, float tempY) {
    g = loadShape("bone.svg");
    gxpos = tempX;
    gypos = tempY;
  }


  void display() {
    fill(0);
    textSize(12);
    text("Treats =" + good, 10, 30);
    float bDist = dist(xpos, ypos, gxpos, gypos);
    if (bDist < 20) {
      good = 1;
    } 
    else if (bDist > 20 && good != 1) {
      gxpos += random(0, 0.8);
      if (xpos >width + ypos) {
        xpos = ypos;
      }
      shapeMode(CENTER);
      shape(g, gxpos, gypos, 30, 30);
    }
  }
}

class Frogs {
  PShape f;
  //  float fxpos;
  //  float fypos;
  int startX;
  int startY;
  int stopX;
  int stopY;
  //    float startrandX = random(0, startX);
  //    float startrandY = random(0, startY);
  //    float stoprandX = random(0, stopX);
  //    float stoprandY = random(0, stopY);
  //
  //    float fxpos = startrandX;//startX
  //    float fypos = startrandY;//startY
  float fxpos;
  float fypos;

  float step = 0.005;
  float pct = 0.0;

  int fradius = 20; // bones bounce off wall
  float fX = 120;
  float fspeed = 0.5;
  int fdirection = 1;



  Frogs(String svgName, int tempstrX, int tempstrY, int tempstpX, int tempstpY) {
    f = loadShape("frog.svg");
    startX = tempstrX;
    startY = tempstrY;
    stopX = tempstpX;
    stopY = tempstpY;
  }

  void display() {

    if (pct < 1.0) { // tween
      fxpos = startX + ((stopX - startX) * pct);
      fypos = startY + ((stopY - startY) * pct);
      pct += step;
    }
    fill(0);
    textSize(12);
    text("Danger =" + bad, 10, 50);
    float fDist = dist(xpos, ypos, fxpos, fypos);
    if (fDist < 20) {
      bad = 1;
    } 
    else if (fDist > 20 && bad != 1) {
      fxpos += random(0, 2.0);
      if (xpos >width + ypos) {
        xpos = ypos;
      }
      shapeMode(CENTER);
      shape(f, fxpos, fypos, 20, 20);
    }
  }
  void bounce() {

    float fDist = dist(xpos, ypos, fX, fradius); //collide
    if (fDist < 20) {
      bad = 1;
    } 
    else if (fDist > 20 && bad != 1) {
      fX += fspeed * fdirection;
      if (( fX > width-fradius) || (fX < fradius)) {
        fdirection = -fdirection; //flip
      }
      if (fdirection == 1) {
        //shapeMode(RADIUS);
        shape(f, fX, fradius, fradius, fradius); //face right
      } 
      else {
        shape(f, fX, fradius, fradius, fradius); // face left
      }
    }
  }
}

class Mushrooms {
  PShape m;
  float mxpos;
  float mypos;
  
  int mradius = 20; // bones bounce off wall
  float mX = 40;
  float mspeed = 0.5;
  int mdirection = 1;


  Mushrooms(String svgName, float tempX, float tempY) {
    m = loadShape("mushroom.svg");
    mxpos = tempX;
    mypos = tempY;
  }


  void display() {
    fill(0);
    textSize(12);
    text("Danger =" + bad, 10, 50);
    float mDist = dist(xpos, ypos, mxpos, mypos);
    if (mDist < 20) {
      bad = 1;
    } 
    else if (mDist > 20 && bad != 1) {
      mxpos += random(0, 2.0);
      if (xpos >width + ypos) {
        xpos = ypos;
      }
      shapeMode(CENTER);
      shape(m, mxpos, mypos, 30, 30);
    }
  }
  void bounce() {

    float wDist = dist(xpos, ypos, mX, mradius); //collide
    if (wDist < 20) {
      bad = 1;
    } 
    else if (wDist > 20 && bad != 1) {
      mX += mspeed * mdirection;
      if (( mX > width-mradius) || (mX < mradius)) {
        mdirection = -mdirection; //flip
      }
      if (mdirection == 1) {
        //shapeMode(RADIUS);
        shape(m, mX, mradius, mradius, mradius); //face right
      } 
      else {
        shape(m, mX, mradius, mradius, mradius); // face left
      }
    }
  }
}




