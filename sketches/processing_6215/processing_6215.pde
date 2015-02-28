

Background b1;
wheel b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;
pipe b16, b17, b18, b19;
arm b20, b21, b22;
professorx b23, b24;

greenMachine [] greenMachines;

//SHAPE
PFont f;
PShape s, h, a , p, e, ss, hh, aa, pp, ee, sh, sa, sp, se, hs, ha, hp, he;

void setup() {
  background(0);
  smooth();
  noStroke();
  size(480, 320);
  int r = 300; 
  int b = 300; 

  //SHAPE
  s = loadShape ("bombs.svg");
  h = loadShape ("arms.svg");
  a = loadShape ("neck.svg");
  p = loadShape ("legs.svg");
  e = loadShape ("sparks.svg");
  ss = loadShape ("background.svg");
  hh = loadShape ("command.svg");
  aa = loadShape ("big belt wheel.svg");
  pp = loadShape ("small belt wheel.svg");
  ee = loadShape ("pipe1.svg");
  sh = loadShape ("pipe2.svg");
  sa = loadShape ("pipe3.svg");
  sp = loadShape ("pipe4.svg");
  se = loadShape ("arm top.svg");
  hs = loadShape ("arm mid.svg");
  ha = loadShape ("arm bot.svg");
  hp = loadShape ("Professor X.svg");
  he = loadShape ("quote bubble.svg");

  //FONT
  f = loadFont ("Dialog-48.vlw");

  b1 = new Background (0, 0);
  b5 = new wheel (31, 275);
  b6 = new wheel (448, 275);
  b7 = new wheel (111, 262);
  b8 = new wheel (141, 262);
  b9 = new wheel (125, 287);
  b10 = new wheel (235, 259);
  b11 = new wheel (222, 287);
  b12 = new wheel (252, 287);
  b13 = new wheel (324, 262);
  b14 = new wheel (354, 262);
  b15 = new wheel (339, 287);
  b16 = new pipe (339, 287);
  b17 = new pipe (339, 287);
  b18 = new pipe (339, 287);
  b19 = new pipe (339, 287);
  b20 = new arm (0, 0);
  b21 = new arm (0, 0);
  b22 = new arm (0, 0);
  b23 = new professorx (50, 50);
  b24 = new professorx (50, 50);

  greenMachines = new greenMachine [10];
  for (int i = 0; i < greenMachines.length; i++) {
    b = b - 23; 
    float angle = radians(b); 
    float x = -360 + angle * r; 
    greenMachines[i] = new greenMachine(x, -170); 
  }
}

void draw() {
  //BACKGROUND
  b1.sky();

  //WHEELS
  b5.big();
  b6.big();
  b7.small();
  b8.small();
  b9.small();
  b10.small();
  b11.small();
  b12.small();
  b13.small();
  b14.small();
  b15.small();

  //PIPES
  b16.one();
  b17.two();
  b18.three();
  b19.four();

  //MECHANICAL ARM
  b20.top();
  b21.mid();
  b22.bot();

  //ROBOT
  scale(0.4);
  pushMatrix();
  for(int i = 0; i < greenMachines.length; i++) {  
    greenMachines[i].body(); 
    greenMachines[i].command();  
    greenMachines[i].arms(); 
    greenMachines[i].legs();
    greenMachines[i].eyes(); 
    greenMachines[i].mouth(); 
    greenMachines[i].sparks(); 
    greenMachines[i].retinas(); 
    greenMachines[i].leftredbutton(); 
    greenMachines[i].rightredbutton(); 
    greenMachines[i].topleftbutton();
    greenMachines[i].toprightbutton();
    greenMachines[i].bottomleftbutton();
    greenMachines[i].bottomrightbutton();
  } 
  popMatrix();

  //PROFESSOR X
  b23.move();
  if (dist(b22.x, b22.y, b23.x, b23.y) < (150)) {
    b24.quote();
  }
  else {
  }
}

