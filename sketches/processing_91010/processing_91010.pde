
PImage myImage;
float a = 0.0;
float inc = TWO_PI/50;
float prev_x = 0, prev_y = 300, x, y;
int d = 200;
int r = 100;
float amp = 300;
int strokeColor = 128;

void setup(){ 
  size(800, 600);
  myImage = loadImage("url-4.jpg");
  background(0);
  stroke(255);
  for(int i=0; i<800; i=i+4) {
    x = i;
    y = 300 + sin(a) * 80.0 + random(4);
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}
void keyPressed() {
  strokeColor = int(random(255));
}

void draw(){
  if(mousePressed) {
    
 background(255,100,100);
  }
  else{
    background(0);
  }
  color red = color(100,0,0);
  stroke(strokeColor);
  prev_x = 0;
  prev_y = 300;
  for(int i=0; i<800; i=i+4) {
    x = i;
    y = amp + cos(a) * 80.0 + random(random(50));
    line(prev_x, prev_y, x, y);
    
    stroke(strokeColor);
    y = mouseX + sin(a) * 80.0 + random(random(mouseY));
    line(prev_x, prev_y, x, y);
    
    prev_x = x;
    prev_y = y;
    
    a = a + inc;

  }
  stroke(150);
  fill(strokeColor,132,0);
  ellipse(d,r , 75, 75);
  fill(int(random(0,r)),int(random(0,r)),int(random(0,r)));
  ellipse(d,100, 25, 25);
  stroke(150);
  fill(strokeColor,132,0);
  ellipse(600,100 , 75, 75);
  fill(int(random(0,r)),int(random(0,r)),int(random(0,r)));
  ellipse(600,100, 25, 25);
}

