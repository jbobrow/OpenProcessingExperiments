
PFont myFont;
String title = "LODON OLYMPIC";
float t=0;
int x = 100;
int y = 100;
int m = 20;
int n = 20;

void setup() {
  background(255);
  size (800, 600);
  frameRate(30);
  strokeWeight(5);
  smooth();  
  myFont = loadFont("theFont.vlw");
  textFont(myFont, 45);
}

void draw() { 
  fill(0);
  text(title, width/2-textWidth(title)/2, height*2/3);
  noFill();
  stroke(5, 131, 232);  
  ellipse(t+300-m, t+200-n, t+100+x, t+100+y);
  
  stroke(0, 0, 0);
  ellipse(t+400, t+200-n, t+100+x, t+100+y);

  stroke(230, 0, 0);
  ellipse(t+500+m, t+200-n, t+100+x, t+100+y);
  
  stroke(255, 255, 0);
  ellipse(t+350-m, t+290+n, t+100+x, t+100+y);

  stroke(0, 255, 0);
  ellipse(t+450+m, t+290+n, t+100+x, t+100+y);
  
  //Control ellipse zoom in and zoom out
  x = x+2;
  y = y+2;
  m = m+3;
  n = n+3;
  if (x>100) {
    background (255);
    stroke(5, 131, 232);
    x=0;
    y=0;
    m=0;
    n=0;
  }
  //Ribbon wave
  noFill();
  stroke(random(0,255),random(0,255),random(0,255),50);
  bezier(-100,300,300,random(0,600),random(800),random(800),900,300);
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

