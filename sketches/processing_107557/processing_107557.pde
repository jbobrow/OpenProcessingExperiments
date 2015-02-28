
float vel = 0;
int alterna = 0;
void setup () {
  size(800, 600);
  noStroke();
}
void draw() {


  vel = dist(mouseX, mouseY, width/2, height/2);
  if (alterna==0) {
    fill(0, 127, 0);
    alterna=1;
  }
  else {
    fill(127, 0, 0);
    alterna=0;
  }
  ellipse((width/2)+10, height/2, vel-30, vel-30);

  vel = dist(mouseX, mouseY, width/2, height/2);
  if (alterna==0) {
    fill(0, 0, 127);
  }
  else {
    fill(0, 100, 100);
  }

  ellipse((width/2)+200, (height/2)+200, vel-30, vel-30);
  
  vel = dist(mouseX, mouseY, width/2, height/2);
  if (alterna==0) {
    fill(0);
  }
  else {
    fill(127);
  }

  ellipse((width/2)-200, (height/2)-200, vel-30, vel-30);
}
