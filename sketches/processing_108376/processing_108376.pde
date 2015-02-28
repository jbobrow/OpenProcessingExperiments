
float vel=5;
void setup() {
  size(650, 650);
  background(205, 255, 59);
  noCursor();
}

void draw () {
 vel=dist(mouseX,mouseY,pmouseX,pmouseY);
  if (mousePressed){
    background (70,255,241);
    if (mousePressed) {
   ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
     fill(40,240,86);
  ellipse(mouseX,mouseY,80,80);
  fill(234,24,140);
  ellipse(mouseX,mouseY,50, 50);
    float vel = 500;
    translate(width, height);
    }
   }
  else {
    float vel = 0;
    vel=dist(mouseX, mouseY, pmouseX, pmouseY);
    background(205, 255, 59);
    ellipse(mouseX,mouseY,vel,vel);
    fill (180,27,86);
    ellipse(mouseX,mouseY,vel,vel);
    fill (255, 103, 192);
  }
}
