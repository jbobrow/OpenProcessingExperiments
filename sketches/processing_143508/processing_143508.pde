
int x=0;

void setup() { // runs once
  size(800,600);
}

void draw() {
  background(0); // draw black 
  x = x + 3;
  println(x);
  
  pushMatrix();
  translate(x,0); // moves the origin
  
  fill(0,0,255);
  stroke(204, 102, 0);
  strokeWeight(5);
  ellipse(400,300,100,100);
  rect(400,300,100,100);
  
  
  popMatrix();
 
  // GUI
  textSize(32);
  text("word", 10, 30); 
}

