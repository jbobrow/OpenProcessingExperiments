
int numC = 100;
sineCircle[] cc;


///////////////////////////////////////
void setup() {
  size(800, 600);
  smooth(8);
  frameRate(100);
  noStroke();

  cc = new sineCircle[numC];
  for (int i=0;i<numC;i++) {
    cc[i] = new sineCircle();
  }
}


///////////////////////////////////////
void draw() {
  background(103, 138, 173);
  for (int i=0;i<numC;i++) {
    cc[i].rotation();
    cc[i].flux();
    cc[i].move();
    cc[i].cText(i);
    //cc[i].portal
    cc[i].display();
  }
}


///////////////////////////////////////
class sineCircle {
  int numSpike;
  int numPoint;
  PVector center;
  float rad;
  float angle;
  color c;
  boolean grow = true;
  boolean xU = false;
  boolean yU = false;
  float xspeed = random(-5,5);
  float yspeed = random(-5,5);


  //////////////
  sineCircle() {
    numSpike =int(random(4, 10));
    numPoint = 180;
    rad = random(width/10);
    center = new PVector(random(rad, width-rad), random(rad, height-rad));
    angle = random(TWO_PI);
    c = color(random(255), random(255), random(255), random(127,255));
  }

  //////////////
  void rotation() {
    angle+=0.05;
  }
  //////////////
  void flux() {

    float maxR = width/10;
    float minR = width/20;

    if (grow) {
      rad+=0.5;
    }
    else {
      rad-=0.5;
    }
    if (rad>maxR) {
      grow=false;
    }
    if (rad<minR) {
      grow=true;
    }
  }

  //////////////
  void move() {
    float f = random(0.8,1.05);
  
    if (xU) {
      center.x-=xspeed;
    }
    else {
      center.x+=xspeed;
    }
    if (yU) {
      center.y-=yspeed;
    }
    else {
      center.y+=yspeed;
    }

    if (center.x>=width-rad||center.x<=rad) {
      xU=!xU;
      grow=false;
      xspeed*=f;

    }
    if (center.y>=height-rad||center.y<=rad) {
      yU=!yU;
      grow=false;
      yspeed*=f;
      

    }
//    print("\n");
//    println(center.x-rad,center.y-rad);
//    println(center.x+rad,center.y+rad);
      println(xspeed,yspeed);
  }
  
  //////////////
  void cText(int num) {
    String cText = nf(num,3);
    color tColor = color(255-red(c),255-green(c),255-blue(c),255);
    fill(tColor);
    textSize(rad/2);
    textAlign(CENTER,CENTER);
    text(cText,center.x,center.y);
    
  }
  
  //////////////
  void display() {
    numSpike =int(random(4, 100));
    float pA = TWO_PI/numPoint;
    float rA = pA*numSpike ;
    float shake = random(1, 100);

    beginShape();
    fill(c);
    for (int i=0;i<numPoint;i++) {
      float dR = rad*(1-sin(rA*i)/shake);
      float x = dR*cos(pA*i + angle);
      float y = dR*sin(pA*i + angle);

      vertex(x+center.x, y+center.y);
    }
    endShape(CLOSE);
  }
}

////////////
void keyPressed() {
  if (key=='p'||key=='P') {
    noLoop();
  }
  if (key=='o'||key=='O') {
    loop();
  }
}
////////////
