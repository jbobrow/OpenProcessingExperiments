
//copyright Yoon-ji Kim 2014
//51-257 A
//PROJECT 1: Data Visualization, Espresso Levels
//data sourced from reference.jpg in folder

float [] percentE = {17, 30, 33, 40, 50, 66, 95, 100};

//drinks, in order from strongest
PImage espresso;
PImage macchiato;
PImage americano;
PImage cafecreme;
PImage cafebombon;
PImage mocha;
PImage conpanna;
PImage cappuccino;
PImage flatwhite;
PImage latte;

boolean overLine1 = false;
boolean locked1 = false;

float x1, y1;
int rectHt = 50;

float xOffset = 0;

void setup()
{
  size(400, 400);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  smooth();
  
  espresso = loadImage("espresso.png");
  americano = loadImage("americano.png");
  macchiato = loadImage("macchiato.png");
  cafecreme = loadImage("cafecreme.png");
  cafebombon = loadImage("cafebombon.png");
  mocha = loadImage("mocha.png");
  conpanna = loadImage("conpanna.png");
  cappuccino = loadImage("cappuccino.png");
  flatwhite = loadImage("flatwhite.png");
  latte = loadImage("latte.png");
  
  x1 = 5;
  y1 = height-1.5*rectHt;
}

void draw()
{
  background(196, 212, 193);
  fill(255);
  textSize(12);
  text("Toggle bar to adjust % amount of espresso.", width/2, 20);
  dials();
  pointer();
  showPercents();
  drinks();
  
  if(mouseX > x1-(rectHt/2) && mouseX < (x1 + rectHt/2) &&
     mouseY > y1 && mouseY < y1+(1.5*rectHt))
     {
       overLine1 = true;
     }
     else{
       overLine1 = false;
     }
}

void dials(){
  noStroke();
  fill(0);
  rect(0, height-1.5*rectHt, width, rectHt);
}

void showPercents()
{
  textSize(12);
  text("17", .05*width, height-1.75*rectHt);
  text("30", .18*width, height-1.75*rectHt);
  text("33", .26*width, height-1.75*rectHt);
  text("40", .37*width, height-1.75*rectHt);
  text("50", .5*width, height-1.75*rectHt);
  text("60", .63*width, height-1.75*rectHt);
  text("95", .85*width, height-1.75*rectHt);
  text("100", .95*width, height-1.75*rectHt);
}

void pointer(){
  strokeWeight(3);
  stroke(255);
  line(x1, y1, x1, y1+rectHt);
}

void drinks()
{
  if(x1 > .03*width && x1 <= .07*width){
    image(latte, width/2, .37*height, 220, 220);
    textSize(20);
    text("LATTE", width/2, 275);
  }
  if(x1 > .17*width && x1 <= .2*width){
    image(flatwhite, width/2, .37*height, 220, 220);
    textSize(20);
    text("FLAT WHITE", width/2, 275);
  }
  if(x1 > .24*width && x1 <=.28*width){
    image(cappuccino, width/2, .37*height, 220, 220);
    textSize(20);
    text("CAPPUCCINO", width/2, 275);
  }
  if(x1 > .34*width && x1 <= .4*width){
    image(conpanna, width/3, .37*height, 200, 200);
    image(mocha, 2*width/3, .37*height, 200, 200);
    textSize(20);
    text("CON PANNA", width/3, 275);
    text("MOCHA", 3*width/4, 275);
  }
  if(x1 > .48*width && x1 <= .54*width){
    image(cafebombon, width/2, .37*height, 220, 220);
    textSize(20);
    text("CAFE BOMBON", width/2, 275);
  }
  if(x1 > .6*width && x1 <= .67*width){
    image(cafecreme, width/2, .37*height, 220, 220);
    textSize(20);
    text("CAFE CREME", width/2, 275);
  }
  if(x1 > .8*width && x1 <=.86*width){
    image(americano, width/3, .37*height, 200, 200);
    image(macchiato, 3*width/4, .4*height, 150, 150);
    textSize(20);
    text("AMERICANO", width/3, 275);
    text("MACCHIATO", 3*width/4, 275);
  }
  if(x1 > .93*width && x1 <= width){
    image(espresso, .55*width, .37*height, 220, 220);
    textSize(20);
    text("ESPRESSO", width/2, 275);
  }
}

void mousePressed(){
  if(overLine1){
    locked1 = true;
   }
  else{
    locked1 = false;
  }
  xOffset = mouseX-x1;
}

void mouseDragged(){
  if(locked1)
  {
    x1 = mouseX-xOffset;
  }
}

void mouseReleased(){
  locked1 = false;
}


