
// working with easing


int wide = 500;
int high = 200;

int d = 20;
int x = 100;

float x1 = random(50);
float y1 = random(high);
float easing1 = .03;

float x2 = random(50, 75);
float y2 = random(high);
float easing2 = .03;

float x3 = random(75, 100);
float y3 = random(high);
float easing3 = .05;

void setup(){
  size(wide, high);
  smooth();
  noStroke();
  noCursor();
}

void draw(){
 background(#E6DCAD);
    for(int y = 40; y < high; y += 40){
        strokeWeight(1);
        stroke(0);
        line(0, y, width, y);
        }
  //circle 1
  stroke(255);
  strokeWeight(7);
  noFill();
  ellipse(x1, y1, d+15, d+15);
  x1 += (100 - x1) *easing1;
  y1 += (height/2 - y1) *easing1;
  
  //circle2
    stroke(255);
    strokeWeight(7);
  noFill();
  ellipse(x2, y2, d+10, d+10);
  x2 += (100 - x2) *easing2;
  y2 += (height/2 - y2) *easing2;
  
  //circle3
    stroke(255);
    strokeWeight(7);
  noFill();
  ellipse(x3, y3, d+5, d+5);
  x3 += (100 - x3) *easing3;
  y3 += (height/2 - y3) *easing3;
  
  //dot on cursor
  noStroke();
  fill(0);
  x+=2;
  ellipse(x, height/2, d+20, d+20);
  
}
