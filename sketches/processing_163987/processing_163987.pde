
void setup() {
  size(600, 600);
  colorMode(HSB,255);
}

void draw() {
  
  background(0);
  float mappedSeconds = map(second(),0,60,0,255);
  color c = color(mappedSeconds,255,255);
  stroke(c);
  strokeWeight(30);
  noFill();
  float mappedArc = map(second(),0,59,360,0);
  arc(300, 300, 300, 300, radians(0), radians(mappedArc));
  
  rotate(radians(45));
  rect(0,0,300,300);
  rect(300,0,300,300);  
  
  //pushMatrix();
  //translate(width/2, height/2); //find center of rotation
  //rotate(radians(45)); //rotation
  //scale(2); //use scale to find the center point of your system
  //rect(0,0,300,300);
  //popMatrix();
  
}

