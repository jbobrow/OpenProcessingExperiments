
void setup() {
  size(400,400);
  background(255);
}
 
void draw() {
  float x = random(0, width);
  float y = random(0, height);
 
  if ((x>200 && x<200) && (y>200 && y<200)) {
    ;}
    else{
      noStroke();
      fill(random(x-300,width),50, random(y-300,height),50);
      rect(x, y, 20,20);
    }
}
