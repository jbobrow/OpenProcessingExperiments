
//hit the mouse to start to draw
//press the mouse to make it draw faster

float radius = 250;
float angle;
float rad;
float accillation;
float x, y;
float x1, y1;
float x2, y2;
float x3, y3;
int state;

void setup(){
  size(700, 700);
  smooth();
  x = width/2;
  y = height/2;
  state = 0;
}

void draw(){
  if(state == 0){
  background(0);
  if(mousePressed){
    state = 1;
   }
  }
  if(state == 1){
  translate(width/2, height/2);
  angle += 0.1;
  float x = sin(angle) *radius;
  float y = cos(angle) *radius;
  noFill();
  
  rad = frameCount * 0.01;
  accillation = sin(rad);

  float ascMapped = map(accillation, -1, 1, 0, 1);
  noStroke();
  fill(25);
  ellipse(x, y, 200 * ascMapped, 200 * ascMapped);
  fill(50);
  ellipse(x, y, 190 * ascMapped, 190 * ascMapped);
  fill(75);
  ellipse(x, y, 180 * ascMapped, 180 * ascMapped);
  fill(100);
  ellipse(x, y, 170 * ascMapped, 170 * ascMapped);
  fill(125);
  ellipse(x, y, 160 * ascMapped, 160 * ascMapped);
  fill(150);
  ellipse(x, y, 150 * ascMapped, 150 * ascMapped);
  fill(175);
  ellipse(x, y, 140 * ascMapped, 140 * ascMapped);
  fill(200);
  ellipse(x, y, 130 * ascMapped, 130 * ascMapped);
  fill(225);
  ellipse(x, y, 120 * ascMapped, 120 * ascMapped);
  fill(250);
  ellipse(x, y, 110 * ascMapped, 110 * ascMapped);
  fill(255);
  ellipse(x, y, 100 * ascMapped, 100 * ascMapped);
    
  float x1 = sin(angle) *radius/3;
  float y1 = cos(angle) *radius/3 ;
  float ascMapped1 = map(accillation, -1, 1, 0, 1);
  noStroke();
  fill(25);
  ellipse(x1, y1, 100 * ascMapped, 100 * ascMapped);
  fill(50);
  ellipse(x1, y1, 90 * ascMapped, 90 * ascMapped);
  fill(75);
  ellipse(x1, y1, 80 * ascMapped, 80 * ascMapped);
  fill(100);
  ellipse(x1, y1, 70 * ascMapped, 70 * ascMapped);
  fill(125);
  ellipse(x1, y1, 60 * ascMapped, 60 * ascMapped);
  fill(150);
  ellipse(x1, y1, 50 * ascMapped, 50 * ascMapped);
  fill(175);
  ellipse(x1, y1, 40 * ascMapped, 40 * ascMapped);
  fill(200);
  ellipse(x1, y1, 30 * ascMapped, 30 * ascMapped);
  fill(225);
  ellipse(x1, y1, 20 * ascMapped, 20 * ascMapped);
  fill(250);
  ellipse(x1, y1, 10 * ascMapped, 10 * ascMapped);
  fill(255);
  ellipse(x1, y1, 10 * ascMapped, 10 * ascMapped);
  
  float ascMapped3 = map(accillation, -1, 1, 0, 1);
  noStroke();
  fill(25);
  ellipse(x2, y2, 50 * ascMapped, 50 * ascMapped);
  fill(50);
  ellipse(x2, y2, 45 * ascMapped, 45 * ascMapped);
  fill(75);
  ellipse(x2, y2, 40 * ascMapped, 40 * ascMapped);
  fill(100);
  ellipse(x2, y2, 35 * ascMapped, 35 * ascMapped);
  fill(125);
  ellipse(x2, y2, 30 * ascMapped, 30 * ascMapped);
  fill(150);
  ellipse(x2, y2, 25 * ascMapped, 25 * ascMapped);
  fill(175);
  ellipse(x2, y2, 20 * ascMapped, 20 * ascMapped);
  fill(200);
  ellipse(x2, y2, 15 * ascMapped, 15 * ascMapped);
  fill(225);
  ellipse(x2, y2, 10 * ascMapped, 10 * ascMapped);
  fill(250);
  ellipse(x2, y2, 5 * ascMapped, 5 * ascMapped);
  fill(255);
  ellipse(x2, y2, 0 * ascMapped, 0 * ascMapped);
  
  float x3 = cos(angle) *radius/1.8;
  float y3 = sin(angle) *radius/1.8;
  float ascMapped4 = map(accillation, -1, 1, 0, 1);
  noStroke();
  fill(25);
  ellipse(x3, y3, 50 * ascMapped, 50 * ascMapped);
  fill(50);
  ellipse(x3, y3, 45 * ascMapped, 45 * ascMapped);
  fill(75);
  ellipse(x3, y3, 40 * ascMapped, 40 * ascMapped);
  fill(100);
  ellipse(x3, y3, 35 * ascMapped, 35 * ascMapped);
  fill(125);
  ellipse(x3, y3, 30 * ascMapped, 30 * ascMapped);
  fill(150);
  ellipse(x3, y3, 25 * ascMapped, 25 * ascMapped);
  fill(175);
  ellipse(x3, y3, 20 * ascMapped, 20 * ascMapped);
  fill(200);
  ellipse(x3, y3, 15 * ascMapped, 15 * ascMapped);
  fill(225);
  ellipse(x3, y3, 10 * ascMapped, 10 * ascMapped);
  fill(250);
  ellipse(x3, y3, 5 * ascMapped, 5 * ascMapped);
  fill(255);
  ellipse(x3, y3, 0 * ascMapped, 0 * ascMapped);
  if(mousePressed){
  angle += 0.5;
   }
  }    
}


