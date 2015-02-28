


float x = 0.0;
float x1 = 0.0;
float x2 = 0.0;
float x3 = 0.0;
float x4 = 0.0;
float y = 0.0;
float z = random(800);
float w = random(800);

void setup(){
  size(800,450);
  smooth();
}

void draw() {
  
  background(255,255,255);
  stroke(0,0,0,100);
  strokeWeight(7);
  noFill();
  ellipse(400, 100, x, x);
  x = x+0.5;
  if (x > 120) {
    x = 0.0;
  }
  
  stroke(0,100,225,100);
  strokeWeight(7);
  ellipse(250, 100, x1, x1);
  x1 = x1+0.5;
  if (x1 > 120) {
    x1 = 0.0;
  }
  
   stroke(225,0,0,100);
  strokeWeight(7);
  ellipse(550, 100, x2, x2);
  x2 = x2+0.5;
  if (x2 > 120) {
    x2 = 0.0;
  }
  
   stroke(225,200,0,100);
  strokeWeight(7);
  ellipse(325, 175, x3, x3);
  x3 = x3+0.5;
  if (x3 > 120) {
    x3 = 0.0;
  }
  
  stroke(0,150,25,100);
  strokeWeight(7);
  ellipse(475, 175, x4, x4);
  x4 = x4+0.5;
  if (x4 > 120) {
    x4 = 0.0;
  }
  
  textFont(loadFont("london.vlw"));
  strokeWeight(5);
  stroke(30,30,30);
  fill(y*2.5,225,225);
  y=y+1.0;
  if (y >255){
    y = 0.0;
  }
  text("Victory Ceremony",200,300);
  
  strokeWeight(10);
  stroke(0,130);
  line(z,0,z,450);
  z=z+random(800);
  if (z > 800) {
    z = 0.0;
  }
  
  strokeWeight(5);
  stroke(255,0,0,130);
  line(w,0,w,450);
  w=w+random(800);
  if (w > 800) {
    w = 0.0;
  }
}



