
float x;
float y;
float oldx;
float oldy;
float easingStart = 0.02;
float easing;
float offset;
int counter;
float radius = 100;
float[] pointX = new float[100000];
float[] pointY = new float[100000];

void setup() {
  size(512, 512);
  strokeJoin(ROUND);
}

void draw() {
  counter++;
  offset+=5;
  if (offset >= 360) { offset = 0; }
  background(51);  
  noStroke();  
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) { x += dx * easing; }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) { y += dy * easing; }
  
  radius = 50+25*abs(dx+dy)/width;
  
  float x2 = cos(radians(offset))*radius;
  float y2 = sin(radians(offset))*radius;
  
  //float x2 = (noise((counter)*.005)-.5)*200; //*map(abs(dx),0,width,1,10);
  //float y2 = (noise((counter+500)*.005)-.5)*200; //*map(abs(dy),0,height,1,10);
  
  easing = (noise(counter*0.005)-.5)*.01+easingStart;
  //println("dx " + dx);
  
  strokeWeight(4);
  stroke(255);
  
  pointX[counter] = x+x2;
  pointY[counter] = y+y2;
  
  for(int i=1; i<counter; i+=1) {
    line(pointX[i],pointY[i],pointX[i+1],pointY[i+1]);
  }
  
  noStroke();
  ellipse(x+x2, y+y2, 32, 32);
}
