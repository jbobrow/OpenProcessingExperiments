
//Arrays
PImage[] head = new PImage[5];
PImage[] body = new PImage[4];
PImage[] legs = new PImage[4];
PImage[] arm = new PImage[5];
String[] headstring = new String[5];
String[] bodystring = new String[4];
String[] legsstring = new String[4];
String[] armstring = new String[5];
int headVar = 0;
int bodyVar = 0;
int legsVar = 0;
int armLVar = 0;
int armRVar = 0;

PFont Bookman;
PFont Verdana;
int textType;
float rt; 
float HUE;

//variables
int m; //(mirror)
//body
float x;
float y;
float r;
float s;
//head
float rh;
float sh;
//legs
float rl;
float sl;
//left arm
float raL;
float saL;
//right arm
float raR;
float saR;

void setup() {
  //loadImages
  head[0] = loadImage("fishhead.png");
  head[1] = loadImage("Giraffehead.png");
  head[2] = loadImage("birdhead.png");
  head[3] = loadImage("monkeyhead.png");
  head[4] = loadImage("elephanthead.png");
  body[0] = loadImage("fishbody.png");
  body[1] = loadImage("body_barrel.png");
  body[2] = loadImage("sheepbody.png");
  body[3] = loadImage("penguinbelly.png");
  legs[0] = loadImage("fishleg.png");
  legs[1] = loadImage("ladylegs.png");
  legs[2] = loadImage("squidlegs.png");
  arm[0] = loadImage("Giraffearm.png");
  arm[1] = loadImage("manarm.png");
  arm[2] = loadImage("batwing.png");
  arm[3] = loadImage("finarm.png");
  arm[4] = loadImage("elephantfoot.png");
  //Strings
  headstring[0] = ("fish head");
  headstring[1] = ("long neck");
  headstring[2] = ("bird brain");
  headstring[3] = ("monkey");
  headstring[4] = ("trunk nose");
  bodystring[0] = ("scale back");
  bodystring[1] = ("barrel belly");
  bodystring[2] = ("wooly");
  bodystring[3] = ("feather belly");
  legsstring[0] = ("flipper foot");
  legsstring[1] = ("stocking legs");
  legsstring[2] = ("inky");
  armstring[0] = ("knobby arm");
  armstring[1] = ("strong arm");
  armstring[2] = ("dragon wing");
  armstring[3] = ("flipper");
  armstring[4] = ("big foot");
  //loadFonts
  Bookman = loadFont("BookmanOldStyle-BoldItalic-48.vlw");
  Verdana = loadFont("Verdana-12.vlw");
  //setup
  size(640, 480);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  imageMode(CENTER);
}

void draw(){

  headVar = round(random(-.5, 4.4));
  bodyVar = round(random(-.5, 3.4));
  legsVar = round(random(-.5, 2.4));
  armLVar = round(random(-.5, 4.4));
  armRVar = round(random(-.5, 4.4));

  //body
  r = random(-PI/2, PI/2);
  s = random(.5, .7);
  x = random(.2*width, .8*width);
  y = (random(.4*height, .8*height) + s * height)/2;
  //head
  rh = random(-PI/8, PI/8);
  sh = 1;
  //arms
  raL = random(PI/7, 6 * PI/7);
  saL = random(.9, 1);
  raR = random(8*PI/7, 13*PI/7);
  saR = random(.9, 1);
  //legs
  rl = random(-PI/8, PI/8);
  sl = 1;//random(.7, 1);

  m = round(random(0,1));
  if(m == 0){
    m = -1;
  }

  HUE = random(0, 360);

  background(HUE, random(0,10), 50);

  //background text
  textType = round(random(0,1));
  textFont(Bookman);

  //Text style 0
  if(textType == 0){
    for(int a = 0; a < 2; a ++){

      //Body String
      m = round(random(0,1));
      if(m == 0){
        m = -1;
      }
      pushMatrix();
      translate(x, y);
      rotate(random(0, 2*PI));
      scale(random(.8, 1.5 * m));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      text(bodystring[bodyVar], round(random(100, 300) * m) - 50, 0);
      popMatrix();

      //Head String
      m = round(random(0,1));
      if(m == 0){
        m = -1;
      }
      pushMatrix();
      translate(x, y);
      rotate(random(0, 2*PI));
      scale(random(.8, 1.5 * m));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      text(headstring[headVar], round(random(100, 300) * m) - 50, 0);
      popMatrix();

      //Left Arm String
      m = round(random(0,1));
      if(m == 0){
        m = -1;
      }
      pushMatrix();
      translate(x, y);
      rotate(random(0, 2*PI));
      scale(random(.8, 1.5 * m));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      text(armstring[armLVar], round(random(100, 300) * m) - 50, 0);
      popMatrix();

      //Right Arm String
      m = round(random(0,1));
      if(m == 0){
        m = -1;
      }
      pushMatrix();
      translate(x, y);
      rotate(random(0, 2*PI));
      scale(random(.8, 1.5 * m));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      text(armstring[armRVar], round(random(200, 350) * m) - 50, 0);
      popMatrix();

      //Legs String
      m = round(random(0,1));
      if(m == 0){
        m = -1;
      }
      pushMatrix();
      translate(x, y);
      rotate(random(0, 2*PI));
      scale(random(.8, 1.5 * m));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      text(legsstring[legsVar], round(random(100, 300) * m) - 50, 0);
      popMatrix();
    }
  }

  //Text style 1
  if(textType == 1){
    rt = random(-PI/2, PI/2);
    //head
    for(int a = 0; a < 15; a ++){
      pushMatrix();
      translate(random(0, width), random(0, height));
      rotate(rt);
      scale(random(-1, 1.5));
      fill(HUE + random(-5, 5), random(0, 15), random(80, 100), random(1, 50));
      textSize(random(1, 30));
      if(a < 3){
        text(bodystring[bodyVar], 0, 0);
      }
      if((a >= 3) && (a < 6)){
        text(headstring[headVar], 0, 0);
      }
      if((a >= 6) && (a < 9)){
        text(armstring[armLVar], 0, 0);
      }
      if((a >= 9) && (a < 12)){
        text(armstring[armRVar], 0, 0);
      }
      if((a >= 12) && (a < 15)){
        text(legsstring[legsVar], 0, 0);
      }
      popMatrix();
    }
  }

  //Creature
  m = round(random(0,1));
  if(m == 0){
    m = -1;
  }


  pushMatrix(); //creature push
  translate(x, y);
  rotate(r);
  scale(s);

  //arm left
  pushMatrix();
  translate(-.2 * body[bodyVar].width, -.2 * body[bodyVar].width);
  rotate(raL);
  scale(saL);
  image(arm[armLVar], 0,.5 * arm[armLVar].height - 30);
  popMatrix();

  //arm right
  pushMatrix();
  translate(.2 * body[bodyVar].width, -.2 * body[bodyVar].width);
  rotate(raR);
  scale(-1, 1);
  scale(saR);
  image(arm[armRVar], 0, .5 * arm[armRVar].height - 30);
  popMatrix();

  //legs
  pushMatrix();
  translate(0, .4 * body[bodyVar].height);
  rotate(rl);
  scale(m*sl, sl);
  image(legs[legsVar], 0, .5* legs[legsVar].height - 75);
  popMatrix();

  //main body
  pushMatrix();

  scale(m, 1);
  image(body[bodyVar], 0, 0);
  popMatrix();

  //head
  pushMatrix();
  m = round(random(0,1));
  if(m == 0){
    m = -1;
  }
  translate(0, -.4 * body[bodyVar].height);
  rotate(rh);
  //translate(0, -.3 * head[headVar].height * sh);
  scale(sh * m, sh);
  image(head[headVar], 0, -.5 * head[headVar].height + 50);
  popMatrix();

  popMatrix();//creature pop
  noLoop();
}

void mouseReleased(){
  loop();
}






