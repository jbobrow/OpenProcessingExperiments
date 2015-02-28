
void setup() {
  size(500, 500);
  background(30);

  mouseX=width/300; 
  mouseY=height/200;
}


void draw() {
  if (mousePressed) {
    float r= random (50);
    fill(134, 86, 198, random(100));
    rect (mouseX, mouseY, r, r);
  }
  else { 
    float vel = 0;
    vel = dist(mouseX, mouseY, pmouseX, pmouseY);
    println(vel);
    rect(width/3, height/3, vel, vel);
    fill(61, 244, 134, random(250));
  }
}
