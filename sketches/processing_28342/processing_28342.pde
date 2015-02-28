
void setup() {
  background(255);
  frameRate(30);
  size(500,350);
  smooth();
}
void draw() {
  for (int x=0; x<width+40; x=x+40)
  {
    for (int y=0; y<height+20; y=y+40)
    {
      fill(255,10);
      noStroke();
      strokeWeight(0);
      ellipse(x,y,40,40);
    }
  }
  float a = random (-50,50);
  float b = random (-50,50);
  float c = random (0,5);
  float d = random (-50,50);
  float e = random (-50,50);
  stroke(100,99,99);
  
  for (float f=0; f<3; f=f+0.5)
  {
    float g=f%c;
    strokeWeight(g);
  }
  line(mouseX+a,mouseY+b,width-mouseX-d,height-mouseY-e);
}
void mouseClicked() {
  background(255);
}

