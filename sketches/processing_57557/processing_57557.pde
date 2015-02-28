
float a;
float b;
float da;
float db;
float x;
float dx;
float y;
float dy;
float c;
float x1;
float dx1;
float y1;
float dy1;

int  r = 25;

void setup() {
  size(900, 450);
  text( "Click to Ashoot the ball",width/2,60); 
  text("LA Lasers", width*1/4,60);
  smooth();
  noStroke();
  a = 0;
  b = 0;
  da = 1;
  db = 1;
  
  x = 0;
  dx = 1;
  y = 0;
  dy = 1;
  c = 1;
  r = 25;
  x1 = 0;
  dx1 = 1;
  y1 = 0;
  dy1 = 1;
}

void draw() {
  background (255);
  fill(0);
  text("LA Lasers", width*1/4,60);
  text( "Click to Shoot the Balls",width/2,60); 
  fill(255, x-10, y-c);
  ellipse(x, y, r*2, r*2);
  ellipse(a,b, r*2, r*2);
  fill(0);
  text( "Shoot Me", x-r, y);
  text( "Shoot Me", a-r, b);
  x += 5*dx;
  y += 9*dy;
  c += 20;
  if (x >=width-25) {
    dx = -1;
  }
  if (x <= 25) {
    dx = +1;
  }
  if (y >= height-25) {
    dy = -1;
  }
  if (y <= 25) {
    dy = +1;
  }
  a += 5*dx;
  b += 9*dy;
  if (a ==width-25) {
  da = -1;
  }
  if (a <= 25) {
    da = +1;
  }
  if (b >= height-25) {
    db = -1;
  }
  if (b <= 25) {
    db = +1;
  }
  stroke(0);
  noFill();
  ellipse(mouseX,mouseY,30,30);
  strokeWeight(1);
  stroke(0);
  line(mouseX-20,mouseY,mouseX+20,mouseY);
  line(mouseX, mouseY-20,mouseX,mouseY+20);
  noStroke();
  if (mousePressed == true) {
    strokeWeight(3);
    stroke(255, 0, 0,128);
    line(mouseX-5, mouseY-5, 0, 0);
    stroke(0, 255, 0,128);
    line(mouseX+10, mouseY, width, height);
    stroke(0, 255, 0,128);
    line(mouseX-10, mouseY, 0, height);
    noStroke();
    fill(233,128,200);
    ellipse(mouseX,mouseY,30,30);
    stroke(0);
    strokeWeight(1);
    line(mouseX-20,mouseY,mouseX+20,mouseY);
    line(mouseX,mouseY+20,mouseX,mouseY-20);
  if (mouseX > (x-r) && mouseX < (x+r) && mouseY > (y-r) && mouseY < (y+r)){
    x = random(r,width);
    y = random(r,height);
  }
  if (mouseX > (a-r) && mouseX < (a+r) && mouseY > (b-r) && mouseY < (b+r)) {
    a = (random (r, width));
    b = (random (r, height));
    }
  }
  strokeWeight(1);
  line(mouseX-20,mouseY,mouseX+20,mouseY);
  line(mouseX,mouseY+20,mouseX,mouseY-20);
  noStroke();
}

