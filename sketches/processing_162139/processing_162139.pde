
int height = 250;
int width = 250;

void setup() {
  size(width, height);
  background(255);  //set background white
  
  //Square
  fill(0);
  rect(0,0,width/2,height/2);
  fill(100);
  rect(width/2,height/2,width/2,height/2);
  //Circle
  fill(150);
  ellipseMode(CENTER);
  ellipse(width/2,height/2, 50, 50);
}

void draw() { 
}
