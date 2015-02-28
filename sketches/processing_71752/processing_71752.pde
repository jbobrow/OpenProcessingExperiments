
void setup(){
  size (640,480);
  background(255);
   smooth();
   noStroke();
}

void draw(){

  fill(random(0,255), random(0,50),random(0,50), random(0,100));
  ellipse(random(width),random(height),random(100),random(100));
}
