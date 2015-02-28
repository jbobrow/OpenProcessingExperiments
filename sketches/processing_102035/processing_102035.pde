
void setup(){
  background(255);
  size(500, 500);
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  noStroke();
}
boolean signal = false;
boolean bubble = false;
int cenX = 0;
int cenY = 0;
int time = 0;
int timepassed = 0;
color col = 0;
void draw(){
  timepassed = frameCount - time;
  if(signal == true){
    bubble = true;
    signal = false;
  }
  if(bubble == true){
    fill(col, 3);
    ellipse(cenX, cenY, timepassed, timepassed);
    if(timepassed > width*2 && timepassed > height*2) bubble = false;
  }
}

void mousePressed(){
  col = color(random(100), 100, 100);
  signal = true;
  time = frameCount;
  cenX = mouseX;
  cenY = mouseY;
}
void keyPressed(){
  bubble = false;
  if(key == TAB)
    background(0, 0, 100);
}


