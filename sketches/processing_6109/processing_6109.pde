

Background b1, b6;
dad b2;
greenMachine b3, b8, b10, b11, b12, b13;
siren b4;
buttons b5, b9, b14;
heart b7;
fire b15, b16, b17;

//SHAPE
PFont f;
PShape s, h, a , p, e, ss, hh, aa, pp, ee, sh, sa, sp, se, hs;

void setup() {
  background(0);
  smooth();
  noStroke();
  size(480, 320);

  //SHAPE
  s = loadShape ("bombs.svg");
  h = loadShape ("arms.svg");
  a = loadShape ("neck.svg");
  p = loadShape ("legs.svg");
  e = loadShape ("sparks.svg");
  ss = loadShape ("Daddy.svg");
  hh = loadShape ("satellite.svg");
  aa = loadShape ("background1.svg");
  pp = loadShape ("command.svg");
  ee = loadShape ("dad arms.svg");
  sh = loadShape ("dad body.svg");
  sa = loadShape ("dad head.svg");
  sp = loadShape ("dad ground.svg");
  se = loadShape ("bubble.svg");
  hs = loadShape ("fire.svg");

  //FONT
  f = loadFont ("Dialog-48.vlw");

  b1 = new Background (0, 0);
  b2 = new dad (-1, 22);
  b3 = new greenMachine (320, 150);
  b4 = new siren (360, 250);
  b5 = new buttons (350, 130);
  b6 = new Background (410, 160);
  b7 = new heart (280, 30);
  b8 = new greenMachine (150, 160);
  b9 = new buttons (140, 100);
  b10 = new greenMachine (100, 100);
  b11 = new greenMachine (100, 85);
  b12 = new greenMachine (100, 115);
  b13 = new greenMachine (100, 130);
  b14 = new buttons (140, 122);
  b15 = new fire (-56, 132);
  b16 = new fire (-169, 114);
  b17 = new fire (160, 114);
}

void draw() {
  //BACKGROUND
  float bgr = map (mouseX, 0, width, 159, 9);
  float bgg = map (mouseX, 0, width, 201, 25);
  float bgb = map (mouseX, 0, width, 247, 40);
  background (bgr, bgg, bgb);

  b1.sky();

  //DAD
  b2.dadArms();
  b2.dadBody();
  b2.dadHead();
  b2.dadGround();
  if (dist(b2.x, b2.y, b3.x, b3.y) < (250)) {
    b7.bubbles();
    b15.flame();
    b16.flame();
    b17.flame();
  } 
  else {
  }
  b10.leftredbutton1();
  b10.rightredbutton1();
  b11.leftredbutton1();
  b11.rightredbutton1();
  b12.leftredbutton1();
  b12.rightredbutton1();
  b13.leftredbutton1();
  b13.rightredbutton1();
  b9.topleftbutton1();
  b9.toprightbutton1();
  b9.bottomleftbutton1();
  b9.bottomrightbutton1();
  b14.topleftbutton1();
  b14.toprightbutton1();
  b14.bottomleftbutton1();
  b14.bottomrightbutton1();
  float bgr1 = map (mouseX, width, 0, 215, 255);
  float bgg1 = map (mouseX, width, 0, 31, 146);
  float bgb1 = map (mouseX, width, 0, 38, 216);
  fill(bgr1, bgg1, bgb1);
  ellipse((210), (100), 16, 12); 
  ellipse((180), (100), 16, 12);

  //ROBOT
  b3.body();
  b3.command();
  b3.arms();
  b3.neck();
  b3.legs();
  b3.eyes();
  b3.mouth();
  b3.sparks();
  b3.retinas();
  b3.leftredbutton();
  b3.rightredbutton();
  b4.ease();
  b5.topleftbutton();
  b5.toprightbutton();
  b5.bottomleftbutton();
  b5.bottomrightbutton();
  b6.satellite();
}



