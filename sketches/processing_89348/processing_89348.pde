
/* @pjs preload="mouse.png, cat.png"; */


color red=color(168,36,36);
color yellow=color(235,231,25);
color green=color(81,176,19);
color blue=color(28,132,176);
color violet=color(168,62,164);
color gray=color(200);
color blank=color(20);
color random=color(random(255),random(255),random(255));
color active;
boolean squares;
boolean weird;
float a = 0;
float b = 0;
float c = -255;
PImage cat;
PImage mouse;
  
int st;
  
void setup() {
  size(600,600);
  background(20);
  smooth();
  boolean squares = false;
  boolean weird = false;
  cat = loadImage("cat.png");
  mouse = loadImage("mouse.png");
}
  
  
  
void draw() {
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>20 && mouseY<40) {
    active=red;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>60 && mouseY<80) {
    active=yellow;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>100 && mouseY<120) {
    active=green;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>140 && mouseY<160) {
    active=blue;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>180 && mouseY<200) {
    active=violet;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>220 && mouseY<240) {
    active=gray;
    squares=false;
    weird = false;
  }
  
  if (mousePressed && mouseX>7 && mouseX<15 && mouseY>250 && mouseY<275) {
    st=1;
  }
  
  if (mousePressed && mouseX>15 && mouseX<24 && mouseY>250 && mouseY<275) {
    st=3;
  }
  
  if (mousePressed && mouseX>24 && mouseX<40 && mouseY>250 && mouseY<275) {
    st=10;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>290 && mouseY<310){
    squares=false;
    weird = true;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>330 && mouseY<350){
    squares=true;
    weird = false;
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>370 && mouseY<390) {
    active=blank;
    background(blank);
  }

  noStroke();
  fill(red);
  rect(10,20,20,20);
  fill(yellow);
  rect(10,60,20,20);
  fill(green);
  rect(10,100,20,20);
  fill(blue);
  rect(10,140,20,20);
  fill(violet);
  rect(10,180,20,20);
  fill(gray);
  rect(10,220,20,20);
  fill(255);
  ellipse(20,300,20,20);
  fill(random(255),random(255),random(255));
  rect(10,330,20,20);
  fill(80);
  rect(10,370,20,20);
  fill(240);
  ellipse(10,260,4,4);
  ellipse(19,260,6,6);
  ellipse(30,260,9,9);
  
  if(mousePressed) {
    if(squares==true){
      fill (random(0,255), random(0,255), random(0,255));
      float a = random (50,100);
      float b = random (50,100);
      float x = mouseX-25;
      float y = mouseY-25;
      rect (x, y, a, b);
    }
    
   else if(weird==true){
     image(cat,mouseX-50,mouseY-50,100,100);
       a = a + .1;
       b = b + 1;
       c = c + 1;
       float d = random(0,255);
       float e = random(0,255);
       float f = random(0,255);
       translate(mouseX, mouseY);
       rotate(a);
       if(b<255){
       fill(d, e, f);
       } else {
       fill(d, e, f);
       }
       fill(d, e, f);
       image(mouse,100,0,50,50);
   }
    else{
      strokeWeight(st);
      stroke(active);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
  }
}


