

PFont font;
float diameter = random (5,100);
float x = random (0,width);
float y = random (0,height);
float distance = 5;
int a = 560;
int dia = 30;
int n = a - 5;


void setup () {
  size (600,500);
  smooth();
  noStroke();
  background(235);
  font = loadFont("Lemondrop-Bold-16.vlw");
  textFont(font);
    x = width/2;
    y = height/2;
    diameter = random (2,40);
    ellipse (x,y,diameter,diameter);
      }

void draw () {
  noStroke();
  x=constrain (x,40,width-100);
  y=constrain (y,40,height-40);
  if (keyPressed && (key == '1')) {
    //BLACK
    fill(0,0,0,200);
    paint();
  } else {
    if (keyPressed && (key == '2')) {
    //DARK BLUE
    fill(0,84,166,200);
    paint();
  } else {
    if (keyPressed && (key == '3')) {
    //LIGHT BLUE
    fill(109,207,246,200);
    paint();
  } else {
    if (keyPressed && (key == '4')) {
    //GREEN
    fill(82,222,89,200);
    paint();
  } else {
    if (keyPressed && (key == '5')) {
    //YELLOW
    fill(255,245,104,200);
    paint();
  } else {
    if (keyPressed && (key == '6')) {
    //ORANGE
    fill(247,148,29,200);
    paint();
  } else {
    if (keyPressed && (key == '7')) {
    //PINK
    fill(240,110,170,200);
    paint();
  } else {
    if (keyPressed && (key == '8')) {
    //RED
    fill(237,28,36,200);
    paint();
  } else {
    fill(255,255,255,150);
    paint();
  }}}}}}}}
  if(mousePressed && (mouseButton == LEFT)){
    x=mouseX;
    y=mouseY;
  x = constrain (x,0,width);
  y = constrain (y,0,height);
  diameter = random (2,30);
  }
  if (mousePressed && (mouseButton == RIGHT)){
  background (235);}
fill(0,0,0,200);
    pallett(50);
    fill(0,84,166,200);
    pallett(90);
    fill(109,207,246,200);
    pallett (130);
    fill(82,222,89,200);
    pallett (170);
    fill(255,245,104,200);
    pallett (210);
    fill(247,148,29,200);
    pallett (250);
    fill(240,110,170,200);
    pallett (290);
    fill(237,28,36,200);
    pallett (330);
    fill(255,255,255,150);
    pallett (370);
    fill(255);
    textSize(12);
    text ("1", n, 53);
    text ("2", n, 93);
    text ("3", n, 133);
    text ("4", n, 173);
   text ("5", n, 213);
  text ("6", n, 253);
 text ("7", n, 293);
text ("8", n, 333); 
  }

void paint(){
  x = constrain (x,0,width);
  y = constrain (y,0,height);
  diameter = random (2,30);
  distance = random (1,20);
  x+= random (-distance,distance);
  y+= random (-distance,distance);
  ellipse (x,y,diameter,diameter);
}

void pallett(int b){
  pushMatrix();
  ellipse(a,b,dia,dia);
  popMatrix();
}



