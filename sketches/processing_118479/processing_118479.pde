
int x;
int y;
int counter;

void setup() {
  size(800,800);
  background(200);
  counter = 0;
}

void draw() {

  x = int(random(800));
  y = int(random(800));
  if (counter %15 == 0) {
  
  stroke(0);
  fill(255);
  ellipse(x,y,10,10);
  ellipse(x+20,y,10,10);
  ellipse(x-20,y,10,10);
  
 
}
counter++;
}


