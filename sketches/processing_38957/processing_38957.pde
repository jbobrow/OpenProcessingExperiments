
void setup(){
  size(400,400);
  background(0);
}
void draw() {
  stroke(200,180,random(0));
  smooth();
  strokeWeight(1);
  line(50,50, random(400), random(400));
  
  stroke(0,random(75),55);
  smooth();
  strokeWeight(3);
  line(200,200, random(400), random(400));
}

