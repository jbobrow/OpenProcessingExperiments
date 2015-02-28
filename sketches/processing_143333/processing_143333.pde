
//Which curve
int mode=0;
int modes=3;
Curve curve;


//possible of intervals
float duration;
int count;
boolean isOn;

//drawing the curve
float x, y;


float r = 0;
float theta = 0;
float c= random(50, 100);
float p=0;


void setup() {
  size(800, 700, P2D);
  smooth();
  reset();
}

void draw() {
  //establish the reset and counter
  if (isOn) fill(242, 150, 30);
  else fill(255);



  if (count>=duration*0.01) {//is this to make sure the duration is always going?
    duration=calc();
    isOn = !isOn;
    count=0;
    display();//WHAT IS THIS FOR??????
  }
  //Start the counter
  count++;
  //  println("D=" + duration);
  //  println("Y="+ y);
}

void display() {
  x++;
  y = height-duration;
  noStroke(); 
  fill(255, 0, 0);
  stroke(255);
  line(x, y, y, x);
  stroke(0);
  strokeWeight(1);

  float a = r*cos(theta);
  float b = r*sin(theta);

  stroke(255, r*2, 0, 70);
  line(x+width/2, y+height/2, x, y);
  line(x+width/2, y+height/2, y , x);


  noStroke();
  theta+=.1;
  r+=.1;
  p--;
  println(x);

  if (x>=200) {
    background(0);
    r=0;
    theta=0;
    p=0;
  }
  println("color"+ c);
}

float calc() {
  return map(curve.run(), 0, height, 0, width);
}


void reset() {
  background(50, 255, 255);
  x = 0;

  float t, speed, scale;

  switch(mode) {
  case 0: //COLON HERE!!
    t = 0;
    speed = 0.1; 
    scale = 80;   
    curve = new Bounce(t, speed, scale);
    break;

  case 1:
    t = 0;
    speed = 0.01; // rate of ascent (pacing)
    scale = 10; // how soon curve ascends (timing)
    curve = new Airplane(t, speed, scale);
    break;
    
  case 2:
    t = 0;
    speed = 0.002; // how long it takes to get to spike - the smaller the number, the longer it takes
    scale = 200; // sharpness of spike
    curve = new Linear(t, speed, scale);
    break;
  }


  //  println("MODE: " + curve.getClass());
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    mode++;
    break; 
  case LEFT:
    mode--;
    break;
  }

  if (mode >= modes || mode < 0) {
    mode = (modes + mode%modes)%modes;
  }

  reset();
}

class Curve {
  float t, speed, scale;

  Curve( float _t, float _speed, float _scale ) {
    t = _t;
    speed = _speed;
    scale = _scale;
  }

  Curve() { 
  }

  float run() {
    return 0;
  }
}

class Linear extends Curve { 
  Linear(float t, float speed, float scale) {
    super(t, speed, scale);
  }
  float run() {
    t+=speed;
    return t*scale;
  }
}

class Airplane extends Curve {
  Airplane(float t, float speed, float scale) {
    super(t, speed, scale);
  }

  float run() {
    t += speed;
    return pow(scale, t);
  }
}

class RocketShip extends Curve {
  RocketShip(float t, float speed, float scale) {
    super(t, speed, scale);
  }

  float run() {
    t += speed;
    return pow(t, scale);
  }
}

class Logarithmic extends Curve {
  Logarithmic(float t, float speed, float scale) {
    super(t, speed, scale);
  }
  float run() {
    t+=speed;
    return log(t)*scale;
  }
}

class Sigmoid extends Curve {
  Sigmoid(float t, float speed, float scale) {
    super(t, speed, scale);
  }
  float run() {
    t += speed;
    return height/(1+exp(-t));
  }
}

class Bounce extends Curve {
  float a;
  Bounce(float t, float speed, float scale) {
    super(t, speed, scale);
    a = scale*4;
  }
  float run() {
    t+=speed;
    float n = sin(t)*a + a;
    return log(n)*(scale);
  }
}



