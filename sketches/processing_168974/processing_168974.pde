
int savedTime;
int totalTime = 100;
float x;
float y;

void setup() {
  size(200,200);
  background(195);
  savedTime = millis();
  
}
void draw() {
  x = random(width);
  y = random(height);
  int passedTime = millis() - 8*savedTime;
  if (passedTime > totalTime){
    stroke(0);
    fill(color(random(255),random(255),random(255)));
    rectMode(CENTER);
    rect(x,y,8,8);
    rect(x-8,y,8,8);
    rect(x+8,y,8,8);
  
}
}
