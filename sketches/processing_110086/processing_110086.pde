
float cc =1;

void setup(){
  size(600, 600);;
  background(HSB, 50, 20, cc);
  frameRate(20);
 
}

void draw(){
  cc = cc + .1;
  fill(HSB, cc, 20, 70);
  noStroke();
  ellipse(width/2, height/2, mouseX, mouseY);
  
}


