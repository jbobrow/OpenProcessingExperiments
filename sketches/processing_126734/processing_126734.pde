
int x = 0;
int y = 0;

void setup(){
  size(250,250);
  background(255);
  frameRate(5);
}

void draw(){
  stroke(0);
  line(x,0,x,y);
  x=x+10;
  y=y+10;

  if (mousePressed){
    noStroke();
    float r = random(0,255);
    float g = random(0,255);
    float b = random(0,255);
    float w = random(0,255);
    float h = random(0,255);
    fill(r,g,b);
    rect(mouseX,mouseY,w,h);
  }
}


