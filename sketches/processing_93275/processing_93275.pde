
float x, y;
int timer;

 
void setup () {
  size(900, 900);
  x = 0;
  y = 200;
  background(51);
  timer = 0;
}
 
void draw () {
  x = mouseX;
  y = mouseY;
 
  fill(177);
  stroke(x / 3, y /2, x-200);
  strokeWeight(random(0, 100));
  
  if((timer % 15) == 0){ 
    background(51);
  rect(random(0, 800), random(0, 800), random(20,150),random(20,150));
  }
  text("Keep moving mouse to change colour....", 100,20);
  timer ++; 
}


