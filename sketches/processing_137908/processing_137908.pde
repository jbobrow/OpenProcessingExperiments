
float [] Disney = new float[6];

void setup(){
  size(300,300);
  smooth();
}

void draw(){
  background(0);
  ellipse(150,150,20,20);
  fill(random(255),0,0);
  ellipse(150,160,20,20);
  fill(random(255),0,0);
  ellipse(160,160,20,20);
  fill(random(255),0,0);
  println("Disney");
}
