
PFont bob;
int x = -5;
int y = 235;
int exX = 0;
int exY = 0;
int exX2 = 0;
int exY2 = 0;
int s = 10;
int stop = 130;
String a = "N0R";
String b = "1A0";
float rot = 0;

void setup() {
  rot = rot + 0.02;
  size(250,250);
  smooth();
  background(0);
  bob = createFont("",48);
}

void draw() {
  textMode(CENTER);
  textFont(bob,s);
  fill(255,20);
  text(a,x,stop);
  text(b,y,stop);
  if (mousePressed) {
    x++;
    y--;
  }
  if (x>125) { 
    stop = -5;
    fill(255,random(200),random(255),20);
    translate(125,125);
    rotate(rot);
    rot+=0.2;
    text(a,0,0);
    text(a,exX,exY);
    exX++;
    exY++;  
    text(b,0,0);
    text(b,exX2,exY2);
    exX2++;
    exY2++;
    s++;
  }
}


