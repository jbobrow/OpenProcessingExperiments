
///////////////////////
//HanByul Jo  09.2012//
//////////////////////


Particle[] ps;

void setup() {

  size(500, 500); 

  //number of particles
  ps = new Particle[150];

  for (int i=0; i<ps.length; i++) {
    ps[i] = new Particle(random(width/2-10, width/2), random(height/2-10, height/2));
  }

  background(255);
}

void draw() {

  for (int i=0; i<ps.length; i++) {
    ps[i].draw();
    ps[i].move();
  }
}


void mousePressed() {
   //reset
  for (int i=0; i<ps.length; i++) {
    ps[i].mousePressed();
  }
}

class Particle {

  float x;
  float y;

  float rot;

  //minimum value nad maximum value for diameter
  float minVal;
  float maxVal;

  //diameter
  float q;

  // angle keeps changing
  float a;


  //standard for making curve
  float norm;

  //for color
  color[] cs;
  int cn;

  //thickness
  float d;


  Particle(float x, float y) {

    this.x = x;
    this.y = y;

    this.rot = random(0, 2*PI);

    minVal = 5;
    maxVal = 30;

    this.a = PI;
    this.norm = random(0.01, 0.03);
    this.q = random(minVal, maxVal);
    this.cs = new color[3];
    cs[0]  = color(random(0, 255), 0, 0, random(150, 255));
    cs[1]  = color(0, random(0, 255), 0, random(150, 255));
    cs[2]  = color(0, 0, random(0, 255), random(150, 255));

    this.cn = 0;
    this.d = random(5, 20);
  }


  void draw() {

    pushMatrix();
    translate(x, y);
    rotate(rot);


    fill(cs[cn]);
    noStroke();
    ellipse(cos(a)*q, sin(a)*q, d, d);

    // fill(255, 0, 0);
    // ellipse(0, 0, 20, 20);
    popMatrix();
  }

  void move() {

    
    //make wooble wooble ~* 
    a-=norm;
    if (a <= 0 ) {

      a  = PI;
      norm *= -1;
      float tempX = q;
      q = random(minVal, maxVal);
      x += (tempX+q)*cos(rot);
      y+=sin(rot)*(tempX+q);
      //  d-=0.5;
    }

    if ( a >= 2*PI) {
      a  = PI;
      norm *= -1;
      float tempX = q;
      //  d-=0.5;


      q = random(minVal, maxVal);
      x += (tempX+q)*cos(rot);
      y+=sin(rot)*(tempX+q);
    }
  }


  void reset() {
    this.x = width/2;
    this.y = height/2;

    this.rot = random(0, 2*PI);

    this.a = PI;
    this.norm = random(0.005, 0.03);
    this.q = random(minVal, maxVal);
    this.d = 10;

    cn++;
    cn%=cs.length;
  }


  void mousePressed() {
    //reset whole values
    fill(random(200, 255));
    rect(0, 0, width, height);
    reset();
  }
}
