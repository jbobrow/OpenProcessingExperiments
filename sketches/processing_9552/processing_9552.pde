
  float x = 1;
  
void setup() {
  size(400,400);
  background(random(255),random(255),random(255));
  noStroke();
 
  frameRate(50);
   println(x);
}

void draw() {
   //background(random(255),random(255),random(255));
 //x=1;
 x = random(200);
 println(x);
 colorMode(HSB);
  fill(255,random(255),255); 
  ellipse(random(width),random(height),x,x);
}

