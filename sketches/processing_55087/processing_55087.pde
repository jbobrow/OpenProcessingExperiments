
float dist = 115, radius = dist/2, alpha =10, speed = 300;
float px, py, x, y, k;
float counter;
PVector loc;
Pointer closest = null;

void setup() {
  size(1100, 800);
  background(100);
  stroke(255);
  smooth();
  frameRate(100);
  px = radius;
  py = 0;
  counter = 0;
}

void draw() {
   println(frameRate);
  k = speed/radius;
  alpha += k;
  radius += dist/(360/k);

  x = radius*cos(radians(alpha));
  y = radius*sin(radians(alpha));
  translate(width/2, height/2);
  line(px, py, 4, 4);
  px = x;
  py = y;
  counter++;
  if (counter == 600) {
    radius = 0;
  }
 
//    float d = dist(loc.x+width/2, loc.y+height/2, mouseX, mouseY);
//    if (d < 10) {
//      fill(255, 0, 0);
//      //closest = p;
//    }
//
//    if (closest !=null) {
//      fill(255, 0, 0);
//      ellipse(closest.loc.x, closest.loc.y, 16, 16);
//      closest.drawInfo();
//    }
  }


class Pointer {

  PVector loc;

  //String name = "";
  //PImage img;

  color c;


  Pointer(float x, float y) {
    loc = new PVector(x, y);
    c = color(random(255), random(255), random(255));
  }

  void drawInfo() {
    fill(c);
    ellipse(loc.x, loc.y, 25, 25);
    //rect(loc.x,loc.y,100,100);
  }
}



