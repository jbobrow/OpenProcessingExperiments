

String _title = "London 2012";
PFont _font;

PImage[] flags = new PImage [10];
Flag d_flags[] = new Flag [10];

color lightColor, darkColor; // color of sun & moon
float time = 0; 


Sun sun = new Sun();
Moon moon = new Moon();

class Sun {
  float x, y;
  float r;

  Sun() {
    x = -80;
    y = -80;
    r = 80;
  }
  void draw() {
    pushStyle();

    drawFlame(0);
    drawFlame(2);
    drawFlame(4);

    strokeWeight(5);
    stroke(darkColor);
    fill(255);

    ellipse(x, y, r, r);

    popStyle();

    x = map((time+PI/2)%(PI), 0, PI, -width/2-r, width*1.5+r)-r;
    y = map(abs(sin(time+PI/2)), 0, 1, height*4, 0)+r/2;
  }
  void drawFlame(int count) { //draw the flame of sun

    float m = 10;

    pushStyle();

    noFill();
    strokeWeight(3);
    stroke(255, 255*(9-((frameCount+count)%10))/9);

    ellipse(x, y, r*(1+((frameCount+count)%10)/m), r*(1+((frameCount+count)%10)/m));

    popStyle();
  }
}

class Moon {
  float x, y;
  float r;


  Moon() {
    x = -80;
    y = -80;
    r = 80;
  }
  void draw() {

    pushStyle();

    drawFlame(0);
    drawFlame(2);
    drawFlame(4);

    strokeWeight(5);
    stroke(255);
    fill(255);

    ellipse(x, y, r, r);

    popStyle();

    x = map((time+PI)%(PI), 0, PI, -width/2-r, width*1.5+r)+r;
    y = map(abs(cos(time+PI/2)), 0, 1, height*4, 0)+r/2;
  }
  void drawFlame(int count) {

    float m = 10;

    pushStyle();

    noFill();
    strokeWeight(3);
    stroke(255, 255*(9-((frameCount+count)%10))/9);

    ellipse(x, y, r*(1+((frameCount+count)%10)/m), r*(1+((frameCount+count)%10)/m));

    popStyle();
  }
}

class Flag {

  float x, y, s;
  PImage flag;
  boolean  out;

  Flag(PImage _flag, float _x, float _y, float _s) {
    flag = _flag;
    x = _x;
    y = _y;
    s = _s;
  }

  void draw() {
    if (out)
      return;
    image(flag, x, y);

    // move the flags
    x -= s;

    // out of bound
    if (x < - flag.width)
      out = true;
  }
}

void setup() {

  size(640, 360);

  for (int i = 0; i< 10; i++)//load flag image
  {
    flags[i]= loadImage("flag-"+String.valueOf(i+1)+".png");
  }

  frameRate(8);
  smooth();

  float distance = 0;
  for (int i = 0; i < d_flags.length; i++) {// flags in position

    distance += random(width/2);
    d_flags[i] = new Flag(flags[i], distance, random(height*0.2, height*0.6), random(1, 3));
  }

  _font = loadFont("HelveticaNeue-CondensedBold-64.vlw");    
  textFont(_font, 36);
}

void draw() {

  //time loop
  loopCycle();

  // draw the sky
  drawSky();

  for (int i = 0; i < d_flags.length; i++) {

     d_flags[i].draw();
     if (d_flags[i].out)
     d_flags[i] = new Flag(flags[i], width, random(height*0.2, height*0.6), random(1, 3));
  }

  fill(darkColor);      
  text(_title, width-(textWidth(_title)*4/3), 300);
}

void loopCycle() {
  time+=PI/360;
  time%=PI*10;
  lightColor = color(255 - abs(255*sin(time)));
  darkColor = color(abs(255*sin(time)));
}

void drawSky() {

  pushStyle();

  background(lightColor);

  sun.draw();
  moon.draw();

  stroke(lightColor);   
  for (int i = 0 ; i < 7; i++) { //baseline
    strokeWeight(10-i*1.5);
    line(0, height-i*10, width, height-i*10);
  }

  popStyle();
}



