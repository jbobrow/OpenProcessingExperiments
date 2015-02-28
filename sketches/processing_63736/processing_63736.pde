


PImage ref;

void setup() {
  
  size(640,254);
  smooth();
  
  ref = loadImage("M.png");
}

void draw() {
  
  float xpos =  random( width);
  float ypos = random( height);
  
  color temp = ref.get(int(xpos), int(ypos));
  if(blue(temp) <100)
  {
    float s = random(5,50);
    ellipse(xpos, ypos, s, s);
  
  }
  
}

