

float t = 0.0;
float x,y;
float w = 1;
float theta = 0;

void setup() {
  size(800,400,P2D);//
  background(30);
}

void draw() {
  
  float a1 = 6;
  float a2 = 15;
  float c = 255;
  
  for (float i = 2; i < width; i++) {
    //painting
    rotate(theta);
    fill(random(i),random(i),random(i/1.5),random(0,a2));
    ellipse(0,y,w + random(i/10)*0.01,random(i/3));
    //draw lines
    noStroke();
    rotate(t*15);
    stroke(255,random(0,a1));
    line(0,y,width*1.5,height/2);
    //about move   
    x = sin(t)-theta;
    y = sin(t)+theta;
    w = random(theta/2.5);
    theta += 0.007;
    a1 -= 0.001;
    a2 -= 0.01;
  }
  if(t == width*0.75)
   noLoop();
}

