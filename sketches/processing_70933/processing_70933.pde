
float cx, y;
float cy;

float cx2;
float cy2;

float ang = 0;

int count = 0;

//-------------------------
void setup() {
  size(500, 500);
  background(34, 129, 238);

  cx = width/2;
  y = height/2;
}

//-------------------------
void draw() {

  fill(34, 29, 58, 5);
  noStroke();
  rect(0, 0, width, height);
  
  cy = 150 * sin(cx/(10*PI)) + y;

  fill(34, 45, 182, 125);
  stroke(125, 56, 71, 90);
  ellipse(cx, cy, 10, 10);

  cx2 = 30*sin(ang) + cx;
  cy2 = 30*cos(ang) + cy;

  stroke(94, 238, 125, 210);
  line(cx, cy, cx2, cy2);
  
  
  fill(34, 45, 182, 125);
  stroke(125, 56, 71, 190);
  ellipse(cx2, cy2, 10, 10);
  
  rodea(cx2, cy2, 30, ang);
  count = 0;
  ang += PI/90;
  
  cx++;
  cx %= width;
}

void rodea(float x, float y, float amp, float a){
  float xn, yn;

  count++;
  
  xn = amp*sin(a*count*0.75) + x;
  yn = amp*cos(a*count*0.75) + y;

  stroke(94, 238, 125, 190);
  line(x, y, xn, yn);
  
  
  fill(34, 45, 182, 125);
  stroke(125, 56, 71, 250);
  ellipse(xn, yn, 10, 10);
  

  
  if(count < 5){
    rodea(xn, yn, 20*count, a);
  }

}

