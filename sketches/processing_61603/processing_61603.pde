
float a = 0.0;
float s = 0.0;


void setup(){
  size(600,600);
  noStroke();
  textMode(CENTER);
  frameRate(70);  
}

void draw(){
  
  background(0, random(20),100);
  
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s);
  fill(255,255,255);
  text("depth",40,20);
}

