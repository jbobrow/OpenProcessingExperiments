
float Radius = 120;

void setup(){
  size(600, 600);
   smooth();

  frameRate(10);
  background(0);
}


void draw() {
  
  noStroke();
  
  fill(0,12);
  rect(0, 0, width, height);

  //ellipse
  
  float centerX = ((height/2) + (random(-1,1)* (height/11)));
  float centerY = ((width/2) + (random(-1,1)* (width/12)));
  
  //stroke(250);
  //strokeWeight(1);
  //noFill();
  fill(250, 70);
  ellipse(centerX, centerY, Radius, Radius);
}
 



