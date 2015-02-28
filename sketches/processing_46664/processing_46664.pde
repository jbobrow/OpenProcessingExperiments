


void setup() {
  size(1000,550);  
  
}

void draw() {
  colorMode(HSB); 
  smooth();
  background(0);
 
  

  frameRate(4);
  strokeWeight(1);
  noFill();
  stroke(random(255), random(255), random(255), random(150));
fill(random(255), random(255), random(255), random(20));


  float b = 0.0;
float inc = TWO_PI/50.0;
{
for(int i=25; i<600; i=i+1) {
  ellipse(i++, 125, i++, 125+sin(b)*125.0);
  b = b + mouseX * mouseY ;
    if(mousePressed)
  rect(i++, 175, i++, 1+sin(b)*50.0);
 
}


if(keyPressed) {
  frameRate(1);
}


fill(random(255), random(255), random(255), random(20));

  float n = 0.0;
float inj = TWO_PI/50.0;
{
for(int i=25; i<500; i=i+1) {
  rect(i++, 274, i++, 100+sin(n)*125.0);
  n = n + mouseX * mouseY ;
  if(mousePressed)
  rect(i++, 295, i++, 1+sin(n)*50.0);
}



}

}}

