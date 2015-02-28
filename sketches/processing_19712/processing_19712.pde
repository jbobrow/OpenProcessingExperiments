
void setup(){
  size(250, 250);
  smooth();
  background(250);
}

void draw(){
  for(int x = 10; x < 250; x += 4)
  {
  stroke(255);
  line(125, x, 250, 125);
  line(0, 125, 125, x);
  }
  
  for(int x = 0; x < 40; x += 10)
  {
  noFill();
  stroke(100, 250, 100, random(250));
  bezier(0, 125, 125, random(250), 125, random(250), 250, 125);
  }
}

// Two are fighting

