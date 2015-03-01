
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
int count;
int state;
int pointA = 0;
int pointB = 0;
int pointC = 130;
int pointD = 100;
boolean Hover = true;
PFont myFont;
void setup() {
  frameRate(600);
  count = 0;
  state = 0;
  size(600,600);
  background(255);
  smooth();    
  myFont=loadFont("ACaslonPro-Bold-48.vlw");

}
void draw() {
  noFill();
  noStroke();
  rect(pointA, pointB, pointC, pointD);
  textFont(myFont);
  fill(0);
  textSize(16);
  text("Pause n' Play", 18, 65);
  if (Hover) {  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(10);
  x = random(3*width/2);
  y = random(3*height/2);
  noStroke();
  fill(#000000);
  ellipse(x,y,diam,diam);
  
   count++;
  if(count > 90){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(255);
    } 
  }
  fill(#FF1C8E);
  diam = state * 8;
  ellipse(width-150,(height/4)*3,diam,diam);
  fill(#FEFF17);
  diam = state * 8;
  ellipse(width-150,height/4*2,diam,diam);
  fill(#0DEDFF);
  diam = state * 8;
  ellipse(width-150,height/4,diam,diam);
    } else {
    count=0;
  }
}
void mousePressed() {
  if (mouseX > pointA && mouseX < pointB + pointC && mouseY > pointB && mouseY < pointB + pointC) {
    Hover = !Hover;
    fill(255,255,255);
  }
}
void mouseReleased() {
  fill(0,0,0);
}


