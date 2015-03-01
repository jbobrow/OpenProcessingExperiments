
/* @pjs font="SempliceRegular.ttf"; */

/**
Coded by Kof @ 
Sun Oct 12 18:45:20 CEST 2014



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
*/


PFont font;
float fps = 60;

// more disc ~= more CPU
int NUMBER_OF_DISCS = 2;
int ALPHA = 200;

PGraphics arc, nois;

void setup() {
  size(320, 240);
  frameRate(fps);
  font = loadFont("SempliceRegular-8.vlw");
  textFont(font, 8);


  nois = createGraphics(640, 640);
  nois.beginDraw();
  for (int i = 0; i < nois.width; i++)
    for (int ii = 0; ii < nois.height; ii++) {
      nois.set(i, ii, color((int)random(0, 15)));
    }
  nois.endDraw();

  arc = createGraphics(180, 180);
  arc.beginDraw();
  arc.smooth();
  arc.translate(arc.width/2, arc.width/2);
  arc.fill(255);
  arc.noStroke();
  arc.arc(0, 0, arc.width-20, arc.width-20, 0, THIRD_PI/2);
  arc.filter(BLUR, 1);
  arc.endDraw();

  imageMode(CENTER);
  background(0);
}

float angle = 12, angle2 = 0;
float rx = 0, ry = 0;
void draw() {
  blendMode(BLEND);

  background(10);

  smooth();
  strokeWeight(2);
  fill(255);

  textAlign(CENTER);
  fill(255);
  fps+=(frameRate-fps)/120.0;
  text(nfs(fps, 1, 2) + " fps", width/2, height/2+100);

  for (int i = 0; i < NUMBER_OF_DISCS; i++) {
    boolean odd = (frameCount+i)%(1)==0?true:false;

    if (odd) {
      angle = pow(millis()/(1000.0+(i*10.0)), 1.54+(i/10000.0));///((sin(millis()/(90.0135))+1.0)*TWO_PI*0.000001);
    }

    rx = random(-160, 160);
    ry = random(-160, 160);

    float sx = width/2.0+random(-10, 10)/800.0;
    float sy = height/2.0+random(-10, 10)/800.0-20;


    pushMatrix();
    translate(sx, sy);
    noStroke();
    pushMatrix();

    float s = 200;

    rotate((float)(angle)+TWO_PI/(i+1.0));

    pushMatrix();
    angle2 =pow(millis()/50000.0, 2);
    rotate(THIRD_PI+angle2);

    tint(255, 12, 0, ALPHA);
    image(arc, 0, 0, s, s);
    popMatrix();

    pushMatrix();
    angle2 =pow(millis()/50000.0, 2);
    rotate(THIRD_PI*3+(3*angle2));
    tint(0, 255, 12, ALPHA);
    image(arc, 0, 0, s, s);
    popMatrix();

    pushMatrix();
    angle2 =pow(millis()/50000.0, 2);
    
    rotate(THIRD_PI*5+(5*angle2));
    tint(12, 0, 255, ALPHA);
    image(arc, 0, 0, s, s);
    popMatrix();

    popMatrix();
    popMatrix();
  }  


  blendMode(BLEND);
  pushMatrix();
  translate(width/2, height/2-20);
  stroke(255);
  line(-5, 0, 5, 0);
  line(0, -5, 0, 5);
  noFill();

  popMatrix();

  blendMode(ADD);

  pushMatrix();
  noTint();
  translate(-nois.width/2+rx, -nois.height/2+ry);
  pushMatrix();
  translate(nois.width/2, nois.height/2);  
  image(nois, width/2, height/2, random(640, 800), random(640, 800));
  popMatrix();
  popMatrix();
}


