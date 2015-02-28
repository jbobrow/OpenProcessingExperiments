
float beginX = 50*int(random(1, 16));
float beginY = 50*int(random(1, 16));
float endX  = 50*int(random(1, 16));
float endY = 50*int(random(1, 16));
float x = 0;
float y = 0;

float beginX2 = 50*int(random(1, 16));
float beginY2 = 50*int(random(1, 16));
float endX2  = 50*int(random(1, 16));
float endY2 = 50*int(random(1, 16));
float x2 = 0;
float y2 = 0;

float beginX3 = 50*int(random(1, 16));
float beginY3 = 50*int(random(1, 16));
float endX3  = 50*int(random(1, 16));
float endY3 = 50*int(random(1, 16));
float x3 = 0;
float y3 = 0;

float beginX4 = 50*int(random(1, 16));
float beginY4 = 50*int(random(1, 16));
float endX4  = 50*int(random(1, 16));
float endY4 = 50*int(random(1, 16));
float x4 = 0;
float y4 = 0;

float beginX5 = 50*int(random(1, 16));
float beginY5 = 50*int(random(1, 16));
float endX5  = 50*int(random(1, 16));
float endY5 = 50*int(random(1, 16));
float x5 = 0;
float y5 = 0;

float distX = endX - beginX;
float distY = endY - beginY; 
float fracX = abs(distX/50);
float fracY = abs(distY/50);

float distX2 = endX2 - beginX2;
float distY2 = endY2 - beginY2; 
float fracX2 = abs(distX2/50);
float fracY2 = abs(distY2/50);

float distX3 = endX3 - beginX3;
float distY3 = endY3 - beginY3; 
float fracX3 = abs(distX3/50);
float fracY3 = abs(distY3/50);

float distX4 = endX4 - beginX4;
float distY4 = endY4 - beginY4; 
float fracX4 = abs(distX4/50);
float fracY4 = abs(distY4/50);

float distX5 = endX5 - beginX5;
float distY5 = endY5 - beginY5; 
float fracX5 = abs(distX5/50);
float fracY5 = abs(distY5/50);

float stepX = (1/fracX)*distX;
float stepY = (1/fracY)*distY;
float pctx = 0.0;
float pcty = 0.0;
float oldX = 0;
float oldY = 0;

float stepX2 = (1/fracX2)*distX2;
float stepY2 = (1/fracY2)*distY2;
float pctx2 = 0.0;
float pcty2 = 0.0;
float oldX2 = 0;
float oldY2 = 0;

float stepX3 = (1/fracX3)*distX3;
float stepY3 = (1/fracY3)*distY3;
float pctx3 = 0.0;
float pcty3 = 0.0;
float oldX3 = 0;
float oldY3 = 0;

float stepX4 = (1/fracX4)*distX4;
float stepY4 = (1/fracY4)*distY4;
float pctx4 = 0.0;
float pcty4 = 0.0;
float oldX4 = 0;
float oldY4 = 0;

float stepX5 = (1/fracX5)*distX5;
float stepY5 = (1/fracY5)*distY5;
float pctx5 = 0.0;
float pcty5 = 0.0;
float oldX5 = 0;
float oldY5 = 0;

void setup(){
  
  size(800, 800);
  smooth();
  background(255);

  frameRate(20);

  for (int a=50; a<width; a+=50){
  stroke(230);
  line(a, 0, a, width-1);
  line(0, a, width-1, a);
  }
  
beginX = 50*int(random(1, 16));
beginY = 50*int(random(1, 16));
endX  = 50*int(random(1, 16));
endY = 50*int(random(1, 16));
x = 0;
y = 0;

beginX2 = 50*int(random(1, 16));
beginY2 = 50*int(random(1, 16));
endX2  = 50*int(random(1, 16));
endY2 = 50*int(random(1, 16));
x2 = 0;
y2 = 0;

beginX3 = 50*int(random(1, 16));
beginY3 = 50*int(random(1, 16));
endX3  = 50*int(random(1, 16));
endY3 = 50*int(random(1, 16));
x3 = 0;
y3 = 0;

beginX4 = 50*int(random(1, 16));
beginY4 = 50*int(random(1, 16));
endX4  = 50*int(random(1, 16));
endY4 = 50*int(random(1, 16));
x4 = 0;
y4 = 0;

beginX5 = 50*int(random(1, 16));
beginY5 = 50*int(random(1, 16));
endX5  = 50*int(random(1, 16));
endY5 = 50*int(random(1, 16));
x5 = 0;
y5 = 0;

distX = endX - beginX;
distY = endY - beginY; 
fracX = abs(distX/50);
fracY = abs(distY/50);

distX2 = endX2 - beginX2;
distY2 = endY2 - beginY2; 
fracX2 = abs(distX2/50);
fracY2 = abs(distY2/50);

distX3 = endX3 - beginX3;
distY3 = endY3 - beginY3; 
fracX3 = abs(distX3/50);
fracY3 = abs(distY3/50);

distX4 = endX4 - beginX4;
distY4 = endY4 - beginY4; 
fracX4 = abs(distX4/50);
fracY4 = abs(distY4/50);

distX5 = endX5 - beginX5;
distY5 = endY5 - beginY5; 
fracX5 = abs(distX5/50);
fracY5 = abs(distY5/50);

stepX = (1/fracX)*distX;
stepY = (1/fracY)*distY;
pctx = 0.0;
pcty = 0.0;
oldX = 0;
oldY = 0;

stepX2 = (1/fracX2)*distX2;
stepY2 = (1/fracY2)*distY2;
pctx2 = 0.0;
pcty2 = 0.0;
oldX2 = 0;
oldY2 = 0;

stepX3 = (1/fracX3)*distX3;
stepY3 = (1/fracY3)*distY3;
pctx3 = 0.0;
pcty3 = 0.0;
oldX3 = 0;
oldY3 = 0;

stepX4 = (1/fracX4)*distX4;
stepY4 = (1/fracY4)*distY4;
pctx4 = 0.0;
pcty4 = 0.0;
oldX4 = 0;
oldY4 = 0;

stepX5 = (1/fracX5)*distX5;
stepY5 = (1/fracY5)*distY5;
pctx5 = 0.0;
pcty5 = 0.0;
oldX5 = 0;
oldY5 = 0;

}

void draw(){
  int direction = int(random(2));
  int direction2 = int(random(2));
  int direction3 = int(random(2));
  int direction4 = int(random(2));
  int direction5 = int(random(2));

  oldX = x;
  oldY = y;
  
  oldX2 = x2;
  oldY2 = y2;
  
  oldX3 = x3;
  oldY3 = y3;
  
  oldX4 = x4;
  oldY4 = y4;
  
  oldX5 = x5;
  oldY5 = y5;
 
  if (pctx <= 0){
    x = beginX;
  }
  if (pcty <= 0){
    y = beginY;
  } 
  
  if (pctx2 <= 0){
    x2 = beginX2;
  }
  if (pcty2 <= 0){
    y2 = beginY2;
  } 
  
  if (pctx3 <= 0){
    x3 = beginX3;
  }
  if (pcty3 <= 0){
    y3 = beginY3;
  }
  
  if (pctx4 <= 0){
    x4 = beginX4;
  }
  if (pcty4 <= 0){
    y4 = beginY4;
  }
  
  if (pctx5 <= 0){
    x5 = beginX5;
  }
  if (pcty5 <= 0){
    y5 = beginY5;
  }
  
  if ((pctx <= 1.05) && (direction <= 0)){
    x = beginX + (pctx * distX);
    pctx += (1/fracX);
  }
  if ((pcty <= 1.05) && (direction >= 1)){
    y = beginY + (pcty * distY);
    pcty += (1/fracY);
  }
  
  if ((pctx2 <= 1.05) && (direction2 <= 0)){
    x2 = beginX2 + (pctx2 * distX2);
    pctx2 += (1/fracX2);
  }
  if ((pcty2 <= 1.05) && (direction2 >= 1)){
    y2 = beginY2 + (pcty2 * distY2);
    pcty2 += (1/fracY2);
  }
  
  if ((pctx3 <= 1.05) && (direction3 <= 0)){
    x3 = beginX3 + (pctx3 * distX3);
    pctx3 += (1/fracX3);
  }
  if ((pcty3 <= 1.05) && (direction3 >= 1)){
    y3 = beginY3 + (pcty3 * distY3);
    pcty3 += (1/fracY3);
  }
  
  if ((pctx4 <= 1.05) && (direction4 <= 0)){
    x4 = beginX4 + (pctx4 * distX4);
    pctx4 += (1/fracX4);
  }
  if ((pcty4 <= 1.05) && (direction4 >= 1)){
    y4 = beginY4 + (pcty4 * distY4);
    pcty4 += (1/fracY4);
  }
  
  if ((pctx5 <= 1.05) && (direction5 <= 0)){
    x5 = beginX5 + (pctx5 * distX5);
    pctx5 += (1/fracX5);
  }
  if ((pcty5 <= 1.05) && (direction5 >= 1)){
    y5 = beginY5 + (pcty5 * distY5);
    pcty5 += (1/fracY5);
  }
  
  fill(0);
  strokeWeight(3);
  if ((x != 0) && (y != 0) && (oldX != 0) && (oldX != 0)){
  stroke(255,0,0,100);
  line(oldX, oldY, x, y);
  }
  
  if ((x2 != 0) && (y2 != 0) && (oldX2 != 0) && (oldX2 != 0)){
  stroke(0,255,0,100);
  line(oldX2, oldY2, x2, y2);
  }
  
  if ((x3 != 0) && (y3 != 0) && (oldX3 != 0) && (oldX3 != 0)){
  stroke(0,0,255,100);
  line(oldX3, oldY3, x3, y3);
  }
  
  if ((x4 != 0) && (y4 != 0) && (oldX4 != 0) && (oldX4 != 0)){
  stroke(255,0,255,100);
  line(oldX4, oldY4, x4, y4);
  }
  
  if ((x5 != 0) && (y5 != 0) && (oldX5 != 0) && (oldX5 != 0)){
  stroke(0,255,255,100);
  line(oldX5, oldY5, x5, y5);
  }
  
  strokeWeight(.5);
  stroke(0);
  fill(255,0,0);
  ellipse(beginX, beginY, 7, 7);
  fill(0,255,0);
  ellipse(beginX2, beginY2, 7, 7);
  fill(0,0,255);
  ellipse(beginX3, beginY3, 7, 7);
  fill(255,0,255);
  ellipse(beginX4, beginY4, 7, 7);
  fill(0,255,255);
  ellipse(beginX5, beginY5, 7, 7);
  
  noStroke();
  fill(0);
  ellipse(endX, endY, 15, 15);
  ellipse(endX2, endY2, 15, 15);
  ellipse(endX3, endY3, 15, 15);
  ellipse(endX4, endY4, 15, 15);
  ellipse(endX5, endY5, 15, 15);
  
}

void mousePressed(){
  setup();
}

