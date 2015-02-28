
int x;
int y;
int savedTime;
int totalTime = 500;

void setup() {
  size(800,800);
  background(200);
  savedTime = millis();
}

void draw() {
  
  x = int(random(800));
  y = int(random(800));
  
   
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    
  stroke(0);
  fill(255);
  ellipse(x,y,10,10);
  ellipse(x+20,y,10,10);
  ellipse(x-20,y,10,10);
  savedTime = millis();
  }
}


