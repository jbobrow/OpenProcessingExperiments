
float sinc, mminc, yinc, hinc, dinc, moinc;
PImage k, minuteG, minuteW, yearG, metal, hourG, dayG, tinyG, monthG, g1;
gears[] gs;

void setup() {
  size(800,600,P3D);
  k = loadImage("key.png"); 
  minuteG = loadImage("minute.png");
  minuteW = loadImage("minute_wheel.png");
  yearG = loadImage("year.png");
  metal = loadImage("metal.png");
  hourG = loadImage("hour.png");
  tinyG = loadImage("tinyCog.png");
  monthG = loadImage("month.png");
  g1 = loadImage("g1.png");
  gs = new gears[50];
  constructGears(50);
}

void draw() {
  int birth = 1991;
  background(255);
  float mil = millis() % 1000;
  float s = second();
  float y = year();
  float h = minute();
  float d = hour();
  float mo = month();
  
  mminc = map(mil,0, 1000,0, 360);
  sinc = map(s, 0, 60, 0, 360);
  yinc = map(y-birth, 1, 100, 0, 360);
  hinc = map(h, 0, 60, 0, 360);
  dinc = map(d, 0, 24, 0, 360);
  moinc = map(mo, 0, mo*43829.1, 0, 360); //2nd value => minutes in month
   
  randomHand();
  secondHand();
  minuteHand();
  image(metal, width/2-metal.width, 15);
  dayHand();
  hourHand();
  monthHand();
  yearHand();
}

//key - full rotation every second
void secondHand() { 
  pushMatrix();
    translate(675, height/2);
    rotateX(radians(mminc));
    translate(-k.width/2, -k.height/2); //rotate around images center
    image(k, 0, 0);
  popMatrix();
}

//large redCog - full rotation every minute
void minuteHand() {
  pushMatrix();
    translate(600,400);
    image(minuteW, -minuteG.width/2, -minuteG.height/2);
    rotateZ(radians(sinc));
    translate(-minuteG.width/2, -minuteG.height/2);
    image(minuteG, 0, 0);
  popMatrix();
}

//tiny red cog - full rotation every hour
void hourHand() { 
  pushMatrix();
    translate(225, 230);
    rotateZ(radians(-hinc));
    translate(-tinyG.width/2, -tinyG.height/2, 50); //rotate around images center
    image(tinyG, 0, 0);
  popMatrix();
}

//cog with yellow marker - full rotation every day
void dayHand() { 
  pushMatrix();
    translate(150, height/2 + 20);
    rotateZ(radians(dinc));
    translate(-hourG.width/2, -hourG.height/2, -100); //rotate around images center
    image(hourG, 0, 0);
  popMatrix();
}


//large center cog with human years - full rotate every 100 years
void yearHand() { 
  pushMatrix();
    translate(width/2, height/2);
    rotateZ(radians(-yinc));
    translate(-yearG.width/2, -yearG.height/2, 125); //rotate around images center
    image(yearG, 0, 0);
  popMatrix();
}

//large center cog with human years - full rotate every 100 years
void monthHand() { 
  pushMatrix();
    translate(250, 125);
    rotateZ(radians(moinc));
    translate(-monthG.width/2, -monthG.height/2, 90); //rotate around images center
    image(monthG, 0, 0);
  popMatrix();
}

//large center cog with human years - full rotate every 100 years
void randomHand() { 
  for(int i = 0; i < 50; i++) {
    pushMatrix();
      gears g = gs[i]; 
      translate(g.x, g.y);
      rotateZ(radians(g.rot));
      g.rot+=g.inc;
      translate(-g1.width/2, -g1.height/2, g.z); //rotate around images center
      image(g1, 0, 0);
    popMatrix();
  }
}

void constructGears(int n) {
  for(int i = 0; i < n; i++) {
    gears newg = new gears(random(-800, width+800), random(-600, height+600), random(-1000, -500), random(-1, 1));
    gs[i] = newg; 
  }
}

class gears {
  float x, y, z, inc, rot;
  gears(float x_, float y_, float z_, float inc_) {
     x = x_;
     y = y_;
     z = z_;
     inc = inc_;
     rot = 0;
  }
}


