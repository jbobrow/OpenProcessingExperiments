
void setup(){
  size(250,250);
  background(0);
  smooth();

}
void draw(){
  stroke(random(255),random(255),random(255));
  noFill();
  bezier (random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
    stroke(255,60);
    fill(0);
    ellipse(random(width),random(height),25,25);
       rect(random(width),random(height),25,25);

}



