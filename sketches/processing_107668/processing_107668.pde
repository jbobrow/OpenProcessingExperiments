
float vel = 0;
void setup() {
  size(800,800);
  background (255);
  noCursor();
}
void draw() {
  
  
  vel = dist(mouseX,mouseY,pmouseX,pmouseY);
  fill(255,5);
  noStroke ();
  rect(0,0, width,height);
  translate (width/2,-width/4);
  rotate (PI/4);
  stroke(vel,vel,vel);
  strokeWeight (vel);
   line((mouseX/2)+(mouseX/4),(mouseY/2)+(mouseY/4),width/2,height/2);
   line((mouseY/2)+(mouseY/4),(mouseX/2)+(mouseX/4),width/2,height/2);
  
}
