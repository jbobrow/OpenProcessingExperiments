
float angle = 0.0;
float offset = 60;
float scalar = 65;
float speed = 0.05;

void setup() {

  size(750, 750);
  smooth();
}



void draw() {

  background(0);

  fill(255);
  float sv = random(0, 10); //these are random stars
  int svalue = int(sv);
  float sx = random(0, width);
  int starx = int(sx);
  float sy = random(0, height);
  int stary= int(sy);
  ellipse(sx, sy, svalue, svalue);


  float mercx = offset = (cos(angle) * scalar) + 375; //mercury
  float mercy = offset = (sin(angle) * scalar) + 375; 
  float vx = offset = (cos(angle) * scalar*1.4) + 375; //venus
  float vy = offset = (sin(angle) * scalar*1.4) + 375; 
  float ex = offset = (cos(angle) * scalar*1.8) + 375; //earth
  float ey = offset = (sin(angle) * scalar*1.8) + 375;
  float mx = offset = (cos(angle) * scalar*2.25) + 375; //mars
  float my = offset = (sin(angle) * scalar*2.25) + 375;
  float jx = offset = (cos(angle) * scalar*4) + 375; //jupiter
  float jy = offset = (sin(angle) * scalar*4) + 375; 
  float satx = offset = (cos(angle) * scalar*5) + 375; //saturn
  float saty = offset = (sin(angle) * scalar*5) + 375;


fill(255);
  ellipse(mercx, mercy, 10, 10);
  ellipse(vx, vy, 15, 15);
  ellipse(ex, ey, 17, 17);
  ellipse(mx, my, 18, 18);
  ellipse(jx, jy, 40, 40);
  ellipse(satx, saty, 25, 25);

  ellipse(width/2, height/2, 65, 65); //sun
  
  noFill();
  stroke(255);
  ellipse(satx, saty, 47, 40);
  angle += speed/10;
}


