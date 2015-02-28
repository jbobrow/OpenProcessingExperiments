
float x = 0;
float a = 0;
float a1 = 0;
float b = 0;
float c = 0;


void setup() {
size(400,400);
background(50,255);
colorMode(HSB,100);
noStroke();
}

void draw() {

  
   float y = map(sin(a) * sin(a)*cos(a), -1, 1, 50, width-30);
  float z = map(sin(a1) * sin(a), -1, 1, 250, height -30);
  
  float w = map(sin(c) * sin(a*1.5), -1, 1, 250, 30);
  float x2 = map(sin(a1) * cos(b), -1, 1, 250, 30);
  
  float col = map(sin(a*0.03), -1,1,0,100);
  float bri = map(sin(c*0.75),-1,1,10,100);
  
  stroke(col,80,80,20);
  fill(col,50,bri);
  ellipse(x,z, random(100),random(20));
 
  rect(x,z, x2, random(30));
  strokeWeight(3);
  line(y,z,w,x2);
  line(x2,w,x,y);
  
  point(x,z);
  x = x + 5;

  a = a + 0.03;
  a1 = a1 + 0.05;
  b = b + 0.02;
  c = c + 0.08;
  
  col = col + 1;
  if (col > 100) {
    col = 0;
  }
  


}
