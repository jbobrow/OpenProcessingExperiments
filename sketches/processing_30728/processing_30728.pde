
float i;
void setup(){
  size(500,500);
  noStroke();
  smooth();
  background(255);
  i = 0;
}
void draw(){
  i++;
  fill(255,15);
  rect(0,0,width,height);
  fill(50,0,50);
  ellipse(noise(i / 100) * width, noise(i / 100 + width) * height, 3, 3);
}

