
void setup (){
  size (400,400);
  background (255);
rect (10,10,380,380);
}

void draw(){
}

void mouseClicked () {
  for (int i = 0; i < 300; i++) {
  float x= random(12,379);
  float y= random(12,379);
  fill(0);
  ellipse(x,y,2,2);
  }
 }

  void mousePressed (){
   fill(255);
 rect (10,10,380,380);
  }
