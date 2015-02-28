
float x;
float y;
float r;
float g;
float b;
float a;

void setup(){
 size(320,240);
 frameRate(30);
}

void draw(){
  noStroke();
  x = random(width);
  y =random(height);
  
  r = random(255);
  g =random(255);
  b = random(255);
   a = random(255);
  
  fill(r,g,b,a);
  rect(x,y,30,30);
}
