
//First project: Transport to another world

//Global variables
int radius = 100;
PFont font;
PShape heart;

float angle = 0.0;
float offset = 10;
float scalar = 2;
float speed = 0.02;

void setup() {
  size(800,800);
  smooth();
  ellipseMode(RADIUS);
  font = loadFont("CenturyGothic-48.vlw");
  textFont(font);
  heart = loadShape("Heart.svg");
}

void draw() {
  background(0);
  frameRate(60);
  noStroke();
  pacman(100,150);
  pacman(300,150);
  
  textAlign(CENTER);
  fill(255);
  text("Do you love me?",400,500);
  text("Yes = Y",400,600);
  text("Maybe = M",400,675);
  text("No = N",400,750);
  
  keyReleased();
}
  
void keyReleased() {
//YES
    if(key == 'y' || key == 'Y') {
    fill(240);
    noStroke();
    rect(0,0,width,height);
    shape(heart,random(0,width),random(0,height),random(10,200),random(10,200));
    fill(random(0,255),random(0,255),random(0,255));
    text("YAY!!",random(0,width),random(0,height));
//NO
  } else if(key == 'n' || key == 'N') {
    frameRate(2.5);
    fill(0);
    noStroke();
    rect(0,0,width,height);
    noFill();
    stroke(0,0,random(0,255));
    strokeWeight(random(0,10));
    for(int e = 10; e <= 800; e += 20) {
     ellipse(400,400,e,e); 
    }
    fill(random(10,200));
    text("WHY",random(0,width),random(0,height));
    fill(random(10,200));
    text("HATE",random(0,width),random(0,height));
    fill(random(10,200));
    text("FOREVER ALONE",random(0,width),random(0,height));
    fill(random(10,200));
    text("NO ONE LOVES ME",random(0,width),random(0,height));
 //MAYBE
 } else if(key == 'm' || key == 'M') {
    frameRate(1.2);
    fill(100);
    noStroke();
    rect(0,0,width,height);
    stroke(random(0,255),0,random(0,255));
    for(int i = 1; i <= 800; i += 1) {
    spiral(i,i);
    }
    fill(random(0,255));
    text("?",random(0,width),random(0,height));
    fill(random(0,255));
    text("what",random(0,width),random(0,height));
 }
}

void pacman(int b, int m) {
  pushMatrix();
  translate(b,m);
  fill(234,214,54);
  arc(b,m,radius,radius,0.63,5.65);
  popMatrix();
}

void spiral(int x, int y) {
  pushMatrix();
  translate(x,y);
  stroke(random(0,255),0,random(0,255));
  float p = offset + cos(angle) * scalar;
  float q = offset + sin(angle) * scalar;
  ellipse(p, q, 5, 5);
  angle += speed;
  scalar += speed;
  popMatrix();
}


