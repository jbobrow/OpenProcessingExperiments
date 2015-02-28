

PImage drop;
PImage drop2;
PImage drop3;

PFont  chalk;
char c1 = 'w';
char c2 = 'e';
char c3 = 't';

String text = "wet";

float x1, x2, x3;
float y1, y2, y3, y4;
float yspeed1, yspeed2, yspeed3;
float hr, vr;
float offsetX1;
float offsetY1, offsetY2, offsetY3;
float opacity;
float a, t;
float space;
float ww, ew ;

void setup() {
  size(600, 600);
  chalk = loadFont( "ChalkboardSE-Bold-48.vlw");
  drop = loadImage( "drop.png");
  drop2 = loadImage( "drop2.png");
  drop3 = loadImage( "drop3.png");

  space = textWidth(text);
  ww = textWidth(c1);
  ew = textWidth(c2);
  vr = (textAscent() + textDescent());

  x1 = 300;
  y1 = 300;
  a = 12;
  opacity = 255;

  x2 = 300;
  y2 = y1;
  y3 = y1;
  y4 = y1;
}

void draw() {
  //background(255);
  fill(0, 100);
  rect(0, 0, width, height);
  textFont(chalk);

  fill(255, opacity);
  tint(255, opacity);
  if (abs(mouseX - x1) < 9*ww && abs(mouseY - y1) < 2*vr) { 
    offsetX1 = random(-20, 20);
    opacity -= 1.0;
    image(drop, x1, y2);
    y2 += yspeed1;
    yspeed1 +=0.05;
    image(drop2, x1+30, y3);
    y3 += yspeed2;
    yspeed2 += 0.03;
     image(drop3, x1+60, y4);
    y4 += yspeed3;
    yspeed3 += 0.02;
  }
  if ( y2 > height) {
    y2 = y1;
  }
  if ( y3 > height) {
    y3 = y1;
  }
  if ( y4 > height) {
    y4 = y1;
  }

  
  if (mousePressed){
    opacity = 255;
    x1 = random (50, 450);
    y1 = random (50, 450);
    
  }
  text(c1, x1 + offsetX1, y1);
  text(c2, x1 + 4*ww + offsetX1, y1);
  text(c3, x1 + 7*ww + offsetX1, y1);
}







/*line (0, 300-15, width, 300-15);
 line(width/2, 0, width/2, height);
 line(300+3*ww, 0, 300+3*ww, height);
 */









