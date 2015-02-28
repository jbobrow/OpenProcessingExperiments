
PFont f;

int num = 100;           // total number of particles

// blackout - four cycles, black, colour1, white, colour2
String blackout =  "colour2";

Particle[] pArr;


void setup() {
  size(800,600); 
  f = createFont ("Verdana Bold", 16, true);
  smooth ();
      
  background(75);
  pArr = new Particle[num];

  for (int i=0;i<num;i++) {
    float r = PI*i/num;
    pArr[i] = new Particle(r);
  }

}

void draw() {
  for (int i=0;i<num;i++) {
    pArr[i].move();
  }
  fill (50, 50);
  noStroke ();
  rect (440, 550, 345, 35);
  fill (50, 50);
  noStroke ();
  rect (0, 0, width, 45);
  textFont (f, 32);
  fill (175);
  noStroke ();
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (175);
  noStroke ();
  text ("created using Processing and Processing.js", 20, 20);
  textFont (f, 16);
  fill (175);
  noStroke ();
  text ("sketch based on original code created by zenbullets.com found at abandonedart.org", 20, 40);
}

void mousePressed() {
    // manually switch blackout periods
    if (blackout == "colour1") {
      blackout = "black";
    } else if (blackout == "black")  {
      blackout = "colour2";
    } else if (blackout == "colour2")  {
      blackout = "white";
    } else if (blackout == "white")  {
      blackout = "colour1";
    }
    
    // change origin point to mouse pos
  for (int i=0;i<num;i++) {
    pArr[i].origin(mouseX, mouseY);
  }
}


class Particle {
  float ox, oy;
  float x, y;
  float xx, yy;

  float vx;
  float vy;
  int age=int(random(200));
  
  // colour
  int rc;
  int gc;
  int bc;
  int alph = 255;
  
  // line
  int maxline = 3;
  int linethick;

  Particle(float r) {
    ox = 400;
    oy = 300;
    x = ox;
    y = oy;
    
    xx = 0;            // position x'
    yy = 0;            // position y'

    vx = 2*cos(r);     // velocity x
    vy = 2*sin(r);     // velocity y

    rc = int(random(255));
    gc = int(random(175));
    bc = gc; 
  
    linethick = int(random(maxline)); 
  }
  
  void origin(float ex, float why) {
    // ox = ex;
    oy = why;
  }

  void move() {
    xx=x;
    yy=y;

    x+=vx;
    y+=vy;

    vx += (random(500)-random(500))*0.005;
    vy += (random(500)-random(500))*0.005;

    // stroke(red(i),green(i),blue(i),700);
      strokeWeight(linethick);
    if (blackout == "colour1") {
      strokeWeight(linethick * random (15));
      stroke(rc,gc,bc,alph);
    } else if (blackout == "colour2") {
      stroke(rc,gc,bc,alph);
    } else if (blackout == "black") {
      stroke(0,0,0,alph);
    } else if (blackout == "white") {
      stroke(255,255,255,alph);
    }
    
    line(ox+xx,oy+yy,ox+x,oy+y);
    line(ox-xx,oy+yy,ox-x,oy+y);

    // expiration
    age++;
    if (age>400) {
      float t = random(TWO_PI);
      x=30*sin(t);
      y=30*cos(t);
      xx=0;
      yy=0;
      vx=0;
      vy=0;
      age=0;
    }
  }
}








