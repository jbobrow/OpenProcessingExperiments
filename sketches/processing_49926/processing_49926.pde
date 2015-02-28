
float radius = 5;
int centX = 250;
int centY = 150;
float ang = 0;
float noiseFactor = random(10);
float size = 20;
float gval = 0;

void setup(){
size(500,300);
background(255);
strokeWeight(3);
smooth();
}

void draw(){
float x,y;
if (radius*2 < width+size){
  float rad = radians(ang);
  x = centX + (radius * cos(rad));
  y = centY + (radius * sin(rad));
  noiseFactor += 0.5;
  stroke(gval);
  fill(gval);
  ellipse(x,y,size, size);
  float angNoise = 10 + (noise(noiseFactor)*15);
  ang+=angNoise;
  radius+=1;
  size+=0.5;
  gval+=1;
}
}

