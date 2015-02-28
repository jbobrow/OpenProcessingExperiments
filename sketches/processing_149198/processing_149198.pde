


void setup(){
  size(450,450);
  frameRate(30);
  smooth();
  background(255);

  stroke(0,120);
  colorMode(HSB,360,100,100);
  }

void draw(){
float d=random(50);
fill(random(360),100,100,100);
 
rect(random(450),random(450),d,d);

}

